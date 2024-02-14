from decimal import Decimal
from typing import List

from django.conf import settings
from django.utils.translation import gettext_lazy as _
from django.utils import timezone

from rest_framework import status
from rest_framework.viewsets import ViewSet
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.decorators import action

from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)

from api.core.serializers import (
    CreateSaleSerializer,
    SaleSerializer,
)
from api.payment_method.cash.serializers import (
    CashCreateResponseSerializer,
)
from api.payment_method.utils import (
    is_seller_user,
    create_hash_id,
)
from core.models import CashRegister, CashRegisterOperation, Passenger, Sale, Ticket
from users.models import CustomUser
from core.services import DiscountService
from crew.models import Personal


@extend_schema_view(
    pay=extend_schema(
        request=CreateSaleSerializer,
        responses=CashCreateResponseSerializer,
        tags=["Payment Method"],
        methods=["POST"],
        description=_("This endpoint required a Seller user")
    ),
)
class CashViewSet(ViewSet):

    @action(
        detail=False,
        methods=["POST"],
        url_path="pay",
        url_name="pay",
    )
    def pay(self, request: Request):
        if not is_seller_user(request.user):
            return Response({"message": _("Only Sellers users can register a cash payment")}, status=status.HTTP_401_UNAUTHORIZED)

        sale_serializer = CreateSaleSerializer(data=request.data)

        if sale_serializer.is_valid():
            sale_validated = sale_serializer.validated_data

            # Send create transaction to transbank
            coupon_code = sale_validated.pop("coupon_code", None)
            try:
                cash_register = (
                    sale_validated.get("cash_register_id")
                    or CashRegister.objects.filter(name=settings.WEB_CASH_REGISTER_NAME).last()
                )
                sale_validated["cash_register"] = cash_register
            except CashRegister.DoesNotExist:
                cash_register = None
            branch_id = cash_register.branch_id if cash_register else None
            try:
                amount = Decimal(0)
                discount_service = DiscountService()
                for ticket in sale_validated["tickets"]:

                    personal = Personal.objects.filter(
                        user__document_number=ticket["passenger"]["user"]["document_number"]
                    ).first()
                    personal_position = (
                        personal.positions.filter(personalposition__status=2).first() if personal else None
                    )  # 2 = position is active

                    discount = discount_service.get_discount(
                        coupon_code=coupon_code,
                        rut=ticket["passenger"]["user"]["document_number"],
                        service_id=ticket["service"].id,
                        branch_office=branch_id,
                        position=getattr(personal_position, "position_id", None),
                    )
                    discount_value = discount_service.get_discount_value(discount, ticket["price"])
                    if discount_value:
                        discount.count_uses += 1
                        discount.save()
                    ticket["price"] = Decimal(ticket["price"]) - discount_value
                    ticket["discount"] = discount_value
                    amount += ticket["price"]

                buy_order = sale_validated.get("buy_order") or create_hash_id()

                new_tickets = self.add_tickets(sale_validated)
                new_sale = self.save_sale(new_tickets, sale_validated, buy_order)

                self.register_cash_register_operation(sale_validated, new_sale, amount)
                response = CashCreateResponseSerializer(data={"sale_id": new_sale.id, "buy_order": buy_order})
                if response.is_valid():
                    return Response(response.data, status=status.HTTP_201_CREATED)
            except Exception as e:
                print(e)
                return Response({"message": _("Payment has failed")}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response(sale_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def register_cash_register_operation(self, sale_validated: dict, sale: Sale, amount: Decimal):
        if "cash_register" in sale_validated:
            operation_data = {
                "operation_description": CashRegisterOperation.CashRegisterSubOperation.CASH,
                "operation_type": CashRegisterOperation.OperationType.IN,
                "amount": amount,
                "cash_register": sale_validated["cash_register"],
                "sale": sale,
            }
            # TODO: Increment impressions
            CashRegisterOperation.objects.create(**operation_data)

    def save_sale(self, new_tickets: List[Ticket], sale_validated: dict, buy_order: str) -> Sale:
        sale_validated.pop("tickets")

        sale_validated["buy_order"] = buy_order
        sale_validated["payment_date"] = timezone.now()
        if "seller_id" in sale_validated:
            sale_validated["seller"] = sale_validated.pop("seller_id")
        if "cash_register_id" in sale_validated:
            sale_validated["cash_register"] = sale_validated.pop("cash_register_id")

        tickets_id = list(map(lambda t: t.id, new_tickets))

        new_sale: Sale = Sale.objects.create(**sale_validated)
        new_sale.add_tickets(tickets_id)

        return new_sale

    def add_tickets(self, sale_validated: dict) -> List[Ticket]:
        # save sale model to db
        tickets = sale_validated["tickets"]
        new_tickets: List[Ticket] = []
        for ticket in tickets:
            # check if passenger exists
            passenger = ticket["passenger"]

            registered_passenger: Passenger = Passenger.objects.filter(
                user__document_number=passenger["user"]["document_number"]
            ).first()

            if registered_passenger is not None:
                registered_passenger.user.first_name = passenger["user"]["first_name"]
                registered_passenger.user.last_name = passenger["user"]["last_name"]
                registered_passenger.user.date_of_birth = passenger["user"]["date_of_birth"]

                if "nationality" in passenger:
                    registered_passenger.user.nationality_id = passenger["user"]["nationality"]

                registered_passenger.user.email = passenger["user"]["email"]
                registered_passenger.user.cellphone = passenger["user"]["cellphone"]
                registered_passenger.user.save()
                ticket["passenger"] = registered_passenger
            else:
                user, _ = CustomUser.objects.get_or_create(
                    username=passenger["user"]["username"],
                    defaults=passenger["user"],
                )
                passenger["user"] = user
                ticket["passenger"], _ = Passenger.objects.get_or_create(user_id=user.id, defaults=passenger)
            # create ticket
            service = ticket.pop("service")
            seat = ticket.pop("seat")
            ticket["service_id"] = service.id
            ticket["seat_id"] = seat.id
            # ticket["start_bus_stop_id"] = start_bus_stop.id
            # ticket["end_bus_stop_id"] = end_bus_stop.id
            new_ticket: Ticket = Ticket.objects.create(**ticket)
            new_tickets.append(new_ticket)
        return new_tickets
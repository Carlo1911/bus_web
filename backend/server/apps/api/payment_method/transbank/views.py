from decimal import Decimal
from smtplib import SMTPException
from typing import List

from django.shortcuts import redirect
from django.conf import settings
from django.utils import timezone
from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.viewsets import ViewSet
from transbank.error.transaction_commit_error import TransactionCommitError
from transbank.error.transaction_create_error import TransactionCreateError
from transbank.error.transaction_refund_error import TransactionRefundError
from transbank.webpay.webpay_plus.transaction import Transaction

from api.core.serializers import (
    CreateSaleSerializer,
    SaleSerializer,
)
from api.payment_method.transbank.serializers import (
    PaymentUtils,
    TransbankCommitRequestSerializer,
    TransbankConfirmResponseSerializer,
    TransbankCreateResponseSerializer,
    TransbankRefundResponseSerializer,
    TransbankStatusResponseSerializer,
    TransbankRefundSerializer,
    TransbankStatusRequestSerializer,
)
from api.payment_method.utils import create_hash_id
from core.models import (
    CashRegister,
    CashRegisterOperation,
    Passenger,
    RecoverableError,
    Sale,
    Ticket,
)
from core.services import DiscountService
from crew.models import Personal
from mongodb.models import (
    PaymentConfirmation,
    PaymentIntention,
    Refund,
)
from users.models import CustomUser


@extend_schema_view(
    pay=extend_schema(
        request=CreateSaleSerializer,
        responses=TransbankCreateResponseSerializer,
        tags=["Payment Method"],
        methods=["POST"],
    ),
    commit=extend_schema(
        parameters=[
            TransbankCommitRequestSerializer,
        ],
        responses={301: None},
        tags=["Payment Method"],
        methods=["POST", "GET"],
        description="This endpoint is used by transbank to commit transaction"
    ),
    status=extend_schema(
        parameters=[
          TransbankStatusRequestSerializer,
        ],
        responses=TransbankStatusResponseSerializer,
        tags=["Payment Method"],
        methods=["GET"],
    ),
    refund=extend_schema(
        request=TransbankRefundSerializer,
        responses=TransbankRefundResponseSerializer,
        tags=["Payment Method"],
        methods=["POST"],
        description="This endpoint requires staff access permissions",
    ),
)
class TransbankViewSet(ViewSet):

    @action(
        detail=False,
        methods=["POST"],
        url_path="pay",
        url_name="pay",
    )
    def pay(self, request: Request):
        sale_serializer = CreateSaleSerializer(data=request.data)

        if sale_serializer.is_valid():
            sale_validated = sale_serializer.validated_data
            # start_bus_stop = sale_validated.pop("start_bus_stop_id", None)
            # end_bus_stop = sale_validated.pop("end_bus_stop_id", None)

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

                if sale_validated.get("payment_method").lower() == "webpay":
                    create_request = PaymentUtils.create_transaction_request(amount)
                    transaction_create_response = Transaction.create(
                        buy_order=create_request.buy_order,
                        session_id=create_request.session_id,
                        amount=create_request.amount,
                        return_url=create_request.return_url,
                    )
                    buy_order = create_request.buy_order
                    data = {
                        "buy_order": buy_order,
                        **transaction_create_response.__dict__,
                    }
                else:
                    buy_order = sale_validated.get("buy_order") or create_hash_id()
                    data = {
                        "buy_order": buy_order,
                        "token": buy_order,
                        "url": buy_order,
                    }

                new_tickets = self.add_tickets(sale_validated)
                new_sale = self.save_sale(new_tickets, sale_validated, buy_order)
                data["sale_id"] = new_sale.id
                transbank_serializer = TransbankCreateResponseSerializer(data=data)

                #  TODO: add metrics +1 payment intentions in prometheus
                if transbank_serializer.is_valid():
                    if sale_validated.get("payment_method").lower() == "webpay":
                        sale_json = SaleSerializer(new_sale)
                        clean_sale_data = dict(sale_json.data)
                        clean_response_data = dict(transbank_serializer.data)

                        try:
                            intention_document = PaymentIntention(
                                buy_order=buy_order,
                                sale=clean_sale_data,
                                payment_method_request=create_request.__dict__,
                                payment_method_response=clean_response_data,
                            )

                            intention_document.save()
                        except Exception as e:
                            RecoverableError.objects.create(
                                code="SAVE_TRANSBANK_PAY_MONGODB_ERROR",
                                params={"buy_order": buy_order},
                                metadata={
                                    "buy_order": buy_order,
                                    "sale": clean_sale_data,
                                    "payment_method_request": create_request.__dict__,
                                    "payment_method_response": clean_response_data,
                                },
                                message=str(e),
                            )

                    # self.register_cash_register_operation(sale_validated, new_sale, amount)
                    return Response(transbank_serializer.data, status=status.HTTP_201_CREATED)
            except TransactionCreateError as e:
                # TODO: Add metrics
                return Response(e.message, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        return Response(sale_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def register_cash_register_operation(self, cash_register: dict, sale: Sale, amount: Decimal):
        if cash_register is not None:
            operation_data = {
                "operation_description": CashRegisterOperation.CashRegisterSubOperation.WEBPAY,
                "operation_type": CashRegisterOperation.OperationType.IN,
                "amount": amount,
                "cash_register": cash_register,
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

    @action(
        detail=False,
        methods=["POST", "GET"],
        url_path="commit",
        url_name="commit",
    )
    def commit(self, request: Request):
        commit_request = TransbankCommitRequestSerializer(data=request.query_params)
        if commit_request.is_valid():
            try:
                # TODO: add metrics
                validated_commit = commit_request.validated_data
                transaction_commit_response = Transaction.commit(validated_commit["token_ws"])

                transaction_commit_data = transaction_commit_response.__dict__
                transaction_commit_data["card_detail"] = transaction_commit_response.card_detail.__dict__
                response_serializer = TransbankConfirmResponseSerializer(data=transaction_commit_data)

                if response_serializer.is_valid():
                    try:
                        buy_order = response_serializer.data["buy_order"]
                        confirmation = PaymentConfirmation(
                            buy_order=buy_order,
                            payment_method_request=dict(response_serializer.data),
                            payment_method_response=commit_request.validated_data,
                        )

                        confirmation.save()
                        # TODO: update sale status
                    except Exception as e:
                        RecoverableError.objects.create(
                            code="SAVE_TRANSBANK_COMMIT_MONGODB_ERROR",
                            params={"buy_order": buy_order},
                            metadata={
                                "buy_order": buy_order,
                                "payment_method_request": dict(response_serializer.data),
                                "payment_method_response": commit_request.validated_data,
                            },
                            message=str(e),
                        )

                    buy_order = response_serializer.data["buy_order"]
                    sale = Sale.objects.prefetch_related("tickets").get(buy_order=buy_order)

                    if transaction_commit_response.status == "FAILED":
                        sale.status=Sale.Status.REJECTED
                        sale.save()
                        return redirect("%s?buy_order=%s&status=%s"%(settings.TRANSBANK_FINAL_URL, sale.buy_order, Sale.Status.REJECTED))

                    amount = Decimal(0)
                    for ticket in sale.tickets.all():
                        try:
                            ticket.send_mail(buy_order=buy_order)
                            amount += ticket.price
                            ticket.ticket_status = Ticket.TicketStatus.ACTIVE
                            ticket.save()
                        except SMTPException as e:
                            RecoverableError.objects.create(
                                code="SEND_TICKET_CONFIRMATION_SENDGRID_ERROR",
                                params={"buy_order": buy_order},
                                metadata={"ticket_id": ticket.id, "buy_order": buy_order},
                                message=str(e),
                            )
                            continue

                    sale.status=Sale.Status.PAID
                    sale.save()
                    try:
                        cash_register = CashRegister.objects.filter(name=settings.WEB_CASH_REGISTER_NAME).last()
                    except CashRegister.DoesNotExist:
                        cash_register = None
                    self.register_cash_register_operation(cash_register, sale, amount)
                    return redirect("%s?buy_order=%s&status=%s"%(settings.TRANSBANK_FINAL_URL, sale.buy_order, Sale.Status.PAID))
            except TransactionCommitError as e:
                # TODO: add metrics
                return redirect("%s?buy_order=%s&status=%s"%(settings.TRANSBANK_FINAL_URL, None, Sale.Status.ERROR))
        
        # Probably client cancel request
        if "TBK_TOKEN" in request.query_params:
            return redirect("%s?buy_order=%s&status=%s"%(settings.TRANSBANK_FINAL_URL, request.query_params["TBK_ORDEN_COMPRA"], Sale.Status.CANCELLED))

        return redirect("%s?buy_order=%s&status=%s"%(settings.TRANSBANK_FINAL_URL, None, Sale.Status.PENDING))

    def get_payment_details(self, buy_order: str):
        try:
            response = PaymentConfirmation.objects.filter(buy_order=buy_order)
            if response.count() > 1:
                return response[0].payment_method_request
            if response.count() == 1:
                return response[0].payment_method_request
            return None
        except PaymentConfirmation.DoesNotExist:
            return None

    @action(
        detail=False,
        methods=["GET"],
        url_path="status",
        url_name="status"
    )
    def status(self, request: Request):
        status_request = TransbankStatusRequestSerializer(data=request.query_params)
        if status_request.is_valid():
            try:
                validated_status = status_request.validated_data
                sale = Sale.objects.get(buy_order=validated_status["buy_order"])
                sale_dict = sale.__dict__
                sale_dict["details"] = self.get_payment_details(buy_order=sale.buy_order)
                response_serialized = TransbankStatusResponseSerializer(data=sale_dict)
                if response_serialized.is_valid():
                    return Response(response_serialized.data, status=status.HTTP_200_OK)
                
                return Response(response_serialized.errors, status=status.HTTP_400_BAD_REQUEST)

            except Sale.DoesNotExist:
                return Response({"message": "Sale does not exists"}, status=status.HTTP_404_NOT_FOUND)

        return Response(status_request.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(
        detail=False,
        methods=["POST"],
        url_path="refund",
        url_name="refund",
    )
    def refund(self, request: Request):
        if not request.user.is_staff:
            return Response({"message": "Only staff members can access"}, status=status.HTTP_401_UNAUTHORIZED)

        refund_request = TransbankRefundSerializer(data=request.data)

        if refund_request.is_valid():
            refund_validated_data = refund_request.validated_data

            try:
                # TODO: add metrics
                token = refund_validated_data["token"]
                amount = refund_validated_data["amount"]
                buy_order = refund_validated_data["buy_order"]

                refund_response = Transaction.refund(
                    token=token,
                    amount=amount,
                )

                response_serializer = TransbankRefundResponseSerializer(data=refund_response.__dict__)

                if response_serializer.is_valid():
                    try:
                        refund_document = Refund(
                            buy_order=buy_order,
                            token=token,
                            amount=amount,
                            payment_method_request=dict(refund_request.data),
                            payment_method_response=dict(response_serializer.data),
                        )

                        refund_document.save()
                    except Exception as e:
                        RecoverableError.objects.create(
                            code="SAVE_TRANSBANK_REFUND_MONGODB_ERROR",
                            params={"buy_order": buy_order},
                            metadata={
                                "buy_order": buy_order,
                                "token": token,
                                "amount": amount,
                                "payment_method_request": dict(refund_request.data),
                                "payment_method_response": dict(response_serializer.data),
                            },
                            message=str(e),
                        )

                    return Response(response_serializer.data, status=status.HTTP_201_CREATED)
            except TransactionRefundError as error:
                # TODO: add metrics
                return Response({"message": "It is not possible to reverse this transaction"}, status=status.HTTP_400_BAD_REQUEST)
        return Response(refund_request.errors, status=status.HTTP_400_BAD_REQUEST)

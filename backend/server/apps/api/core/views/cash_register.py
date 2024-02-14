from decimal import Decimal

from django.db.models import Q
from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import (
    OpenApiParameter,
    extend_schema,
    extend_schema_view,
)
from rest_framework import (
    status,
    viewsets,
)
from rest_framework.decorators import action
from rest_framework.parsers import JSONParser
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.request import Request
from rest_framework.response import Response

from api.core.filters import CashRegisterFilter
from api.core.serializers import (
    ActiveCashRegisterRequestSerializer,
    CashRegisterCashierRequestSerializer,
    CashRegisterCashierSerializer,
    CashRegisterMovementSerializer,
    CashRegisterOperationMovementSerializer,
    CashRegisterOperationReverseSerializer,
    CashRegisterOperationSerializer,
    CashRegisterSerializer,
    CloseCashRegisterSerializer,
    DashboardCashRegisterSerializer,
    DepositCashRegisterSerializer,
    OpenCashRegisterSerializer,
)
from core.models import (
    CashRegister,
    CashRegisterMovement,
    CashRegisterOperation,
    Sale,
    Ticket,
)
from core.utils import first_or_default
from utils.views import MultiSerializerViewSetMixin


@extend_schema_view(
    list=extend_schema(
        summary="List all cash registers",
        description="Return a list of all cash registers in the system.",
        tags=["Cash registers"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a Cash Register",
        description="Get details of a specific cash register",
        tags=["Cash registers"],
    ),
    create=extend_schema(
        summary="Create a Cash Register",
        description="Create a cash register",
        tags=["Cash registers"],
    ),
    update=extend_schema(
        summary="Update a Cash Register",
        description="Update details of a specific cash register",
        tags=["Cash registers"],
    ),
    partial_update=extend_schema(
        summary="Partial update a Cash Register",
        description="Update details of a specific cash register",
        tags=["Cash registers"],
    ),
    destroy=extend_schema(
        summary="Delete a Cash Register",
        description="Delete a specific cash register",
        tags=["Cash registers"],
    ),
)
class CashRegisterViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = CashRegister.objects.all().prefetch_related("cashier", "branch").order_by("id")
    filterset_class = CashRegisterFilter
    ordering_fields = ["id"]
    serializer_class = CashRegisterSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)
    parser_classes = (JSONParser,)
    serializer_action_classes = {
        "open_cash_register": OpenCashRegisterSerializer,
        "close_cash_register": CloseCashRegisterSerializer,
        "deposit_cash_register": DepositCashRegisterSerializer,
        "dashboard": DashboardCashRegisterSerializer,
    }

    @extend_schema(
        summary="Open cash register",
        description="Open a cash register to start accepting payments",
        tags=["Cash registers"],
    )
    @action(
        detail=False,
        methods=["post"],
        serializer_class=OpenCashRegisterSerializer,
        url_path="open",
        url_name="cash_register_open",
    )
    def open_cash_register(self, request):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            cash_register = serializer.save()
            cash_register.open_cash_register(serializer.validated_data.get("amount"))
            cash_serializer = CashRegisterSerializer(cash_register)
            return Response(cash_serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="Deposit and close cash register",
        description="Deposit using a voucher and close the cash register",
        tags=["Cash registers"],
    )
    @action(
        detail=True,
        methods=["post"],
        serializer_class=DepositCashRegisterSerializer,
        url_path="deposit",
        url_name="cash_register_deposit",
    )
    def deposit_cash_register(self, request, pk=None):
        cash_register = self.get_object()
        data = request.data
        data["cash_register"] = cash_register.pk
        serializer = self.get_serializer(data=data)
        if serializer.is_valid():
            valid_data = serializer.validated_data
            cash_register.deposit_cash_register(valid_data.get("voucher"))
            return Response(
                {"status": "Cash register deposited and closed"},
                status=status.HTTP_200_OK,
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="Close cash register",
        description="Close a cash register to stop accepting payments",
        tags=["Cash registers"],
    )
    @action(
        detail=True,
        methods=["post"],
        serializer_class=CloseCashRegisterSerializer,
        url_path="close",
        url_name="cash_register_close",
    )
    def close_cash_register(self, request, pk=None):
        cash_register = self.get_object()
        data = request.data
        data["cash_register"] = cash_register.pk
        serializer = self.get_serializer(data=data)
        if serializer.is_valid():
            cash_register.close_cash_register()
            return Response({"status": "Cash register closed"}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="dashboard cash register",
        description="Data necessary to show the dashboard cash register",
        tags=["Cash registers"],
        parameters=[
            OpenApiParameter(
                name="branch",
                type=OpenApiTypes.NUMBER,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="cashier",
                type=OpenApiTypes.NUMBER,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(
        detail=False,
        methods=["get"],
        serializer_class=DashboardCashRegisterSerializer,
        url_path="dashboard",
        url_name="cash_register_dashboard",
    )
    def dashboard(self, request):
        cashier = request.query_params.get("cashier")
        branch = request.query_params.get("branch")
        queryset = self.get_queryset().filter(cashier=cashier, branch=branch).last()
        serializer = self.get_serializer(queryset)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @extend_schema(
        summary="list of movements by cash register",
        description="list of movements by cash register",
        request=CashRegisterMovementSerializer,
        responses=CashRegisterOperationMovementSerializer(many=True),
        tags=["Cash registers"],
        methods=["GET"],
        parameters=[
            OpenApiParameter(
                name="cash_register_id",
                type=OpenApiTypes.NUMBER,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(
        detail=False,
        methods=["GET"],
        url_path="movements",
        url_name="movements",
        pagination_class=None,
    )
    def movements(self, request: Request):
        serializer = CashRegisterMovementSerializer(data=request.query_params)

        if serializer.is_valid():
            validated_data = serializer.validated_data
            cash_register_id: int = validated_data.get("cash_register_id")
            operations = CashRegisterOperation.objects.filter(cash_register__id=cash_register_id)
            movements = CashRegisterMovement.objects.filter(cash_register__id=cash_register_id)

            data_movements = []
            for movement in movements:
                dict_movement = {
                    "type": "movement",
                    "id": movement.id,
                    "payment_method": "efectivo",
                    "ticket_number": 0,
                    "date": movement.created_at,
                    "income": movement.amount if movement.amount is not None else Decimal(0),
                    "egress": 0,
                    "status": movement.status,
                }

                data_movements.append(dict_movement)

            data_operations = []
            for operation in operations:
                dict_return = {
                    "type": "operation",
                    "id": operation.id,
                    "ticket_number": operation.sale.tickets.count(),
                    "date": operation.created_at,
                    "status": operation.operation_type,
                    "buy_order": operation.sale.buy_order,
                }

                if operation.sale.payment_method is None:
                    dict_return["payment_method"] = "Sin metodo de pago"
                else:
                    dict_return["payment_method"] = operation.sale.payment_method

                if operation.operation_type == CashRegisterOperation.OperationType.IN:
                    dict_return["income"] = operation.amount if operation.amount is not None else Decimal(0)
                    dict_return["egress"] = 0
                elif operation.operation_type == CashRegisterOperation.OperationType.OUT:
                    dict_return["income"] = 0
                    dict_return["egress"] = operation.amount if operation.amount is not None else Decimal(0)

                data_operations.append(dict_return)

            total_data = data_movements + data_operations
            total_data.sort(key=lambda x: x["date"])
            return_data_serializer = CashRegisterOperationMovementSerializer(data=total_data, many=True)
            if return_data_serializer.is_valid():
                return Response(return_data_serializer.data, status=status.HTTP_200_OK)
            return Response(return_data_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="list of cash registers by branch office",
        description="list of cash registers by branch office",
        request=CashRegisterCashierRequestSerializer,
        responses=CashRegisterCashierSerializer(many=True),
        tags=["Cash registers"],
        methods=["GET"],
        parameters=[
            OpenApiParameter(
                name="branch_office_id",
                type=OpenApiTypes.NUMBER,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(
        detail=False,
        methods=["GET"],
        url_path="branch_office",
        url_name="branch_office",
    )
    def branch_office(self, request: Request):
        serializer = CashRegisterCashierRequestSerializer(data=request.query_params)

        data_list = []
        if serializer.is_valid():
            validated_data = serializer.validated_data
            branch_office_id = validated_data.get("branch_office_id")

            cash_registers = (
                CashRegister.objects.filter(branch_id=branch_office_id)
                .select_related("cashier", "branch")
                .order_by("id")
            )

            for cash_register in cash_registers:
                cash_register_serializer = {
                    "branch_office_id": branch_office_id,
                    "name": cash_register.name,
                }

                cashier_serializer = {
                    "cashier_id": cash_register.cashier.user.id,
                    "name": cash_register.cashier_fullname,
                }

                open_cash_register_movement = CashRegisterMovement.objects.filter(
                    Q(cash_register=cash_register) & Q(status=CashRegisterMovement.Status.OPEN)
                ).first()

                close_cash_register_movement = CashRegisterMovement.objects.filter(
                    Q(cash_register=cash_register) & Q(status=CashRegisterMovement.Status.BILLED)
                ).last()

                return_dict = {
                    "id": cash_register.id,
                    "cash_register": cash_register_serializer,
                    "cashier": cashier_serializer,
                    "start": open_cash_register_movement.created_at
                    if open_cash_register_movement is not None
                    else cash_register.created,
                    "end": close_cash_register_movement.created_at
                    if close_cash_register_movement is not None
                    else None,
                    "amount": cash_register.actual_amount,
                    "status": cash_register.status,
                }

                data_list.append(return_dict)

            page = self.paginate_queryset(data_list)
            if page is not None:
                serializer = CashRegisterCashierSerializer(page, many=True)
                return_data = self.get_paginated_response(serializer.data)
            else:
                return_data = CashRegisterCashierSerializer(data_list, many=True)

            return Response(return_data.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="reverse cash register movement",
        description="reverse cash register movement",
        request=CashRegisterOperationReverseSerializer,
        responses=CashRegisterOperationSerializer(many=False),
        tags=["Cash registers"],
        methods=["POST"],
    )
    @action(detail=False, methods=["POST"], url_path="reverse", url_name="reverse")
    def reverse(self, request: Request):
        serializer = CashRegisterOperationReverseSerializer(data=request.data)
        # TODO: agregar la validacion de 4 minutos para devolucion completa

        if serializer.is_valid():
            validated_data = serializer.validated_data
            buy_order: str = validated_data.get("buy_order")
            reverse_tickets = validated_data.get("tickets")
            tickets_ids: [int] = list(map(lambda d: d["ticket_id"], reverse_tickets))

            description: str = validated_data.get("description")
            sale: Sale = Sale.objects.filter(buy_order=buy_order).first()

            tickets = sale.tickets.filter(id__in=tickets_ids, ticket_status=Ticket.TicketStatus.ACTIVE)
            final_amount = 0
            for ticket in tickets:
                if reserved_seat := ticket.seat.seats.filter(reserve__service_id=ticket.service_id).first():
                    reserved_seat.delete()

                reverse_ticket = first_or_default(
                    lambda reverse_ticket: reverse_ticket["ticket_id"] == ticket.id,
                    reverse_tickets,
                )

                if reverse_ticket["percentage"] == 100:
                    ticket.ticket_status = Ticket.TicketStatus.REFUNDED
                    final_amount += ticket.amount
                else:
                    ticket.ticket_status = Ticket.TicketStatus.PARTIAL_REFUNDED
                    # TODO: check better round method if needed
                    final_amount += ticket.price * Decimal(round(reverse_ticket["percentage"] / 100, 2))

                ticket.save()

            tickets_refund_amount = sum(Decimal(ticket.price) for ticket in tickets)
            total_refund = tickets_refund_amount == final_amount

            operation_description = (
                CashRegisterOperation.CashRegisterSubOperation.TOTAL_REFUND
                if total_refund
                else CashRegisterOperation.CashRegisterSubOperation.PARTIAL_REFUND
            )

            movement_data = {
                "operation_description": operation_description,
                "operation_type": CashRegisterOperation.OperationType.OUT,
                "amount": final_amount,
                "cash_register": validated_data.get("cash_register"),
                "sale": sale,
                "description": description,
            }

            movement = CashRegisterOperation.objects.create(**movement_data)
            movement_serializer = CashRegisterOperationSerializer(movement)

            sale.status = Sale.Status.REFUNDED if total_refund else Sale.Status.PARTIAL_REFUNDED
            sale.save()

            return Response(movement_serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="get active cash register",
        description="get active cash register",
        request=ActiveCashRegisterRequestSerializer,
        responses=CashRegisterSerializer(many=True),
        tags=["Cash registers"],
        methods=["GET"],
        parameters=[
            OpenApiParameter(
                name="branch_office_id",
                type=OpenApiTypes.INT,
                location=OpenApiParameter.QUERY,
            )
        ],
    )
    @action(detail=False, methods=["GET"], url_path="active", url_name="active", pagination_class=None)
    def active_cash_register(self, request):
        serializer = ActiveCashRegisterRequestSerializer(data=request.query_params)

        if serializer.is_valid():
            validated_data = serializer.validated_data
            branch_office_id = validated_data.get("branch_office_id")

            # TODO: transform this query to django orm...
            raw_sql = """select ccr.*
                                FROM core_cashregister ccr
                                INNER JOIN
                                (
                                    SELECT cashier_id, MAX(created) AS created
                                    FROM core_cashregister
                                    GROUP BY cashier_id
                                ) ccr2
                                    ON ccr.cashier_id = ccr2.cashier_id AND ccr.created = ccr2.created
                                where branch_id = %s"""

            cash_registers = CashRegister.objects.raw(raw_sql, [branch_office_id])
            return Response(CashRegisterSerializer(cash_registers, many=True).data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

from datetime import datetime

from django.db.models.aggregates import (
    Count,
    Sum,
)
from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import (
    OpenApiParameter,
    extend_schema,
)
from rest_framework import (
    status,
    viewsets,
)
from rest_framework.decorators import action
from rest_framework.parsers import JSONParser
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.response import Response

from api.core.serializers import (
    DashboardActiveServicesRequestSerializer,
    DashboardActiveServicesResponseSerializer,
    DashboardPassengerTicketResponse,
    DashboardPassengerTicketSerializer,
    DashboardSaleIncomeRequestSerializer,
    DashboardSaleIncomeSerializer,
    DashboardSalesReportRequestSerializer,
    DashboardSaleStateResponseSerializer,
    DashboardSaleStateSerializer,
)
from core.models import (
    Sale,
    Service,
)


class DashboardViewSet(viewsets.GenericViewSet):
    queryset = Sale.objects.all().prefetch_related("tickets").order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    parser_classes = (JSONParser,)
    ordering_fields = ()
    filter_class = None
    serializer_class = None

    @extend_schema(
        summary="sales_detail",
        description="sales detail",
        tags=["Dashboard"],
        request=DashboardSaleStateSerializer,
        responses=DashboardSaleStateResponseSerializer(many=True),
        parameters=[
            OpenApiParameter(
                name="service_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            )
        ],
    )
    @action(
        detail=False,
        methods=["GET"],
        url_path="sales-detail",
        url_name="sales-detail",
        pagination_class=None,
    )
    def sales_detail(self, request, *args, **kwargs):
        serializer = DashboardSaleStateSerializer(data=request.query_params)

        if serializer.is_valid():
            start_date: datetime = serializer.validated_data["service_date"]
            end_date = datetime(start_date.year, start_date.month, start_date.day, 23, 59, 59)
            sales = (
                Sale.objects.exclude(status=Sale.Status.PENDING)
                .filter(payment_date__gte=start_date, payment_date__lt=end_date)
                .values("status")
                .annotate(quantity=Count("tickets"), total=Sum("tickets__price"))
            )

            sales_serializer = DashboardSaleStateResponseSerializer(sales, many=True)
            return Response(sales_serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="sales_income",
        description="Sales income",
        tags=["Dashboard"],
        request=DashboardSaleIncomeRequestSerializer,
        responses=DashboardSaleIncomeSerializer(many=True),
        parameters=[
            OpenApiParameter(
                name="start_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="end_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="cash_register_id",
                type=OpenApiTypes.INT,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(
        methods=["GET"],
        detail=False,
        url_path="sales-income",
        url_name="sales-income",
        pagination_class=None,
    )
    def sales_income(self, request, *args, **kwargs):
        serializer = DashboardSaleIncomeRequestSerializer(data=request.query_params)

        if serializer.is_valid():
            validated_data = serializer.validated_data
            start_date: datetime = serializer.validated_data["start_date"]
            end_date = validated_data.get(
                "end_date",
                datetime(start_date.year, start_date.month, start_date.day, 23, 59, 59),
            )

            sales = (
                Sale.objects.exclude(status=Sale.Status.PENDING)
                .values("status")
                .filter(payment_date__gte=start_date, payment_date__lt=end_date)
                .annotate(quantity=Count("tickets"), total=Sum("tickets__price"))
            )

            sales_serializer = DashboardSaleIncomeSerializer(sales, many=True)
            return Response(sales_serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="active services",
        description="active services",
        tags=["Dashboard"],
        request=DashboardActiveServicesRequestSerializer,
        responses=DashboardActiveServicesResponseSerializer(many=True),
        parameters=[
            OpenApiParameter(
                name="start_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="end_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(
        methods=["GET"],
        detail=False,
        url_path="active-services",
        url_name="active-services",
    )
    def active_services(self, request, *args, **kwargs):
        serializer = DashboardActiveServicesRequestSerializer(data=request.query_params)

        if serializer.is_valid():
            validated_data = serializer.validated_data
            start_date: datetime = serializer.validated_data["start_date"]
            end_date = validated_data.get(
                "end_date",
                datetime(start_date.year, start_date.month, start_date.day, 23, 59, 59),
            )

            services = Service.objects.filter(
                parent__isnull=False,
                status=Service.Status.ACTIVE,
                datetime_publish__gte=start_date,
                datetime_publish__lt=end_date,
            )

            page = self.paginate_queryset(services)
            if page is not None:
                serializer = DashboardActiveServicesResponseSerializer(page, many=True)
                return self.get_paginated_response(serializer.data)

            services_serializer = DashboardActiveServicesResponseSerializer(services, many=True)
            return Response(services_serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="sales report",
        description="sales report",
        tags=["Dashboard"],
        request=DashboardSalesReportRequestSerializer,
        parameters=[
            OpenApiParameter(
                name="start_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="end_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="cash_register_id",
                type=OpenApiTypes.INT,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(
        methods=["GET"],
        detail=False,
        url_path="sales-report",
        url_name="sales-report",
        pagination_class=None,
    )
    def sales_report(self, request, *args, **kwargs):
        serializer = DashboardSalesReportRequestSerializer(data=request.query_params)

        if serializer.is_valid():
            validated_data = serializer.validated_data
            start_date: datetime = validated_data["start_date"]
            end_date = validated_data.get(
                "end_date",
                datetime(start_date.year, start_date.month, start_date.day, 23, 59, 59),
            )

            sales = Sale.objects.exclude(status=Sale.Status.PENDING).filter(
                payment_date__gte=start_date, payment_date__lt=end_date
            )

            return Response(sales, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="passengers report",
        description="passengers report",
        tags=["Reports"],
        request=DashboardPassengerTicketSerializer,
        responses=DashboardPassengerTicketResponse(many=True),
        parameters=[
            OpenApiParameter(
                name="start_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="end_date",
                type=OpenApiTypes.DATETIME,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(
        methods=["GET"],
        detail=False,
        url_path="passenger-tickets",
        url_name="passenger-tickets",
        pagination_class=None,
    )
    def passenger_tickets(self, request):
        serializer = DashboardPassengerTicketSerializer(data=request.query_params)

        if serializer.is_valid():
            validated_data = serializer.validated_data
            start_date: datetime = validated_data["start_date"]
            end_date = validated_data.get(
                "end_date",
                datetime(start_date.year, start_date.month, start_date.day, 23, 59, 59),
            )

            sales = (
                Sale.objects.filter(
                    payment_date__gte=start_date,
                    payment_date__lt=end_date,
                    status=Sale.Status.PAID,
                )
                .values("payment_date__date")
                .annotate(
                    quantity=Count("tickets"),
                )
            )

            response_serializer = DashboardPassengerTicketResponse(sales, many=True)
            return Response(response_serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

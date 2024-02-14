from datetime import datetime

from django.db.models import Prefetch
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

from api.core.filters import ServiceFilter
from api.core.serializers import (
    ActiveServiceRequestSerializer,
    ActiveServiceSerializer,
    CreateParentServiceSerializer,
    CreateServiceSerializer,
    ServiceSerializer,
    SimplifiedServiceSerializer,
)
from core.models import (
    Service,
    ServiceSeatRate,
    Ticket,
)
from utils.views import MultiSerializerViewSetMixin


@extend_schema_view(
    list=extend_schema(
        summary="List all Services",
        description="Return a list of all services in the system.",
        tags=["Services"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a Service",
        description="Get details of a specific service",
        tags=["Services"],
    ),
    create=extend_schema(
        summary="Create a Service",
        description="Create a service",
        tags=["Services"],
    ),
    update=extend_schema(
        summary="Update a Service",
        description="Update details of a specific service",
        tags=["Services"],
    ),
    partial_update=extend_schema(
        summary="Partial update a Service",
        description="Update details of a specific service",
        tags=["Services"],
    ),
    destroy=extend_schema(
        summary="Delete a Service",
        description="Delete a specific service",
        tags=["Services"],
    ),
)
class ServiceViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    parser_classes = (JSONParser,)
    queryset = (
        Service.objects.filter()
        .select_related("bus", "route")
        .prefetch_related(Prefetch("drivers"), Prefetch("assistants"))
    )
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ServiceSerializer
    filterset_class = ServiceFilter
    search_fields = ["name"]
    ordering_fields = ["datetime_from", "datetime_to", "datetime_publish", "id"]
    serializer_action_classes = {
        "create": CreateServiceSerializer,
        "update": CreateServiceSerializer,
        "simplified_services": SimplifiedServiceSerializer,
        "active_services": ActiveServiceRequestSerializer,
        "create_parent": CreateParentServiceSerializer,
    }

    @extend_schema(
        summary="Create a parent service",
        description="Create a parent service",
        tags=["Services"],
    )
    @action(
        detail=False,
        methods=["post"],
        serializer_class=CreateParentServiceSerializer,
        url_path="parent",
        url_name="parent",
    )
    def create_parent(self, request, *args, **kwargs):
        serializer = CreateParentServiceSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    # TODO: Show available and not available services

    @extend_schema(
        summary="Simplified version of services",
        description="List of servicies with less fields",
        responses=SimplifiedServiceSerializer(many=True),
        tags=["Services"],
    )
    @action(
        detail=False,
        methods=["get"],
        url_path="simplified",
        url_name="simplified_services",
    )
    def simplified_services(self, request: Request) -> Response:
        queryset = self.filter_queryset(self.get_queryset())
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    @extend_schema(
        summary="Check if seat is taken",
        description="Service to check if seat is taken",
        tags=["Services"],
        parameters=[
            OpenApiParameter(
                name="seat",
                type=OpenApiTypes.STR,
                location=OpenApiParameter.QUERY,
            )
        ],
    )
    @action(
        detail=True,
        methods=["get"],
        url_path="seat-verification",
        url_name="seat_verification",
    )
    def seat_verification(self, request, *args, **kwargs):
        instance = self.get_object()
        seats = request.query_params.get("seat")

        seats = seats.split(",") if "," in seats else [seats]

        if Ticket.objects.filter(
            service=instance,
            seat_id__in=seats,
            ticket_status=Ticket.TicketStatus.ACTIVE,
        ).exists():
            return Response(
                {"status": "error", "message": "Seats are sold"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        return Response({"status": "ok", "message": "Seats are free"})

    @extend_schema(
        summary="active_services",
        description="active_services",
        tags=["Services"],
        request=ActiveServiceRequestSerializer,
        responses=ActiveServiceSerializer,
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
        methods=["get"],
        url_path="dashboard-active-services",
        url_name="dashboard-active-services",
    )
    def active_services(self, request, *args, **kwargs):
        serializer = ActiveServiceRequestSerializer(data=request.query_params)

        if serializer.is_valid():
            start_date: datetime = serializer.validated_data["service_date"]
            end_date = datetime(start_date.year, start_date.month, start_date.day, 23, 59, 59)
            active_services = Service.objects.filter(
                status=Service.Status.ACTIVE,
                datetime_publish__gte=start_date,
                datetime_publish__lt=end_date,
                parent__isnull=False,
            )

            services_data = []
            for service in active_services:
                data = {
                    "id": service.id,
                    "name": service.name,
                    "route": service.route.name,
                    "bus": service.bus.layout.name,
                    "datetime_publish": service.datetime_publish,
                    "rates": ServiceSeatRate.objects.filter(service=service),
                }
                services_data.append(data)

            return Response(
                ActiveServiceSerializer(services_data, many=True).data,
                status=status.HTTP_200_OK,
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import (
    OpenApiParameter,
    extend_schema,
)
from django.db.models import Prefetch

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.parsers import JSONParser
from rest_framework.permissions import IsAuthenticatedOrReadOnly, AllowAny
from rest_framework.authentication import TokenAuthentication


from utils.views import MultiSerializerViewSetMixin

# Models
from users.models import CustomUser
from locations.models import City, BusStop
from core.models import Service, ReservedSeats, Ticket, Sale

# Serializers
from api_externos.kupos.serializers import(
    CreateSaleKuposSerializer,
    DestinationSerializer,
    StopSerializer,
    ServiceKuposSerializer,
    ReservedSeatsKuposSerializer,
    CreateReservedSeatsKuposSerializer,
    CreateCustomUserWithoutPasswordKuposSerializer
)

# Filters
from api_externos.kupos.filters import CustomUserKuposFilter, SaleKuposFilter, StopKuposFilter, ServiceKuposFilter


class DestinationViewSet(viewsets.ReadOnlyModelViewSet):
    """
    List and retrives all cities.
    """
    queryset = City.objects.all()
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    serializer_class = DestinationSerializer
    search_fields = ["name"]
    ordering_fields = ["priority", "id"]


class StopViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = BusStop.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    serializer_class = StopSerializer
    filterset_class = StopKuposFilter


class ServiceViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = (
        Service.objects.filter()
        .select_related("bus", "route")
        .prefetch_related(Prefetch("drivers"), Prefetch("assistants"))
    )
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    serializer_class = ServiceKuposSerializer
    filterset_class = ServiceKuposFilter
    search_fields = ["name"]
    ordering_fields = ["datetime_from", "datetime_to", "datetime_publish", "id"]

    @extend_schema(
        summary="Check if seat is taken",
        description="Service to check if seat is taken",
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
        sold_tickets = Ticket.objects.filter(
            service=instance,
            seat_id__in=seats,
            ticket_status=Ticket.TicketStatus.ACTIVE,
        ).exists()

        if sold_tickets:
            return Response(
                {"status": "error", "message": "Seats are sold"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        return Response({"status": "ok", "message": "Seats are free"})


class ReservedSeatsKuposViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = ReservedSeats.objects.all().order_by("id")
    serializer_class = ReservedSeatsKuposSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = (AllowAny,)
    parser_classes = (JSONParser,)
    serializer_action_classes = {
        "create": CreateReservedSeatsKuposSerializer,
    }


class CustomUserKuposViewSet(viewsets.ModelViewSet):
    queryset = CustomUser.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    serializer_class = CreateCustomUserWithoutPasswordKuposSerializer
    filterset_class = CustomUserKuposFilter


class SaleKuposViewSet(viewsets.ModelViewSet):
    queryset = Sale.objects.all().prefetch_related("tickets").order_by("id")
    serializer_class = CreateSaleKuposSerializer
    filterset_class = SaleKuposFilter
    ordering_fields = ["created", "id"]
    permission_classes = (IsAuthenticatedOrReadOnly,)
    authentication_classes = (TokenAuthentication,)
    parser_classes = (JSONParser,)

from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.parsers import JSONParser
from rest_framework.permissions import AllowAny

from api.core.serializers import (
    CreateReservedSeatsSerializer,
    ReservedSeatsSerializer,
)
from core.models import ReservedSeats
from utils.views import MultiSerializerViewSetMixin


@extend_schema_view(
    list=extend_schema(
        summary="List all Reserved Seats",
        description="Return a list of all reserved seats in the system.",
        tags=["Reserved Seats"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a Reserved Seat",
        description="Get details of a specific reserved seat",
        tags=["Reserved Seats"],
    ),
    create=extend_schema(
        summary="Create a Reserved Seat",
        description="Create a reserved seat",
        tags=["Reserved Seats"],
    ),
    update=extend_schema(
        summary="Update a Reserved Seat",
        description="Update details of a specific reserved seat",
        tags=["Reserved Seats"],
    ),
    partial_update=extend_schema(
        summary="Partial update a Reserved Seat",
        description="Update details of a specific reserved seat",
        tags=["Reserved Seats"],
    ),
    destroy=extend_schema(
        summary="Delete a Reserved Seat",
        description="Delete a specific reserved seat",
        tags=["Reserved Seats"],
    ),
)
class ReservedSeatsViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = ReservedSeats.objects.all().order_by("id")
    serializer_class = ReservedSeatsSerializer
    permission_classes = (AllowAny,)
    parser_classes = (JSONParser,)
    serializer_action_classes = {
        "create": CreateReservedSeatsSerializer,
    }

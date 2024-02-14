from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.parsers import JSONParser

from api.core.serializers import (
    CreateRefundRequestSerializer,
    RefundRequestSerializer,
)
from core.models import RefundRequest
from utils.views import MultiSerializerViewSetMixin


@extend_schema_view(
    list=extend_schema(
        summary="List all refund requests",
        description="Return a list of all refund requests in the system.",
        tags=["Refund requests"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a refund request",
        description="Get details of a specific refund request",
        tags=["Refund requests"],
    ),
    create=extend_schema(
        summary="Create a Refrefund reques",
        description="Create a refund request",
        tags=["Refund requests"],
    ),
    update=extend_schema(
        summary="Update a refund request",
        description="Update details of a specific refund request",
        tags=["Refund requests"],
    ),
    partial_update=extend_schema(
        summary="Partial update a refund request",
        description="Update details of a specific refund request",
        tags=["Refund requests"],
    ),
    destroy=extend_schema(
        summary="Delete a refund request",
        description="Delete a specific refund request",
        tags=["Refund requests"],
    ),
)
class RefundRequestViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = RefundRequest.objects.all().order_by("id")
    ordering_fields = ["id"]
    serializer_class = RefundRequestSerializer
    parser_classes = (JSONParser,)
    serializer_action_classes = {"create": CreateRefundRequestSerializer}

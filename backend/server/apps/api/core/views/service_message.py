from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.parsers import JSONParser

from api.core.serializers import ServiceMessageSerializer
from core.models import ServiceMessage


@extend_schema_view(
    list=extend_schema(
        summary="List all message",
        description="Return a list of all coupons in the system.",
        tags=["Messages"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a message",
        description="Get details of a specific coupon",
        tags=["Messages"],
    ),
    create=extend_schema(
        summary="Create a message",
        description="Create a message",
        tags=["Messages"],
    ),
    update=extend_schema(
        summary="Update a message",
        description="Update details of a specific message",
        tags=["Messages"],
    ),
    partial_update=extend_schema(
        summary="Partial update a message",
        description="Update details of a specific message",
        tags=["Messages"],
    ),
    destroy=extend_schema(
        summary="Delete a message",
        description="Delete a specific message",
        tags=["Messages"],
    ),
)
class ServiceMessageViewSet(viewsets.ModelViewSet):
    queryset = ServiceMessage.objects.all().order_by("id")
    serializer_class = ServiceMessageSerializer
    ordering_fields = ["id"]
    filterset_fields = ["service_id"]
    parser_classes = (JSONParser,)

    def perform_create(self, serializer):
        serializer.save(personal_id=self.request.user.personal.pk)


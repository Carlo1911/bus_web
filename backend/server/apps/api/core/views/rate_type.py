from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticatedOrReadOnly

from api.core.serializers import RateTypeSerializer
from core.models import RateType


@extend_schema_view(
    list=extend_schema(
        summary="List all rate types",
        description="Return a list of all rate types in the system.",
        tags=["Rate Types"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a rate type",
        description="Get details of a specific rate type",
        tags=["Rate Types"],
    ),
    create=extend_schema(
        summary="Create a rate type",
        description="Create a rate type",
        tags=["Rate Types"],
    ),
    update=extend_schema(
        summary="Update a rate type",
        description="Update details of a specific rate type",
        tags=["Rate Types"],
    ),
    partial_update=extend_schema(
        summary="Partial update a rate type",
        description="Update details of a specific rate type",
        tags=["Rate Types"],
    ),
    destroy=extend_schema(
        summary="Delete a rate type",
        description="Delete a specific rate type",
        tags=["Rate Types"],
    ),
)
class RateTypeViewSet(viewsets.ModelViewSet):
    queryset = RateType.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = RateTypeSerializer

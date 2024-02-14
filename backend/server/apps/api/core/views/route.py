from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticatedOrReadOnly

from api.core.filters import RouteFilter
from api.core.serializers import (
    CreateRouteSerializer,
    RouteSerializer,
)
from core.models import Route
from utils.views import MultiSerializerViewSetMixin


@extend_schema_view(
    list=extend_schema(
        summary="List all route",
        description="Return a list of all route in the system.",
        tags=["Routes"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a route",
        description="Get details of a specific route",
        tags=["Routes"],
    ),
    create=extend_schema(
        summary="Create a route",
        description="Create a route",
        tags=["Routes"],
    ),
    update=extend_schema(
        summary="Update a route",
        description="Update details of a specific route",
        tags=["Routes"],
    ),
    partial_update=extend_schema(
        summary="Partial update a route",
        description="Update details of a specific route",
        tags=["Routes"],
    ),
    destroy=extend_schema(
        summary="Delete a route",
        description="Delete a specific route",
        tags=["Routes"],
    ),
)
class RouteViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = Route.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    filterset_class = RouteFilter
    serializer_class = RouteSerializer
    serializer_action_classes = {"create": CreateRouteSerializer}

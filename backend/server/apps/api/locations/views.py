from django.db.models import Q
from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import (
    status,
    viewsets,
)
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.response import Response

from core.models import Service
from locations.models import (
    Branch,
    BusStop,
    City,
    Region,
)
from utils.views import MultiSerializerViewSetMixin

from .filters import (
    BusStopFilter,
    CityFilter,
)
from .serializers import (
    BranchSerializer,
    BusStopSerializer,
    CitySerializer,
    CreateBusStopSerializer,
    RegionSerializer,
    UpdateBusStopSerializer,
)


@extend_schema_view(
    list=extend_schema(
        summary="List all regions",
        description="Return a list of all regions in the system.",
        tags=["Regions"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a region",
        description="Get details of a specific region",
        tags=["Regions"],
    ),
    create=extend_schema(
        summary="Create a region", description="Create a region", tags=["Regions"]
    ),
    update=extend_schema(
        summary="Update a region",
        description="Update details of a specific region",
        tags=["Regions"],
    ),
    partial_update=extend_schema(
        summary="Partial update a region",
        description="Update details of a specific region",
        tags=["Regions"],
    ),
    destroy=extend_schema(
        summary="Delete a region",
        description="Delete a specific region",
        tags=["Regions"],
    ),
)
class RegionViewSet(viewsets.ModelViewSet):
    queryset = Region.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = RegionSerializer


@extend_schema_view(
    list=extend_schema(
        summary="List all cities",
        description="Return a list of all cities in the system.",
        tags=["Cities"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a city",
        description="Get details of a specific city",
        tags=["Cities"],
    ),
    create=extend_schema(
        summary="Create a city", description="Create a city", tags=["Cities"]
    ),
    update=extend_schema(
        summary="Update a city",
        description="Update details of a specific city",
        tags=["Cities"],
    ),
    partial_update=extend_schema(
        summary="Partial update a city",
        description="Update details of a specific city",
        tags=["Cities"],
    ),
    destroy=extend_schema(
        summary="Delete a city",
        description="Delete a specific city",
        tags=["Cities"],
    ),
)
class CityViewSet(viewsets.ModelViewSet):
    queryset = City.objects.all()
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = CitySerializer
    search_fields = ["name"]
    ordering_fields = ["priority", "id"]
    filterset_class = CityFilter


@extend_schema_view(
    list=extend_schema(
        summary="List all buses stop",
        description="Return a list of all buses stop in the system.",
        tags=["Buses Stop"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a bus stop",
        description="Get details of a specific bus stop",
        tags=["Buses Stop"],
    ),
    create=extend_schema(
        summary="Create a bus stop",
        description="Create a bus stop",
        tags=["Buses Stop"],
    ),
    update=extend_schema(
        summary="Update a bus stop",
        description="Update details of a specific bus stop",
        tags=["Buses Stop"],
    ),
    partial_update=extend_schema(
        summary="Partial update a bus stop",
        description="Update details of a specific bus stop",
        tags=["Buses Stop"],
    ),
    destroy=extend_schema(
        summary="Delete a bus stop",
        description="Delete a specific bus stop",
        tags=["Buses Stop"],
    ),
)
class BusStopViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = BusStop.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = BusStopSerializer
    serializer_action_classes = {
        "create": CreateBusStopSerializer,
        "update": UpdateBusStopSerializer,
    }
    filterset_class = BusStopFilter

    def destroy(self, request, *args, **kwargs):
        bus_stop = self.get_object()
        buses_stop = Service.objects.filter(
            Q(route__stretches__start_bus_stop_id__in=[bus_stop.id])
            | Q(route__stretches__end_bus_stop_id__in=[bus_stop.id])
        )

        if buses_stop.exists():
            return Response(
                {"bus_stop_id": "Parada de bus en uso."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        bus_stops = BusStop.objects.filter(order__gte=bus_stop.order).order_by("order")
        bus_stop.delete()

        for bus_stop in bus_stops:
            bus_stop.order -= 1
            bus_stop.save()

        return Response(status=status.HTTP_204_NO_CONTENT)


@extend_schema_view(
    list=extend_schema(
        summary="List all branches",
        description="Return a list of all branches in the system.",
        tags=["Branches"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a branch",
        description="Get details of a specific branch",
        tags=["Branches"],
    ),
    create=extend_schema(
        summary="Create a branch", description="Create a branch", tags=["Branches"]
    ),
    update=extend_schema(
        summary="Update a branch",
        description="Update details of a specific branch",
        tags=["Branches"],
    ),
    partial_update=extend_schema(
        summary="Partial update a branch",
        description="Update details of a specific branch",
        tags=["Branches"],
    ),
    destroy=extend_schema(
        summary="Delete a branch",
        description="Delete a specific branch",
        tags=["Branches"],
    ),
)
class BranchViewSet(viewsets.ModelViewSet):
    queryset = Branch.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = BranchSerializer

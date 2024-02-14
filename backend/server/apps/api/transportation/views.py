from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticatedOrReadOnly

from core.utils import generate_simple_csv
from transportation.models import (
    Benefit,
    Bus,
    Component,
    Floor,
    Layout,
    SeatType,
)

from .filters import BusFilter
from .serializers import (
    BenefitSerializer,
    BusSerializer,
    ComponentPolymorphicSerializer,
    FloorSerializer,
    LayoutSerializer,
    SeatTypeSerializer,
)


@extend_schema_view(
    list=extend_schema(
        summary='List all buses',
        description='Return a list of all buses in the system.',
        tags=['Buses'],
    ),
    retrieve=extend_schema(
        summary='Retrieve a bus',
        description='Get details of a specific bus',
        tags=['Buses'],
    ),
    create=extend_schema(
        summary='Create a bus', description='Create a bus', tags=['Buses']
    ),
    update=extend_schema(
        summary='Update a bus',
        description='Update details of a specific bus',
        tags=['Buses'],
    ),
    partial_update=extend_schema(
        summary='Partial update a bus',
        description='Update details of a specific bus',
        tags=['Buses'],
    ),
    destroy=extend_schema(
        summary='Delete a bus', description='Delete a specific bus', tags=['Buses']
    ),
)
class BusViewSet(viewsets.ModelViewSet):
    queryset = Bus.objects.all().order_by('id')
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = BusSerializer
    filterset_class = BusFilter
    search_fields = ['code', 'name', 'plate']
    ordering_fields = ['id', 'name']

    @extend_schema(
        summary='Export buses information in csv',
        description='Export buses information in csv',
        tags=['Buses'],
    )
    @action(
        detail=False,
        methods=['get'],
        url_path='export',
        url_name='export_bus_info',
    )
    def export_buses_to_csv(self, request, pk=None):
        return generate_simple_csv(
            (
                'Código',
                'Nombre',
                'Tipo de vehículo',
                'Estado',
                'Placa',
                'Kilómetros',
                'Número de serie del motor',
                'Número de serie del chasís',
                'Color',
                'Año',
                'Póliza de seguro',
                'Fecha de fin de póliza de seguro',
                'Marca',
                'Modelo',
                'Dueño',
                'Disposición',
            ),
            'bus',
            self.queryset,
        )


@extend_schema_view(
    list=extend_schema(
        summary='List all benefits',
        description='Return a list of all benefits in the system.',
        tags=['Benefits'],
    ),
    retrieve=extend_schema(
        summary='Retrieve a benefit',
        description='Get details of a specific benefit',
        tags=['Benefits'],
    ),
    create=extend_schema(
        summary='Create a benefit', description='Create a benefit', tags=['Benefits']
    ),
    update=extend_schema(
        summary='Update a benefit',
        description='Update details of a specific benefit',
        tags=['Benefits'],
    ),
    partial_update=extend_schema(
        summary='Partial update a benefit',
        description='Update details of a specific benefit',
        tags=['Benefits'],
    ),
    destroy=extend_schema(
        summary='Delete a benefit',
        description='Delete a specific benefit',
        tags=['Benefits'],
    ),
)
class BenefitViewSet(viewsets.ModelViewSet):
    queryset = Benefit.objects.all().order_by('id')
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = BenefitSerializer


@extend_schema_view(
    list=extend_schema(
        summary='List all layouts',
        description='Return a list of all layouts in the system.',
        tags=['Layouts'],
    ),
    retrieve=extend_schema(
        summary='Retrieve a layout',
        description='Get details of a specific layout',
        tags=['Layouts'],
    ),
    create=extend_schema(
        summary='Create a layout', description='Create a layout', tags=['Layouts']
    ),
    update=extend_schema(
        summary='Update a layout',
        description='Update details of a specific layout',
        tags=['Layouts'],
    ),
    partial_update=extend_schema(
        summary='Partial update a layout',
        description='Update details of a specific layout',
        tags=['Layouts'],
    ),
    destroy=extend_schema(
        summary='Delete a layout',
        description='Delete a specific layout',
        tags=['Layouts'],
    ),
)
class LayoutViewSet(viewsets.ModelViewSet):
    queryset = Layout.objects.all().order_by('id')
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = LayoutSerializer


@extend_schema_view(
    list=extend_schema(
        summary='List all floors',
        description='Return a list of all floors in the system.',
        tags=['Floors'],
    ),
    retrieve=extend_schema(
        summary='Retrieve a floor',
        description='Get details of a specific floor',
        tags=['Floors'],
    ),
    create=extend_schema(
        summary='Create a floor', description='Create a floor', tags=['Floors']
    ),
    update=extend_schema(
        summary='Update a floor',
        description='Update details of a specific floor',
        tags=['Floors'],
    ),
    partial_update=extend_schema(
        summary='Partial update a floor',
        description='Update details of a specific floor',
        tags=['Floors'],
    ),
    destroy=extend_schema(
        summary='Delete a floor', description='Delete a specific floor', tags=['Floors']
    ),
)
class FloorViewSet(viewsets.ModelViewSet):
    queryset = Floor.objects.all().order_by('id')
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = FloorSerializer


@extend_schema_view(
    list=extend_schema(
        summary='List all components',
        description='Return a list of all components in the system.',
        tags=['Components'],
    ),
    retrieve=extend_schema(
        summary='Retrieve a component',
        description='Get details of a specific component',
        tags=['Components'],
    ),
    create=extend_schema(
        summary='Create a component',
        description='Create a component',
        tags=['Components'],
    ),
    update=extend_schema(
        summary='Update a component',
        description='Update details of a specific component',
        tags=['Components'],
    ),
    partial_update=extend_schema(
        summary='Partial update a component',
        description='Update details of a specific component',
        tags=['Components'],
    ),
    destroy=extend_schema(
        summary='Delete a component',
        description='Delete a specific component',
        tags=['Components'],
    ),
)
class ComponentViewSet(viewsets.ModelViewSet):
    queryset = Component.objects.all().order_by('id')
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ComponentPolymorphicSerializer


@extend_schema_view(
    list=extend_schema(
        summary='List all seat types',
        description='Return a list of all seat types in the system.',
        tags=['Seat types'],
    ),
    retrieve=extend_schema(
        summary='Retrieve a seat type',
        description='Get details of a specific seat type',
        tags=['Seat types'],
    ),
    create=extend_schema(
        summary='Create a seat type',
        description='Create a seat type',
        tags=['Seat types'],
    ),
    update=extend_schema(
        summary='Update a seat type',
        description='Update details of a specific seat type',
        tags=['Seat types'],
    ),
    partial_update=extend_schema(
        summary='Partial update a seat type',
        description='Update details of a specific seat type',
        tags=['Seat types'],
    ),
    destroy=extend_schema(
        summary='Delete a seat type',
        description='Delete a specific seat type',
        tags=['Seat types'],
    ),
)
class SeatTypeViewSet(viewsets.ModelViewSet):
    queryset = SeatType.objects.all().order_by('id')
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = SeatTypeSerializer

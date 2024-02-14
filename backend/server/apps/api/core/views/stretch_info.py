from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import (
    OpenApiParameter,
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.parsers import JSONParser
from rest_framework.response import Response

from api.core.filters import StretchInfoFilter
from api.core.serializers import StretchInfoSerializer
from core.models import StretchInfo
from utils.views import MultiSerializerViewSetMixin


@extend_schema_view(
    list=extend_schema(
        summary="List all tariffs",
        description="Return a list of all tariffs in the system.",
        tags=["Tariffs"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a tariff",
        description="Get details of a specific tariffs",
        tags=["Tariffs"],
    ),
    create=extend_schema(
        summary="Create a tariff",
        description="Create a tariff",
        tags=["Tariffs"],
    ),
    update=extend_schema(
        summary="Update a tariff",
        description="Update details of a specific tariff",
        tags=["Tariffs"],
    ),
    partial_update=extend_schema(
        summary="Partial update a tariff",
        description="Update details of a specific tariff",
        tags=["Tariffs"],
    ),
    destroy=extend_schema(
        summary="Delete a tariff",
        description="Delete a specific tariff",
        tags=["Tariffs"],
    ),
)
class StretchInfoViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = StretchInfo.objects.all().order_by("id")
    serializer_class = StretchInfoSerializer
    ordering_fields = ["id"]
    filterset_class = StretchInfoFilter
    parser_classes = (JSONParser,)
    serializer_action_classes = {"cities_info:": StretchInfoSerializer}

    @extend_schema(
        summary="Information about two cities",
        description="Return the price of every stretch between two cities",
        responses=StretchInfoSerializer,
        tags=["Tariffs"],
        parameters=[
            OpenApiParameter(
                name="end_bus_stop__city_id",
                type=OpenApiTypes.INT,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="start_bus_stop__city_id",
                type=OpenApiTypes.INT,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="ordering",
                type=OpenApiTypes.STR,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(detail=False, methods=["get"], url_path="cities", url_name="tariff-city")
    def cities_info(self, request):
        """Método que retornar solo el precio de una ciudad a otra ya que
        cualquier parada de la ciudad 1 a cualquier parada de la ciudad 2 tiene
        el mismo precio.

        Parameters
        ----------
        request : _type_
            _description_

        Returns
        -------
        Response
            Información de la tarifa entre 2 ciudades
        """
        start_bus_stop__city_id = request.query_params.get("start_bus_stop__city_id")
        end_bus_stop__city_id = request.query_params.get("end_bus_stop__city_id")
        queryset = self.get_queryset()
        serializer = self.get_serializer(
            queryset.filter(
                start_bus_stop__city_id=start_bus_stop__city_id,
                end_bus_stop__city_id=end_bus_stop__city_id,
            ).first()
        )
        return Response(serializer.data)

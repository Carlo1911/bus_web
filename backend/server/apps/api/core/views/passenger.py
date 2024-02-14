from rest_framework import viewsets
from rest_framework.mixins import ListModelMixin
from rest_framework.parsers import JSONParser
from rest_framework.permissions import IsAuthenticatedOrReadOnly

from api.core.filters import PassengerFilter
from api.core.serializers import (
    CreatePassengerSerializer,
    PassengerSerializer,
)
from core.models import Passenger
from utils.views import MultiSerializerViewSetMixin


class PassengerViewSet(MultiSerializerViewSetMixin, viewsets.GenericViewSet, ListModelMixin):
    queryset = Passenger.objects.all()
    filterset_class = PassengerFilter
    ordering_fields = ["id"]
    serializer_class = PassengerSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)
    parser_classes = (JSONParser,)
    serializer_action_classes = {"create:": CreatePassengerSerializer}

from rest_framework import serializers
from rest_polymorphic.serializers import PolymorphicSerializer

from transportation.models import (
    Benefit,
    Bus,
    Component,
    Floor,
    Layout,
    Seat,
    SeatType,
)


class BenefitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Benefit
        fields = '__all__'


class LayoutSerializer(serializers.ModelSerializer):
    total_seats = serializers.ReadOnlyField()
    total_floors = serializers.ReadOnlyField()

    class Meta:
        model = Layout
        fields = '__all__'


class FloorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Floor
        fields = '__all__'


class SeatTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = SeatType
        fields = '__all__'


class ComponentSerializer(serializers.ModelSerializer):
    floors = FloorSerializer(read_only=True)
    is_free = serializers.BooleanField(read_only=True)

    class Meta:
        model = Component
        fields = (
            'id',
            'position_x',
            'position_y',
            'width',
            'length',
            'kind',
            'floors',
            'is_free',
        )


class SeatSerializer(serializers.ModelSerializer):
    floors = FloorSerializer(read_only=True)
    is_free = serializers.BooleanField(read_only=True)

    class Meta:
        model = Seat
        fields = (
            'id',
            'position_x',
            'position_y',
            'width',
            'length',
            'kind',
            'floors',
            'seat_kind',
            'code',
            'is_free',
        )


class ComponentPolymorphicSerializer(PolymorphicSerializer):
    model_serializer_mapping = {
        Component: ComponentSerializer,
        Seat: SeatSerializer,
    }


class BusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bus
        exclude = ['services']

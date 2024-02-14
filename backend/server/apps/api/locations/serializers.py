from rest_framework import serializers

from core.utils import first_or_default
from locations.models import (
    Branch,
    BusStop,
    City,
    Region,
)


class RegionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Region
        fields = '__all__'


class BusStopCitySerializer(serializers.ModelSerializer):
    class Meta:
        model = BusStop
        fields = '__all__'


class CitySerializer(serializers.ModelSerializer):
    region = RegionSerializer()
    bus_stops = BusStopCitySerializer(many=True, read_only=True)

    class Meta:
        model = City
        fields = '__all__'


class UpdateBusStopSerializer(serializers.ModelSerializer):
    order = serializers.IntegerField(min_value=1, required=True)

    def map_instance_update(self, instance: BusStop, validated_data: dict) -> BusStop:
        instance.order = validated_data.get(
            'order', instance.order
        )
        instance.code = validated_data.get(
            'code', instance.code
        )
        instance.name = validated_data.get(
            'name', instance.name
        )
        instance.city = validated_data.get(
            'city', instance.city
        )
        instance.latitude = validated_data.get(
            'latitude', instance.latitude
        )
        instance.longitude = validated_data.get(
            'longitude', instance.longitude
        )
        instance.distance = validated_data.get(
            'distance', instance.distance
        )
        instance.time = validated_data.get(
            'time', instance.time
        )
        instance.stop_type = validated_data.get(
            'stop_type', instance.stop_type
        )
        instance.status = validated_data.get(
            'status', instance.status
        )

        return instance

    def update(self, instance: BusStop, validated_data: dict):
        new_order = validated_data.get('order')

        if new_order < instance.order:
            range_start = new_order
            range_end = instance.order
            range_to_change = list(range(range_start, range_end))
            range_to_change.reverse()
            bus_stops = BusStop.objects.filter(order__in=range_to_change).order_by('-order')

            for range_t in range_to_change:
                bus_stop_to_change = first_or_default(lambda bus_stop: bus_stop.order == range_t, bus_stops)
                bus_stop_to_change.order += 1
                bus_stop_to_change.save()

        elif new_order > instance.order:
            range_start = instance.order + 1
            range_end = new_order + 1
            back_range_to_change = list(range(range_start, range_end))
            bus_stops = BusStop.objects.filter(order__in=back_range_to_change).order_by('order')

            for range_t in back_range_to_change:
                bus_stop_to_change = first_or_default(lambda bus_stop: bus_stop.order == range_t, bus_stops)
                bus_stop_to_change.order -= 1
                bus_stop_to_change.save()

        instance = self.map_instance_update(instance, validated_data)
        instance.save()
        return instance

    class Meta:
        model = BusStop
        fields = '__all__'


class CreateBusStopSerializer(serializers.ModelSerializer):
    order = serializers.IntegerField(min_value=1, required=True)

    def validate(self, attrs):
        new_name = attrs['name']

        find_bus_stop = BusStop.objects.filter(name__iexact=new_name)
        if find_bus_stop.exists():
            raise serializers.ValidationError(
                {'name': 'El nombre de la parada ya existe.'}
            )

        return attrs

    def create(self, validated_data):
        order = validated_data.get('order')
        bus_stops = BusStop.objects.filter(order__gte=order).order_by('order')
        for bus_stop in bus_stops:
            bus_stop.order += 1
            bus_stop.save()

        new_bus_stop = BusStop.objects.create(**validated_data)
        return new_bus_stop

    class Meta:
        model = BusStop
        fields = '__all__'


class BusStopSerializer(serializers.ModelSerializer):
    city = CitySerializer()
    order = serializers.IntegerField(min_value=1, required=True)

    class Meta:
        model = BusStop
        fields = '__all__'


class BranchSerializer(serializers.ModelSerializer):
    city = CitySerializer()

    class Meta:
        model = Branch
        fields = '__all__'

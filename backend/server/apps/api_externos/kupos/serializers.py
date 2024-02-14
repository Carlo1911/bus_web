from django.utils import timezone

from rest_framework import serializers

# Models
from crew.models import Personal
from users.models import CustomUser
from locations.models import BusStop, City
from core.models import (
    Service,
    ReservedSeat,
    ReservedSeats,
    Sale,
    Ticket,
    Passenger,
    Personal,
    CouponDiscountStrategy,
    CashRegister
)

# Serializers
from api.crew.serializers import PersonalSerializer
from api.locations.serializers import CitySerializer
from api.core.serializers import RouteSerializer, ServiceSeatRateSerializer, CashRegisterSerializer
from api.transportation.serializers import BusSerializer, ComponentPolymorphicSerializer


class DestinationSerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = ('id', 'code', 'name')


class StopSerializer(serializers.ModelSerializer):
    city = DestinationSerializer()
    order = serializers.IntegerField(min_value=1, required=True)

    class Meta:
        model = BusStop
        fields = '__all__'


class ServiceKuposSerializer(serializers.ModelSerializer):
    route = RouteSerializer(read_only=True)
    bus = BusSerializer(read_only=True)
    start_city = CitySerializer(read_only=True, required=False, allow_null=True)
    end_city = CitySerializer(read_only=True, required=False, allow_null=True)
    web_seats = ComponentPolymorphicSerializer(many=True, read_only=True)
    sales_seats = ComponentPolymorphicSerializer(many=True, read_only=True)
    rates = ServiceSeatRateSerializer(many=True, read_only=True)

    class Meta:
        model = Service
        exclude = ('drivers', 'assistants', 'parent')


class ReservedSeatKuposSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReservedSeat
        fields = "__all__"


class ReservedSeatsKuposSerializer(serializers.ModelSerializer):
    seats = ReservedSeatKuposSerializer(many=True, read_only=True)

    class Meta:
        model = ReservedSeats
        fields = "__all__"


class CreateReservedSeatsKuposSerializer(serializers.ModelSerializer):
    seats = serializers.ListField(child=serializers.IntegerField(), write_only=True)

    class Meta:
        model = ReservedSeats
        fields = "__all__"

    def create(self, validated_data):
        seats = validated_data.pop("seats")
        reserved_seats = ReservedSeats.objects.create(**validated_data)
        for seat in seats:
            ReservedSeat.objects.create(reserve=reserved_seats, seat_id=seat)
        return reserved_seats


class CreateCustomUserWithoutPasswordKuposSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        validated_data["is_active"] = False
        user, _ = CustomUser.objects.update_or_create(
            username=validated_data.get("validated_data"), defaults=validated_data
        )
        return user

    def update(self, instance: CustomUser, validated_data: dict) -> CustomUser:
        instance.first_name = validated_data.get("first_name") or instance.first_name
        instance.last_name = validated_data.get("last_name") or instance.last_name
        instance.email = validated_data.get("email") or instance.email
        instance.document_number = validated_data.get("document_number") or instance.document_number
        instance.cellphone = validated_data.get("cellphone") or instance.cellphone
        instance.nationality = validated_data.get("nationality") or instance.nationality
        instance.document_type = validated_data.get("document_type") or instance.document_type
        instance.save()
        return instance

    class Meta:
        model = CustomUser
        fields = (
            "id",
            "first_name",
            "last_name",
            "email",
            "document_number",
            "document_type",
            "cellphone",
            "nationality",
        )
        read_only_fields = ["id"]


class CreatePassengerKuposSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    user = CreateCustomUserWithoutPasswordKuposSerializer()

    def create(self, validated_data: dict):
        passenger, _ = Passenger.objects.update_or_create(**validated_data)
        return passenger

    class Meta:
        model = Passenger
        fields = "__all__"


class CreateTicketKuposSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    passenger = CreatePassengerKuposSerializer(required=True)

    class Meta:
        model = Ticket
        fields = "__all__"


class CreateSaleKuposSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    created = serializers.DateTimeField(required=False)
    tickets = CreateTicketKuposSerializer(many=True, required=False, allow_null=True)
    seller_id = serializers.PrimaryKeyRelatedField(
        required=False,
        allow_null=True,
        write_only=True,
        queryset=Personal.objects.all(),
    )
    seller = PersonalSerializer(required=False, allow_null=True, read_only=True)
    cash_register_id = serializers.PrimaryKeyRelatedField(
        required=False,
        allow_null=True,
        write_only=True,
        queryset=CashRegister.objects.all(),
    )
    cash_register = CashRegisterSerializer(required=False, allow_null=True, read_only=True)
    start_bus_stop_id = serializers.PrimaryKeyRelatedField(
        required=False,
        allow_null=True,
        write_only=True,
        queryset=BusStop.objects.all(),
    )
    end_bus_stop_id = serializers.PrimaryKeyRelatedField(
        required=False,
        allow_null=True,
        write_only=True,
        queryset=BusStop.objects.all(),
    )
    coupon_code = serializers.CharField(required=False, allow_null=True)

    def validate_cupon(self, value: str):
        coupon: CouponDiscountStrategy = CouponDiscountStrategy.objects.filter(code=value).first()
        if coupon is None:
            raise serializers.ValidationError({"coupon": "Coupon not found"})
        # Check if coupon is valid between dates
        if (
            coupon.valid_from
            and coupon.valid_from > timezone.now()
            or (coupon.valid_to and coupon.valid_to < timezone.now())
        ):
            raise serializers.ValidationError({"coupon": "Coupon not valid between dates"})
        if coupon.discount.count_uses >= coupon.discount.max_uses:
            raise serializers.ValidationError({"coupon": "Coupon has reached max uses"})
        # TODO: Check if coupon is valid for a passanger
        # TODO: Check if coupon is valid for a service

    def validate(self, attrs):
        if "tickets" in attrs:
            for ticket in attrs["tickets"]:
                if Ticket.objects.filter(
                    seat_id=ticket["seat"],
                    ticket_status=Ticket.TicketStatus.ACTIVE,
                    service_id=ticket["service"],
                ).exists():
                    raise serializers.ValidationError({"tickets": "Tickets are already sold out"})
        if "coupon_code" in attrs and attrs["coupon_code"] is not None:
            self.validate_cupon(attrs.get("coupon_code"))
        return attrs

    class Meta:
        model = Sale
        fields = "__all__"
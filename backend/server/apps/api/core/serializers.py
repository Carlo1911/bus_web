from abc import abstractmethod
from datetime import (
    date,
    datetime,
    timedelta,
)

from django.utils import timezone
from rest_framework import serializers

from api.crew.serializers import (
    PersonalSerializer,
    SimplePersonalSerializer,
    BasicPersonalSerializer,
)
from api.locations.serializers import (
    BusStopSerializer,
    CitySerializer,
)
from api.transportation.serializers import (
    BusSerializer,
    ComponentPolymorphicSerializer,
    SeatTypeSerializer,
)
from api.users.serializers import (
    CreateCustomUserWithoutPasswordSerializer,
    CustomUserSerializer,
)
from core.models import (
    CashRegister,
    CashRegisterMovement,
    CashRegisterOperation,
    Coupon,
    CouponDiscountStrategy,
    Passenger,
    PassengerNationality,
    Printer,
    RateType,
    RefundRequest,
    ReservedSeat,
    ReservedSeats,
    Route,
    RouteStretch,
    RouteStretchRate,
    Sale,
    Service,
    ServiceSeatRate,
    ServiceMessage,
    StretchInfo,
    StretchInfoRate,
    Ticket,
)
from crew.models import Personal
from locations.models import (
    Branch,
    BusStop,
    City
)
from transportation.models import Bus


class RateTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = RateType
        fields = "__all__"


class CreateRouteStretchRateSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    price = serializers.DecimalField(max_digits=10, decimal_places=2, required=True)

    class Meta:
        model = RouteStretchRate
        fields = "id", "price", "seat_type"


class CreateRouteStretchSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    rates = CreateRouteStretchRateSerializer(many=True)
    order = serializers.IntegerField(required=True, min_value=0)

    def validate(self, attrs):
        start_bus_stop = attrs["start_bus_stop"]
        end_bus_stop = attrs["end_bus_stop"]

        if start_bus_stop == end_bus_stop:
            raise serializers.ValidationError(
                {
                    "stretches": f"Las ciudad de inicio {start_bus_stop.name} y \
                        fin {end_bus_stop.name} no pueden ser la misma."
                }
            )

        return attrs

    class Meta:
        model = RouteStretch
        fields = "__all__"


class RouteStretchSerializer(serializers.ModelSerializer):
    start_bus_stop = BusStopSerializer()
    end_bus_stop = BusStopSerializer()

    class Meta:
        model = RouteStretch
        fields = "__all__"


class CreateStretch(serializers.ModelSerializer):
    def validate(self, attrs):
        start_bus_stop = attrs["start_bus_stop"]
        end_bus_stop = attrs["end_bus_stop"]

        if start_bus_stop == end_bus_stop:
            raise serializers.ValidationError(
                {
                    "stretches": f"Las ciudad de inicio {start_bus_stop.name} y \
                        fin {end_bus_stop.name} no pueden ser la misma."
                }
            )

        return attrs

    class Meta:
        model = RouteStretch
        fields = ["start_bus_stop", "end_bus_stop"]


class CreateRouteSerializer(serializers.ModelSerializer):
    start_city_id = serializers.PrimaryKeyRelatedField(
        required=True,
        allow_null=False,
        write_only=True,
        queryset=City.objects.all(),
    )
    end_city_id = serializers.PrimaryKeyRelatedField(
        required=True,
        allow_null=False,
        write_only=True,
        queryset=City.objects.all(),
    )
    stretches = CreateStretch(many=True, write_only=True)

    def validate(self, attrs):
        route_name: str = attrs["name"]
        start_city = attrs["start_city_id"]
        end_city = attrs["end_city_id"]
        stretches = attrs["stretches"]

        if Route.objects.filter(name__iexact=route_name).exists():
            raise serializers.ValidationError({"name": f"La ruta {route_name} ya existe."})

        start_bus_stop = stretches[0].get('start_bus_stop')
        end_bus_stop = stretches[-1].get('end_bus_stop')
        if start_bus_stop.city_id != start_city.id or start_bus_stop.stop_type != 'terminal':
            raise serializers.ValidationError({"errors": f"El primer tramo de la ruta, debe iniciar en un terminal de la ciudad de {start_city.name}."})
        if end_bus_stop.city_id != end_city.id or end_bus_stop.stop_type != 'terminal':
            raise serializers.ValidationError({"errors": f"El último tramo de la ruta, debe finalizar en un terminal de la ciudad de {end_city.name}."})

        return attrs

    def create(self, validated_data):
        stretches = validated_data.pop("stretches")
        start_city = validated_data.pop("start_city_id")
        end_city = validated_data.pop("end_city_id")
        route = Route.objects.create(**validated_data)
        for order, stretch in enumerate(stretches):
            stretch_info = StretchInfo.objects.filter(
                start_bus_stop=stretch["start_bus_stop"],
                end_bus_stop=stretch["end_bus_stop"],
            ).first()

            stretch["stretch_type"] = RouteStretch.StretchType.STRETCH
            stretch["order"] = order
            stretch["duration"] = stretch_info.duration if stretch_info else timedelta(days=0)
            stretch["distance"] = stretch_info.distance if stretch_info else 0

            RouteStretch.objects.create(route=route, **stretch)

        return route

    class Meta:
        model = Route
        fields = ["name", "stretches", "start_city_id", "end_city_id"]


class UpdateRouteSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=True)
    stretches = CreateRouteStretchSerializer(many=True, write_only=True)

    def validate(self, attrs):
        route_name: str = attrs["name"]

        if Route.objects.filter(name__iexact=route_name).exists():
            raise serializers.ValidationError({"name": f"La ruta {route_name} ya existe."})

        return attrs

    def update(self, instance, validated_data):
        stretches = validated_data.pop("stretches")
        instance.name = validated_data.get("name", instance.name)
        instance.save()

        for stretch in stretches:
            rates = stretch.pop("rates")
            route_stretch = RouteStretch.objects.get(route=instance, **stretch)

            for rate in rates:
                RouteStretchRate.objects.update_or_create(route_stretch=route_stretch, **rate)

        return instance

    class Meta:
        model = Route
        fields = "__all__"


class RouteSerializer(serializers.ModelSerializer):
    stretches = RouteStretchSerializer(many=True, read_only=True)
    start_city = CitySerializer(read_only=True)
    end_city = CitySerializer(read_only=True)
    status = serializers.ReadOnlyField()

    def destroy(self, instance):
        instance.status = False
        instance.save()

    class Meta:
        model = Route
        fields = "__all__"


class SimplifiedRouteSerializer(serializers.ModelSerializer):
    status = serializers.ReadOnlyField()

    class Meta:
        model = Route
        fields = "__all__"


class RouteStretchRateSerializer(serializers.ModelSerializer):
    route_stretch = RouteStretchSerializer(read_only=True)
    seat_type = SeatTypeSerializer(read_only=True)

    class Meta:
        model = RouteStretchRate
        fields = "__all__"


class ActiveServiceRequestSerializer(serializers.Serializer):
    service_date = serializers.DateTimeField()


class ServiceSeatRateSerializer(serializers.ModelSerializer):
    seat_type = SeatTypeSerializer(read_only=True)

    class Meta:
        model = ServiceSeatRate
        fields = "__all__"


class ActiveServiceSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    route = serializers.CharField()
    bus = serializers.CharField()
    datetime_publish = serializers.CharField()
    rates = serializers.ListField(child=ServiceSeatRateSerializer())


class CreateServiceSeatRateSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)

    class Meta:
        model = ServiceSeatRate
        exclude = ["service"]


class CreateParentServiceSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    rates = CreateServiceSeatRateSerializer(many=True, write_only=True)

    def create(self, validated_data: dict):
        rates = validated_data.pop("rates")
        service = Service.objects.create(**validated_data)
        service_days = []
        for rate in rates:
            if (day := rate.get('day').lower()) not in service_days:
                service_days.append(day)
            ServiceSeatRate.objects.create(service=service, **rate)
        service.status = Service.Status.ACTIVE
        service.save()
        service.calculate_durations()

        diff_days = abs((service.datetime_to - service.datetime_from).days) + 1
        validated_data["parent"] = service
        for day in range(diff_days):
            # Creation of posture for the first day of service
            datetime_publish = datetime.combine(
                date(service.datetime_from.year, service.datetime_from.month, service.datetime_from.day), service.start_time
            ) + timedelta(days=day)
            day_of_week = datetime_publish.strftime('%A').lower()
            if day_of_week not in service_days:
                continue
            validated_data["datetime_publish"] = datetime_publish

            driver = Personal.objects.filter(user__first_name="Conductor").first()
            assistant = Personal.objects.filter(user__first_name="Auxiliar").first()
            bus = Bus.objects.filter(name="BUS-GENERICO").first()

            # Get bus, drivers and assistants

            posture = Service.objects.create(**validated_data)
            posture.status = Service.Status.ACTIVE
            posture.bus = bus
            posture.save()
            posture.add_drivers([driver.user_id])
            posture.add_assistants([assistant.user_id])
            for rate in rates:
                if rate.get('day') == day_of_week:
                    ServiceSeatRate.objects.create(service=posture, **rate)
            posture.calculate_durations()

        return service

    class Meta:
        model = Service
        exclude = ["drivers", "assistants"]


class CreateServiceSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    rates = CreateServiceSeatRateSerializer(many=True, write_only=True)
    date_range = serializers.CharField(max_length=30, write_only=True)

    def create(self, validated_data: dict):
        rates = validated_data.pop("rates")
        drivers: list[Personal] = validated_data.pop("drivers")  # pylint: disable=E1136
        assistants: list[Personal] = validated_data.pop("assistants")  # pylint: disable=E1136
        parent = validated_data.get("parent")
        title = validated_data.get("title")
        date_range = validated_data.pop("date_range")
        datetime_publish = datetime.combine(validated_data.get("datetime_publish"), parent.start_time)

        is_new = False

        validated_data["start_time"] = parent.start_time
        validated_data["datetime_from"] = parent.datetime_from
        validated_data["datetime_to"] = parent.datetime_to
        validated_data["service_type"] = parent.service_type
        validated_data["renovation_months"] = parent.renovation_months

        try:
            posture = Service.objects.get(parent=parent, datetime_publish=datetime_publish)
        except Service.DoesNotExist:
            posture = Service.objects.create(**validated_data)
            is_new = True
        if not is_new and date_range == 'all':
            postures = Service.objects.filter(parent=parent, datetime_publish__gte=datetime_publish)
        elif not is_new and date_range == 'same':
            postures = Service.objects.filter(parent=parent, datetime_publish__gte=datetime_publish,
                                              datetime_publish__week_day=datetime_publish.weekday())
        else:
            postures = [posture]

        for item in postures:
            if is_new:
                for rate in rates:
                    ServiceSeatRate.objects.create(service=item, **rate)
                # TODO: Podría ser opcional y jalar del padre
                # TODO: Mejorar par actualizar los rates

            item.calculate_durations()

            drivers_id = list(map(lambda d: d.user_id, drivers))
            assistants_id = list(map(lambda a: a.user_id, assistants))
            item.drivers.clear()
            item.assistants.clear()
            item.add_drivers(drivers_id)
            item.add_assistants(assistants_id)
            item.status = Service.Status.ACTIVE
            item.title = title
            item.save()

        # activate the parent service
        parent.status = Service.Status.ACTIVE
        parent.save()

        return posture

    class Meta:
        model = Service
        fields = [
            "id",
            "name",
            "title",
            "status",
            "datetime_publish",
            "parent",
            "route",
            "bus",
            "drivers",
            "assistants",
            "rates",
            "date_range",
        ]


class CreatePassengerSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    user = CreateCustomUserWithoutPasswordSerializer()

    def create(self, validated_data: dict):
        passenger, _ = Passenger.objects.update_or_create(**validated_data)
        return passenger

    class Meta:
        model = Passenger
        fields = "__all__"


class PassengerSerializer(serializers.ModelSerializer):
    user = CustomUserSerializer(read_only=True)

    class Meta:
        model = Passenger
        fields = "__all__"


class CreateTicketSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    passenger = CreatePassengerSerializer(required=True)

    class Meta:
        model = Ticket
        fields = "__all__"


class SimpleServiceSerializer(serializers.ModelSerializer):
    rates = ServiceSeatRateSerializer(many=True, read_only=True)

    class Meta:
        model = Service
        fields = "__all__"


class ServiceSerializer(serializers.ModelSerializer):
    route = RouteSerializer(read_only=True)
    bus = BusSerializer(read_only=True)
    drivers = PersonalSerializer(many=True, read_only=True)
    assistants = PersonalSerializer(many=True, read_only=True)
    start_city = CitySerializer(read_only=True, required=False, allow_null=True)
    end_city = CitySerializer(read_only=True, required=False, allow_null=True)
    web_seats = ComponentPolymorphicSerializer(many=True, read_only=True)
    sales_seats = ComponentPolymorphicSerializer(many=True, read_only=True)
    rates = ServiceSeatRateSerializer(many=True, read_only=True)

    class Meta:
        model = Service
        fields = "__all__"


class TicketSerializer(serializers.ModelSerializer):
    passenger = PassengerSerializer(required=True)
    service = ServiceSerializer(required=True)

    class Meta:
        model = Ticket
        fields = "__all__"


class CashRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = CashRegister
        fields = "__all__"


class ActiveCashRegisterRequestSerializer(serializers.Serializer):
    branch_office_id = serializers.IntegerField(required=True)


class OpenCashRegisterSerializer(serializers.Serializer):
    name = serializers.CharField()
    amount = serializers.DecimalField(max_digits=10, decimal_places=2)
    cashier = serializers.PrimaryKeyRelatedField(write_only=True, queryset=Personal.objects.all())
    branch = serializers.PrimaryKeyRelatedField(write_only=True, queryset=Branch.objects.all())
    printer = serializers.PrimaryKeyRelatedField(write_only=True, queryset=Printer.objects.all())

    @abstractmethod
    def create(self, validated_data):
        return CashRegister.objects.create(
            name=validated_data.get("name"),
            cashier=validated_data.get("cashier"),
            branch=validated_data.get("branch"),
            printer=validated_data.get("printer"),
        )

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class CashRegisterMovementSerializer(serializers.Serializer):
    cash_register_id = serializers.IntegerField()


class CashRegisterOperationMovementSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    ticket_number = serializers.IntegerField()
    payment_method = serializers.CharField()
    status = serializers.CharField()
    type = serializers.CharField()
    income = serializers.IntegerField()
    egress = serializers.IntegerField()
    date = serializers.DateTimeField()
    buy_order = serializers.CharField(required=False, allow_null=True)


class CashRegisterCashierRequestSerializer(serializers.Serializer):
    branch_office_id = serializers.IntegerField()


class CashierSerializer(serializers.Serializer):
    cashier_id = serializers.IntegerField()
    name = serializers.CharField()


class CashRegisterListMovementSerializer(serializers.Serializer):
    branch_office_id = serializers.IntegerField()
    name = serializers.CharField()


class CashRegisterCashierSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    cash_register = CashRegisterListMovementSerializer(many=False)
    cashier = CashierSerializer(many=False)
    start = serializers.DateTimeField()
    end = serializers.DateTimeField(allow_null=True)
    amount = serializers.IntegerField()
    status = serializers.CharField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class CloseCashRegisterSerializer(serializers.Serializer):
    cash_register = serializers.PrimaryKeyRelatedField(write_only=True, queryset=CashRegister.objects.all())

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass

    def validate(self, attrs):
        cash_register = attrs["cash_register"]
        if cash_register.status != CashRegister.Status.OPEN:
            raise serializers.ValidationError({"cash_register": "Cash register is not open"})
        return attrs


class DepositCashRegisterSerializer(serializers.Serializer):
    voucher = serializers.CharField(required=True)
    cash_register = serializers.PrimaryKeyRelatedField(write_only=True, queryset=CashRegister.objects.all())

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass

    def validate(self, attrs):
        cash_register = attrs["cash_register"]
        if cash_register.status not in [
            CashRegister.Status.PENDING,
            CashRegister.Status.BLOCKED,
        ]:
            raise serializers.ValidationError({"cash_register": "Cash register is not closed"})

        if CashRegisterMovement.objects.filter(voucher=attrs["voucher"]).exists():
            raise serializers.ValidationError({"voucher": "Voucher already used"})
        return attrs


class ReverseTicket(serializers.Serializer):
    ticket_id = serializers.IntegerField()
    percentage = serializers.IntegerField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class CashRegisterOperationReverseSerializer(serializers.Serializer):
    cash_register = serializers.PrimaryKeyRelatedField(queryset=CashRegister.objects.all(), required=True)
    buy_order = serializers.CharField()
    tickets = serializers.ListField(child=ReverseTicket())
    description = serializers.CharField()

    def validate(self, attrs):
        tickets_ids = [ticket.get("ticket_id") for ticket in attrs["tickets"]]
        sale: Sale = Sale.objects.filter(buy_order=attrs["buy_order"]).first()
        if sale is None:
            raise serializers.ValidationError({"buy_order": "Sale not found"})

        tickets = Ticket.objects.filter(id__in=tickets_ids)
        if tickets.count() != len(tickets_ids):
            raise serializers.ValidationError({"tickets": "Tickets not found"})

        return attrs

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class CashRegisterOperationSerializer(serializers.ModelSerializer):
    class Meta:
        model = CashRegisterOperation
        fields = "__all__"


class CreateSaleSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    created = serializers.DateTimeField(required=False)
    tickets = CreateTicketSerializer(many=True, required=False, allow_null=True)
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
    # start_bus_stop_id = serializers.PrimaryKeyRelatedField(
    #     required=False,
    #     allow_null=True,
    #     write_only=True,
    #     queryset=BusStop.objects.all(),
    # )
    # end_bus_stop_id = serializers.PrimaryKeyRelatedField(
    #     required=False,
    #     allow_null=True,
    #     write_only=True,
    #     queryset=BusStop.objects.all(),
    # )
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


class DashboardSaleIncomeRequestSerializer(serializers.Serializer):
    start_date = serializers.DateField(required=True)
    end_date = serializers.DateField(required=False)
    cash_register_id = serializers.PrimaryKeyRelatedField(
        required=False,
        write_only=True,
        queryset=CashRegister.objects.all(),
    )


class DashboardSaleIncomeSerializer(serializers.Serializer):
    status = serializers.CharField()
    total = serializers.IntegerField()


class DashboardSaleStateSerializer(serializers.Serializer):
    service_date = serializers.DateTimeField()


class DashboardActiveServicesRequestSerializer(serializers.Serializer):
    start_date = serializers.DateField(required=True)
    end_date = serializers.DateField(required=False)


class DashboardActiveServicesResponseSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    route = serializers.CharField()
    datetime_publish = serializers.DateTimeField()
    status = serializers.CharField()
    rates = ServiceSeatRateSerializer(many=True, read_only=True)


class DashboardSaleStateResponseSerializer(serializers.Serializer):
    status = serializers.CharField()
    quantity = serializers.IntegerField()
    total = serializers.DecimalField(max_digits=10, decimal_places=2)


class SaleStateResponseListSerializer(serializers.ListSerializer):
    child = DashboardSaleStateResponseSerializer()


class DashboardSalesReportRequestSerializer(serializers.Serializer):
    start_date = serializers.DateField(required=True)
    end_date = serializers.DateField(required=False)
    cash_register_id = serializers.PrimaryKeyRelatedField(
        required=True,
        write_only=True,
        queryset=CashRegister.objects.all(),
    )


class SaleSerializer(serializers.ModelSerializer):
    tickets = TicketSerializer(many=True, required=False, allow_null=True)
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

    class Meta:
        model = Sale
        fields = "__all__"


class SaleRetrieveSerializer(serializers.ModelSerializer):
    tickets = TicketSerializer(many=True, required=False, allow_null=True)
    seller_id = serializers.PrimaryKeyRelatedField(
        required=False,
        allow_null=True,
        write_only=True,
        queryset=Personal.objects.all(),
    )
    seller = SimplePersonalSerializer(required=False, allow_null=True, read_only=True)
    cash_register_id = serializers.PrimaryKeyRelatedField(
        required=False,
        allow_null=True,
        write_only=True,
        queryset=CashRegister.objects.all(),
    )
    cash_register = CashRegisterSerializer(required=False, allow_null=True, read_only=True)
    service = SimpleServiceSerializer(required=False, allow_null=True)
    id = serializers.IntegerField(required=False)
    created = serializers.DateTimeField(required=False)

    class Meta:
        model = Sale
        fields = "__all__"


class PassengerNationalitySerializer(serializers.ModelSerializer):
    class Meta:
        model = PassengerNationality
        fields = "__all__"


class ReservedSeatSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReservedSeat
        fields = "__all__"


class ReservedSeatsSerializer(serializers.ModelSerializer):
    seats = ReservedSeatSerializer(many=True, read_only=True)

    class Meta:
        model = ReservedSeats
        fields = "__all__"


class CreateReservedSeatsSerializer(serializers.ModelSerializer):
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


class SimplifiedServiceSerializer(serializers.ModelSerializer):
    route = SimplifiedRouteSerializer(read_only=True)
    rates = ServiceSeatRateSerializer(many=True, read_only=True)

    class Meta:
        model = Service
        fields = (
            "id",
            "code",
            "name",
            "status",
            "start_time",
            "datetime_publish",
            "datetime_from",
            "datetime_to",
            "service_type",
            "route",
            "rates",
        )


class DashboardCashRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = CashRegister
        fields = [
            "id",
            "name",
            "status",
            "actual_amount",
            "initial_amount",
            "cashier_fullname",
            "sucursal_name",
            "sucursal_id",
            "last_date_sale",
            "created",
            "last_status_date",
            "total_prints",
            "printer",
        ]


class CreateRefundRequestSerializer(serializers.Serializer):
    id = serializers.IntegerField(required=False)
    buy_order = serializers.CharField()
    email = serializers.EmailField()
    description = serializers.CharField()

    def create(self, validated_data):
        sale = Sale.objects.filter(buy_order=validated_data["buy_order"]).first()

        if sale is None:
            raise serializers.ValidationError({"buy_order": "not exists"})
        refund_data = {**validated_data, "sale": sale}
        refund_request = RefundRequest.objects.create(**refund_data)
        refund_request.send_mail()
        refund_request.notify_seller()
        return refund_request


class RefundRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = RefundRequest
        fields = "__all__"


class TariffRateSerializer(serializers.ModelSerializer):
    seat_type = SeatTypeSerializer(read_only=True)

    class Meta:
        model = StretchInfoRate
        fields = "__all__"


class StretchInfoSerializer(serializers.ModelSerializer):
    rates = TariffRateSerializer(many=True, read_only=True)
    end_bus_stop = BusStopSerializer(read_only=True)
    start_bus_stop = BusStopSerializer(read_only=True)

    class Meta:
        model = StretchInfo
        fields = "__all__"


class CouponSerializer(serializers.ModelSerializer):
    class Meta:
        model = Coupon
        fields = "__all__"


class SalesReportRequestSerializer(serializers.Serializer):
    start_date = serializers.DateField(required=True)
    end_date = serializers.DateField(required=False)
    cash_registers = serializers.ListField(child=serializers.IntegerField(), required=False)
    source = serializers.CharField(required=True)


class SalesReportResponseSerializer(serializers.Serializer):
    service = serializers.CharField()
    start_city = serializers.CharField()
    end_city = serializers.CharField()
    bus = serializers.CharField()
    total_seats = serializers.CharField()
    date = serializers.CharField()
    total_passenger = serializers.CharField()
    total = serializers.CharField()
    returned_amount = serializers.CharField()
    returned_ticket_count = serializers.CharField()


class AdvanceSalesReportRequestSerializer(serializers.Serializer):
    start_date = serializers.DateField(required=True)
    end_date = serializers.DateField(required=False)
    cash_registers = serializers.ListField(child=serializers.IntegerField(), required=False)
    source = serializers.CharField(required=True)


class AdvanceSalesResponseSerializer(serializers.Serializer):
    service = serializers.CharField()
    start_city = serializers.CharField()
    end_city = serializers.CharField()
    bus = serializers.CharField()
    total_seats = serializers.CharField()
    date = serializers.CharField()
    total_passenger = serializers.CharField()
    total = serializers.CharField()
    returned_amount = serializers.CharField()
    returned_ticket_count = serializers.CharField()


class DashboardPassengerTicketSerializer(serializers.Serializer):
    start_date = serializers.DateField(required=True)
    end_date = serializers.DateField(required=False)


class DashboardPassengerTicketResponse(serializers.Serializer):
    payment_date__date = serializers.DateField()
    quantity = serializers.IntegerField()


class CommissionReportRequestSerializer(serializers.Serializer):
    start_date = serializers.DateField(required=True)
    end_date = serializers.DateField(required=False)


class CommissionReportResponseSerializer(serializers.Serializer):
    date_from = serializers.DateField()
    date_to = serializers.DateField()
    route = serializers.CharField()
    branch_office = serializers.CharField()
    document_number = serializers.CharField()
    personal = serializers.CharField()
    percentage = serializers.DecimalField(max_digits=10, decimal_places=2)
    commission_amount = serializers.DecimalField(max_digits=10, decimal_places=2)
    sales_amount = serializers.DecimalField(max_digits=10, decimal_places=2)
    status = serializers.CharField()


class PaxListSimpleRequestSerializer(serializers.Serializer):
    service = serializers.IntegerField(required=True)


class ServiceMessageSerializer(serializers.ModelSerializer):
    personal = BasicPersonalSerializer(read_only=True)

    class Meta:
        model = ServiceMessage
        fields = "__all__"

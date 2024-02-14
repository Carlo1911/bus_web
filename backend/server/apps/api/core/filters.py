from django_filters import rest_framework as filters

from core.models import (
    CashRegister,
    Passenger,
    Route,
    Sale,
    Service,
    StretchInfo,
    Ticket,
)


class RouteFilter(filters.FilterSet):
    start_city = filters.NumberFilter(method="from_start_city")
    end_city = filters.NumberFilter(method="to_end_city")
    status = filters.BooleanFilter(method="filter_by_status")

    def filter_by_status(self, queryset, name, value):
        if value:
            return queryset.filter(services__status__in=[Service.Status.ACTIVE, Service.Status.CREATED]).distinct()
        return queryset.filter(services__status=Service.Status.DISABLED).distinct()

    def from_start_city(self, queryset, name, value):
        ids = [route.id for route in queryset if route.start_city and route.start_city.pk == value]
        return queryset.filter(id__in=ids)

    def to_end_city(self, queryset, name, value):
        ids = [route.id for route in queryset if route.end_city and route.end_city.pk == value]
        return queryset.filter(id__in=ids)

    class Meta:
        model = Route
        fields = [
            "start_city",
            "end_city",
            "status",
        ]


class ServiceFilter(filters.FilterSet):
    # TODO: add tests
    start_city = filters.NumberFilter(method="from_start_city")
    end_city = filters.NumberFilter(method="to_end_city")
    contain_start_city = filters.NumberFilter(method="method_contain_start_city")
    contain_end_city = filters.NumberFilter(method="method_contain_end_city")
    start_bus_stop = filters.NumberFilter(method="from_start_bus_stop")
    end_bus_stop = filters.NumberFilter(method="to_end_bus_stop")
    is_parent = filters.BooleanFilter(method="service_is_parent")

    def service_is_parent(self, queryset, name, value):
        return queryset.filter(parent=None) if value else queryset.exclude(parent=None)

    def from_start_city(self, queryset, name, value):
        ids = [service.id for service in queryset if service.start_city and service.start_city.pk == value]
        return queryset.filter(id__in=ids, status=Service.Status.ACTIVE)

    def to_end_city(self, queryset, name, value):
        ids = [service.id for service in queryset if service.end_city and service.end_city.pk == value]
        return queryset.filter(id__in=ids, status=Service.Status.ACTIVE)

    def method_contain_start_city(self, queryset, name, value):
        ids = []
        print(value, "contiene inicio")
        for service in queryset:
            for parada in service.route.stretches.all():
                if parada.start_bus_stop.city.pk == value:
                    ids.append(service.id)
        return queryset.filter(id__in=ids, status=Service.Status.ACTIVE)

    def method_contain_end_city(self, queryset, name, value):
        ids = []
        print(value, "contiene fin")
        for service in queryset:
            for parada in service.route.stretches.all():
                if parada.end_bus_stop.city.pk == value:
                    ids.append(service.id)
        return queryset.filter(id__in=ids, status=Service.Status.ACTIVE)

    def from_start_bus_stop(self, queryset, name, value):
        ids = set()
        for service in queryset:
            ids.update(service.id for stretch in service.route.stretches.all() if stretch.start_bus_stop_id == value)
        return queryset.filter(id__in=ids, status=Service.Status.ACTIVE)

    def to_end_bus_stop(self, queryset, name, value):
        ids = set()
        for service in queryset:
            ids.update(service.id for stretch in service.route.stretches.all() if stretch.end_bus_stop_id == value)
        return queryset.filter(id__in=ids, status=Service.Status.ACTIVE)

    class Meta:
        model = Service
        fields = {
            "datetime_from": ["lte", "gte"],
            "datetime_to": ["lte", "gte"],
            "datetime_publish": ["lte", "gte", "date"],
            "parent": ["exact"],
            "route": ["exact"],
            "bus": ["exact"],
            "status": ["exact"],
        }


class TicketFilter(filters.FilterSet):
    class Meta:
        model = Ticket
        fields = [
            "service",
            "quantity",
            "ticket_type",
            "ticket_source",
        ]


class SaleFilter(filters.FilterSet):

    rut = filters.CharFilter(method="lookup_rut")

    def lookup_rut(self, queryset, name, value):
        if value:
            ids = [sale.id for sale in queryset if value in sale.get_ruts]
            return queryset.filter(id__in=ids).distinct()
        return queryset

    class Meta:
        model = Sale
        fields = [
            "rut",
            "buy_order",
            "payment_status",
            "status",
            "seller",
        ]


class CashRegisterFilter(filters.FilterSet):
    class Meta:
        model = CashRegister
        fields = [
            "name",
            "cashier",
            "branch",
        ]


class PassengerFilter(filters.FilterSet):
    class Meta:
        model = Passenger
        fields = [
            "passenger_type",
            "user__sex",
            "user__date_of_birth",
            "user__document_number",
            "user__email",
            "user__cellphone",
        ]


class StretchInfoFilter(filters.FilterSet):
    class Meta:
        model = StretchInfo
        fields = {
            "start_bus_stop": ["in", "exact"],
            "end_bus_stop": ["in", "exact"],
            "start_bus_stop__city_id": ["in", "exact"],
            "end_bus_stop__city_id": ["in", "exact"],
        }

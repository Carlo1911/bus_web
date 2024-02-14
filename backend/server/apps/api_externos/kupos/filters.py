from django_filters import rest_framework as filters

# Models
from core.models import Service, Sale
from locations.models import BusStop
from users.models import CustomUser


class SaleKuposFilter(filters.FilterSet):

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


class CustomUserKuposFilter(filters.FilterSet):
    class Meta:
        model: CustomUser
        fields = {"document_number": ["exact"]}


class StopKuposFilter(filters.FilterSet):
    class Meta:
        model = BusStop
        fields = {"city_id": ["in"]}


class ServiceKuposFilter(filters.FilterSet):
    start_city = filters.NumberFilter(method="from_start_city")
    end_city = filters.NumberFilter(method="to_end_city")
    start_bus_stop = filters.NumberFilter(method="from_start_bus_stop")
    end_bus_stop = filters.NumberFilter(method="to_end_bus_stop")

    def from_start_city(self, queryset, name, value):
        ids = [service.id for service in queryset if service.start_city and service.start_city.pk == value]
        return queryset.filter(id__in=ids, status=Service.Status.ACTIVE)

    def to_end_city(self, queryset, name, value):
        ids = [service.id for service in queryset if service.end_city and service.end_city.pk == value]
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
            "route": ["exact"],
            "bus": ["exact"],
            "status": ["exact"],
        }

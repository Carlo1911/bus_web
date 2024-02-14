from django_filters import rest_framework as filters

from core.models import Service
from locations.models import (
    BusStop,
    City,
)


class BusStopFilter(filters.FilterSet):
    service = filters.NumberFilter(method="service_filter")

    def service_filter(self, queryset, name, value):
        if not value:
            return queryset
        try:
            service = Service.objects.get(id=value).select_related("route")
        except Service.DoesNotExist:
            return queryset
        ids = set()
        for stretch in service.route.stretches.all():
            ids.add(stretch.start_bus_stop_id)
            ids.add(stretch.end_bus_stop_id)

        return queryset.filter(id__in=ids)

    class Meta:
        model = BusStop
        fields = {"city_id": ["in"]}


class CityFilter(filters.FilterSet):
    services_available = filters.BooleanFilter(method="services_available_filter")
    start_city = filters.NumberFilter(method="from_start_city")
    start_bus_stop = filters.NumberFilter(method="from_start_bus_stop")

    def services_available_filter(self, queryset, name, value):
        if value:
            return queryset.filter(
                id__in=[
                    service.start_city.pk
                    for service in Service.objects.filter(parent=None, status=Service.Status.ACTIVE).select_related(
                        "bus", "route"
                    )
                    if service.start_city
                ]
            )
        return queryset

    def from_start_city(self, queryset, name, value):
        return queryset.filter(
            id__in=[
                service.end_city.pk
                for service in Service.objects.filter(parent=None, status=Service.Status.ACTIVE).select_related(
                    "bus", "route"
                )
                if service.start_city and service.end_city and service.start_city.pk == value
            ]
        )

    def from_start_bus_stop(self, queryset, name, value):
        stretch_ids = set()
        for service in Service.objects.filter(parent=None, status=Service.Status.ACTIVE).select_related("route"):
            stretch_is_found = False
            for stretch in service.route.stretches.all():
                if stretch.start_bus_stop_id == value or stretch_is_found:
                    stretch_is_found = True
                    stretch_ids.add(stretch.id)
        return queryset.filter(id__in=stretch_ids)

    class Meta:
        model = City
        fields = [
            "region",
            "services_available",
            "start_city",
            "start_bus_stop",
        ]

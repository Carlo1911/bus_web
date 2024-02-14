from django_filters import rest_framework as filters

from transportation.models import Bus


class BusFilter(filters.FilterSet):
    # TODO: Filter for services (m2m)

    class Meta:
        model = Bus
        fields = {
            "vehicle_type": ["exact"],
            "status": ["exact"],
            "plate": ["icontains"],
            "brand": ["exact"],
            "model": ["exact"],
            "owner": ["exact"],
            "layout": ["exact"],
        }

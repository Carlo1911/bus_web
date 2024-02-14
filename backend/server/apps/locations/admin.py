from django.contrib import admin

from .models import (
    Branch,
    BusStop,
    City,
    Region,
)


@admin.register(Region)
class RegionAdmin(admin.ModelAdmin):
    search_fields = [
        "name",
        "code",
    ]
    list_display = (
        "name",
        "code",
    )


@admin.register(City)
class CityAdmin(admin.ModelAdmin):
    search_fields = [
        "name",
        "code",
    ]
    list_display = (
        "name",
        "priority",
        "code",
    )


@admin.register(BusStop)
class BusStopAdmin(admin.ModelAdmin):
    search_fields = [
        "name",
        "code",
    ]
    list_filter = ("city", "stop_type", "status")
    list_display = (
        "name",
        "code",
        "city",
        "stop_type",
    )


@admin.register(Branch)
class BranchAdmin(admin.ModelAdmin):
    search_fields = [
        "name",
        "code",
    ]
    list_display = (
        "name",
        "code",
        "city",
    )

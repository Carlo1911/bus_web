from django.contrib import admin
from polymorphic.admin import (
    PolymorphicChildModelAdmin,
    PolymorphicChildModelFilter,
    PolymorphicParentModelAdmin,
)

from .forms import SeatForm
from .models import (
    Benefit,
    Bus,
    Component,
    Floor,
    Layout,
    Seat,
    SeatType,
)


@admin.register(Bus)
class BusAdmin(admin.ModelAdmin):
    search_fields = ['name']
    list_display = ('name', 'status', 'plate')
    fieldsets = (
        (
            None,
            {
                'fields': (
                    'code',
                    'name',
                    'vehicle_type',
                    'layout',
                    'status',
                    'plate',
                    'kilometers',
                    'motor_serial_number',
                    'chassis_serial_number',
                    'color',
                    'year',
                    'insurance_policy',
                    'insurance_policy_end_date',
                    'brand',
                    'model',
                    'owner',
                ),
            },
        ),
    )


@admin.register(Benefit)
class BenefitAdmin(admin.ModelAdmin):
    search_fields = ['name']


@admin.register(Layout)
class LayoutAdmin(admin.ModelAdmin):
    search_fields = ['name']


@admin.register(Floor)
class FloorAdmin(admin.ModelAdmin):
    list_display = ('layout', 'number')
    list_filter = ('layout',)


@admin.register(SeatType)
class SeatTypeAdmin(admin.ModelAdmin):
    search_fields = ['name']


class ComponentChildAdmin(PolymorphicChildModelAdmin):
    base_model = Component
    base_fieldsets = (
        ('General', {'fields': ('kind',)}),
        (
            'Posición',
            {'fields': ('position_x', 'position_y', 'width', 'length')},
        ),
    )


@admin.register(Seat)
class SeatAdmin(ComponentChildAdmin):
    base_model = Seat
    form = SeatForm
    show_in_index = True
    list_filter = ('seat_kind',)
    fieldsets = (
        ('General', {'fields': ('kind', 'seat_kind', 'code')}),
        (
            'Posición',
            {'fields': ('position_x', 'position_y', 'width', 'length')},
        ),
    )


@admin.register(Component)
class ComponentAdmin(PolymorphicParentModelAdmin):
    base_model = Component
    child_models = (Seat, Component)
    list_filter = (PolymorphicChildModelFilter,)
    fieldsets = (
        ('General', {'fields': ('kind',)}),
        (
            'Posición',
            {'fields': ('position_x', 'position_y', 'width', 'length')},
        ),
    )

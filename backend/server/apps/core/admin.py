from django.contrib import admin
from django.utils.html import format_html

from .filters import (
    EndBusStopFilter,
    StartBusStopFilter,
)
from .models import (
    CashRegister,
    Coupon,
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
    ServiceMessage,
    ServiceRouteStretch,
    ServiceSeatRate,
    StretchInfo,
    StretchInfoRate,
    Ticket,
)


@admin.register(Coupon)
class CouponAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "code",
        "discount",
        "valid_from",
        "valid_to",
        "count_uses",
        "max_uses",
    )
    list_filter = ("valid_from", "valid_to")
    search_fields = ("code",)


class TariffRateInline(admin.TabularInline):
    model = StretchInfoRate
    extra = 0


@admin.register(StretchInfo)
class StretchInfoAdmin(admin.ModelAdmin):
    search_fields = ["start_bus_stop__name", "end_bus_stop__name"]
    inlines = [TariffRateInline]
    list_filter = [StartBusStopFilter, EndBusStopFilter]
    list_display = [
        "start_bus_stop",
        "end_bus_stop",
        "duration",
        "distance",
        "created_at",
    ]
    list_filter = ["start_bus_stop", "end_bus_stop"]


class ReservedSeatInline(admin.TabularInline):
    model = ReservedSeat
    fields = (
        "seat",
        "format_is_taken",
    )
    readonly_fields = (
        "seat",
        "format_is_taken",
    )
    can_delete = False
    extra = 0

    def has_add_permission(self, request, obj=None):
        return False

    def format_is_taken(self, obj):
        text = "Sí" if obj.is_taken else "No"
        color = "green" if obj.is_taken else "red"
        return format_html(f"<b style='color:{color};'>{text}</b>")

    format_is_taken.short_description = "¿Reservado?"


@admin.register(Sale)
class SaleAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "created",
        "buy_order",
        "payment_status",
    )


@admin.register(ReservedSeats)
class ReservedSeatsAdmin(admin.ModelAdmin):
    list_display = (
        "service",
        "platform",
        "total_seats",
        "reserved_seats",
        "current_datetime",
    )
    list_filter = (
        "service",
        "platform",
    )
    inlines = [ReservedSeatInline]

    def has_add_permission(self, request):
        return False

    def total_seats(self, obj):
        return obj.seats.count()

    def reserved_seats(self, obj):
        return obj.seats.filter(is_taken=True).count()

    total_seats.short_description = "Cantidad de asientos"
    reserved_seats.short_description = "Cantidad de asientos tomados"


class RouteStretchInline(admin.TabularInline):
    model = RouteStretch
    extra = 0


@admin.register(Passenger)
class PassengerAdmin(admin.ModelAdmin):
    pass
    # list_display = (
    #     "name",
    #     "last_name",
    #     "document_number",
    #     "email",
    #     "phone",
    # )
    # list_filter = ("gender",)


@admin.register(PassengerNationality)
class PassengerNationalityAdmin(admin.ModelAdmin):
    list_display = ("name", "code")


@admin.register(Route)
class RouteAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "from_to_city", "available")
    inlines = [RouteStretchInline]

    def from_to_city(self, obj):
        if obj.start_city and obj.end_city:
            return f"{obj.start_city.name} --> {obj.end_city.name}"
        return "-"

    from_to_city.short_description = "Ciudades"

    def available(self, obj):
        return "Sí" if obj.status else "No"

    available.short_description = "En uso"


class ServiceSeatRateInline(admin.TabularInline):
    model = ServiceSeatRate
    extra = 0


class ServiceRouteStretchInline(admin.TabularInline):
    model = ServiceRouteStretch
    extra = 0


@admin.register(Service)
class ServiceAdmin(admin.ModelAdmin):
    search_fields = ["name", "route__name"]
    list_display = (
        "id",
        "name",
        "datetime_from",
        "datetime_to",
        "datetime_publish",
        "is_parent",
        "route",
        "bus",
        "status",
    )
    list_filter = ("status", "service_type", "route", "bus")
    inlines = [ServiceSeatRateInline, ServiceRouteStretchInline]
    autocomplete_fields = ["parent"]

    def is_parent(self, obj):
        return "Sí" if obj.parent is None else "No"

    is_parent.short_description = "Es padre"


@admin.register(RateType)
class RateTypeAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "time_start", "time_end")


@admin.register(RouteStretchRate)
class RouteStretchRateAdmin(admin.ModelAdmin):
    list_display = ("id", "route_stretch", "seat_type", "price")
    list_filter = ("seat_type",)


@admin.register(RouteStretch)
class RouteStretchAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "route",
        "status",
    )
    list_filter = (
        "status",
        "route",
    )


@admin.register(CashRegister)
class CashRegisterAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "name",
        "cashier",
        "branch",
        "status",
    )
    list_filter = ("status",)

    def branch(self, obj):
        return obj.branch.name

    def cashier(self, obj):
        return obj.cashier.name

    branch.short_description = "Sucursal"
    cashier.short_description = "Cajero"


@admin.register(Printer)
class PrinterAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "total_prints")


@admin.register(RefundRequest)
class RefundRequestAdmin(admin.ModelAdmin):
    list_display = ("id", "buy_order", "email", "created_at", "total_tickets", "sale")
    list_filter = ("created_at",)
    search_fields = ("email", "buy_order")

    def total_tickets(self, obj):
        return obj.tickets.all().count()

    total_tickets.short_description = "Cantidad te tickets"


@admin.register(Ticket)
class TicketAdmin(admin.ModelAdmin):
    list_display = ("passenger", "service", "seat", "ticket_status", "is_refunded")
    list_filter = ("ticket_status",)
    search_fields = ("passenger", "service__name")
    list_per_page: int = 50
    readonly_fields = ["service", "seat", "passenger", "one_way_parent"]
    autocomplete_fields = ["one_way_parent"]
    fieldsets = (
        (
            None,
            {
                "fields": (
                    "service",
                    "ticket_source",
                    "ticket_type",
                    "one_way_parent",
                    "seat",
                    "price",
                    "discount",
                    "quantity",
                    "passenger",
                    "ticket_status",
                    "start_bus_stop",
                    "end_bus_stop",
                ),
            },
        ),
    )


@admin.register(ServiceMessage)
class ServiceMessageAdmin(admin.ModelAdmin):
    list_display = ("id", "message", "personal", "service")
    list_filter = ("personal",)

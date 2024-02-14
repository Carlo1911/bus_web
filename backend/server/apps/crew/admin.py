from django.contrib import admin

from .models import (
    Commission,
    CommissionLog,
    Motive,
    Personal,
    Position,
)


class PositionInline(admin.TabularInline):
    model = Personal.positions.through
    extra = 0


@admin.register(Personal)
class PersonalAdmin(admin.ModelAdmin):
    search_fields = ["user__first_name", "user__last_name", "user__document_number"]
    list_display = ("user_full_name", "user_document_number", "status")
    inlines = [PositionInline]
    autocomplete_fields = ["user"]

    def user_full_name(self, obj):
        return obj.user.full_name

    def user_document_number(self, obj):
        return obj.user.document_number

    user_document_number.short_description = "# Documento"
    user_full_name.short_description = "Nombre completo"


@admin.register(Motive)
class MotiveAdmin(admin.ModelAdmin):
    search_fields = ["description"]
    list_display = ("description",)
    # TODO: Mostrar cantidad de personas con motivos total y en la fecha vigente


@admin.register(Position)
class PositionAdmin(admin.ModelAdmin):
    search_fields = ["description"]
    list_display = ("description",)
    # TODO: Mostrar cantidad de personal con esa posición activa


@admin.register(Commission)
class CommissionAdmin(admin.ModelAdmin):
    search_fields = ["personal__user__first_name", "personal__user__document_number"]
    list_display = (
        "percentage",
        "date_from",
        "date_to",
        "status",
        "personal",
        "total_logs",
    )
    list_filter = ("status",)
    # TODO: Filtrar por fechas

    def total_logs(self, obj):
        return obj.logs.count()

    total_logs.short_description = "# comisiones previas"


@admin.register(CommissionLog)
class CommissionLogAdmin(admin.ModelAdmin):
    search_fields = [
        "commission__personal__user__first_name",
        "commission__personal__user__document_number",
    ]
    list_display = ("commission", "percentage", "date_from", "date_to")
    # TODO: Filtrar por fechas y por personal o comission

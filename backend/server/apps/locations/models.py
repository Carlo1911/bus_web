from django.db import models
from django.utils.translation import gettext_lazy as _

from utils.models import TimestampMixin


class Region(models.Model):
    code = models.CharField(_("Código"), max_length=10, blank=True, null=True)
    name = models.CharField(_("Nombre"), max_length=255)
    iso_code = models.CharField(_("Código ISO"), max_length=20, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Región"
        verbose_name_plural = "Regiones"


class City(models.Model):
    code = models.CharField(_("Código"), max_length=10, blank=True, null=True)
    name = models.CharField(_("Nombre"), max_length=255)
    priority = models.IntegerField(_("Prioridad"), default=0)
    region = models.ForeignKey(
        Region, on_delete=models.CASCADE, verbose_name=_("Región")
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Ciudad"
        verbose_name_plural = "Ciudades"


class BusStop(TimestampMixin):
    class BusStopStatus(models.TextChoices):
        ACTIVE = "active", _("Activo")
        INACTIVE = "inactive", _("Inactivo")

    class StopType(models.TextChoices):
        TERMINAL = "terminal", "Terminal"
        STOP = "stop", "Parada"

    status = models.CharField(
        choices=BusStopStatus.choices, max_length=20, default=BusStopStatus.ACTIVE
    )
    order = models.IntegerField(_("Orden"), default=0)
    code = models.CharField(_("Código"), max_length=10, blank=True, null=True)
    name = models.CharField(_("Nombre"), max_length=255)
    city = models.ForeignKey(
        City,
        verbose_name="Ciudad",
        on_delete=models.CASCADE,
        related_name="bus_stops",
    )
    latitude = models.CharField(_("Latitud"), max_length=15, blank=True, null=True)
    longitude = models.CharField(_("Longitud"), max_length=15, blank=True, null=True)
    stop_type = models.CharField(
        _("Tipo de parada"),
        max_length=9,
        choices=StopType.choices,
        default=StopType.STOP,
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Parada de bus"
        verbose_name_plural = "Paradas de bus"


class Branch(TimestampMixin):
    code = models.CharField(_("Código"), max_length=10, blank=True, null=True)
    name = models.CharField(_("Nombre"), max_length=255)
    city = models.ForeignKey(
        City, verbose_name="Ciudad", on_delete=models.CASCADE, related_name="branches"
    )
    latitude = models.CharField(_("Latitud"), max_length=15, blank=True, null=True)
    longitude = models.CharField(_("Longitud"), max_length=15, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Sucursal"
        verbose_name_plural = "Sucursales"

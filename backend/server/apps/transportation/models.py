from django.db import models
from django.utils.translation import gettext_lazy as _
from polymorphic.models import PolymorphicModel

from utils.models import TimestampMixin


class Benefit(models.Model):
    name = models.CharField(_('Nombre'), max_length=50)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _('Prestación de bus')
        verbose_name_plural = _('Prestaciones de bus')


class Layout(TimestampMixin, models.Model):
    name = models.CharField(_('Nombre'), max_length=40)
    description = models.TextField(_('Descripción'), blank=True, null=True)

    class Meta:
        verbose_name = _('Disposición en bus')
        verbose_name_plural = _('Disposición de bus')

    def image_by_floor(self, floor_number: int) -> str:
        # TODO: Generate an image by floor
        return f'{floor_number}.jpg'

    def __str__(self):
        return self.name

    @property
    def total_seats(self) -> int:
        return sum(floor.seats for floor in self.floors.all())

    @property
    def total_floors(self) -> int:
        return self.floors.count()


class Bus(TimestampMixin, models.Model):
    class VehicleType(models.IntegerChoices):
        REGULAR = 1, 'Regular'
        PICKUP = 2, 'Pickup'
        PERSONAL = 3, 'Vehículo Personal'

    class Status(models.IntegerChoices):
        ON_SERVICE = 1, 'En servicio'
        OUT_SERVICE = 2, 'Fuera de servicio'
        PROPOSAL = 3, 'Propuesto'
        MAINTAINANCE = 4, 'Mantenimiento'

    code = models.CharField(_('Código'), max_length=40)
    name = models.CharField(_('Nombre'), max_length=40)
    vehicle_type = models.IntegerField(_('Tipo'), choices=VehicleType.choices)
    status = models.IntegerField(_('Estado'), choices=Status.choices)
    plate = models.CharField(_('Placa'), max_length=10)
    kilometers = models.IntegerField(_('Kilómetros'), blank=True, null=True)
    motor_serial_number = models.CharField(
        _('Número de serie del motor'), max_length=50, blank=True, null=True
    )
    chassis_serial_number = models.CharField(
        _('Número de serie del Chasís'), max_length=50, blank=True, null=True
    )
    color = models.CharField(_('Color'), max_length=60, blank=True, null=True)
    year = models.PositiveSmallIntegerField(_('Año'), blank=True, null=True)
    insurance_policy = models.CharField(
        _('Póliza de seguro'), max_length=50, blank=True, null=True
    )
    insurance_policy_end_date = models.DateField(
        _('Fecha de fin de póliza de seguro'), blank=True, null=True
    )
    brand = models.CharField(_('Marca'), max_length=50, blank=True, null=True)
    model = models.CharField(_('Modelo'), max_length=50, blank=True, null=True)
    owner = models.CharField(_('Dueño'), max_length=50, blank=True, null=True)
    services = models.ManyToManyField(Benefit, verbose_name=_('Prestaciones ofrecidas'))
    layout = models.ForeignKey(
        Layout,
        verbose_name=_('Disposición'),
        on_delete=models.CASCADE,
        blank=True,
        null=True,
    )

    class Meta:
        verbose_name = _('Bus')
        verbose_name_plural = _('Buses')

    def __str__(self):
        return self.name

    @property
    def tuple_fields(self):
        return (
            self.code,
            self.name,
            self.get_vehicle_type_display(),
            self.get_status_display(),
            self.plate,
            self.kilometers,
            self.motor_serial_number,
            self.chassis_serial_number,
            self.color,
            self.year,
            self.insurance_policy,
            self.insurance_policy_end_date,
            self.brand,
            self.model,
            self.owner,
            self.layout.name if self.layout else '',
        )

    @property
    def components(self):
        return Component.objects.filter(floors__layout=self.layout).order_by(
            '-floors__number'
        )

    @property
    def total_seats(self):
        if self.layout:
            return sum(floor.seats for floor in self.layout.floor_set.all())
        return 0

    @property
    def total_kilometers(self) -> int:
        return 0


class Floor(models.Model):
    layout = models.ForeignKey(
        Layout,
        verbose_name=_('Diseño de bus'),
        on_delete=models.CASCADE,
        related_name='floors',
    )
    number = models.PositiveSmallIntegerField(_('Número de piso'), default=1)
    length = models.PositiveSmallIntegerField(_('Largo de canvas'))
    width = models.PositiveSmallIntegerField(_('Ancho de canvas'))
    seats = models.PositiveSmallIntegerField(_('Número de asientos'))

    def __str__(self) -> str:
        return f'[{self.layout.name}] Piso {self.number}'

    class Meta:
        verbose_name = 'Piso'
        verbose_name_plural = 'Pisos'


class Component(PolymorphicModel):
    class Type(models.TextChoices):
        SEAT = 'seat', 'Asiento'
        BATH = 'bath', 'Baño'
        HALL = 'hall', 'Pasillo'
        STAIR = 'stair', 'Escalera'
        TELE = 'tele', 'Televisión'
        DISPENSER = 'dispenser', 'Dispensador'
        SPACE = 'space', 'Espacio'

    position_x = models.PositiveSmallIntegerField(_('Posición X'), default=1)
    position_y = models.PositiveSmallIntegerField(_('Posición Y'), default=1)
    width = models.PositiveSmallIntegerField(_('Ancho'), default=1)
    length = models.PositiveSmallIntegerField(_('Largo'), default=1)
    floors = models.ForeignKey(
        Floor,
        verbose_name=_('Piso'),
        related_name='components',
        on_delete=models.CASCADE,
        blank=True,
        null=True,
    )
    kind = models.CharField(_('Tipo'), max_length=10, choices=Type.choices)

    def __str__(self):
        return f'{self.get_kind_display()}'

    class Meta:
        verbose_name = _('Componente')
        verbose_name_plural = _('Componentes')


class SeatType(models.Model):
    name = models.CharField(_('Nombre'), max_length=50)

    class Meta:
        verbose_name = 'Tipo de asiento'
        verbose_name_plural = 'Tipos de asiento'

    def __str__(self):
        return self.name


class Seat(Component):
    """
    code: Seat Number like A1, A2, A3, etc.

    Args:
        Component ([type]): [description]
    """

    seat_kind = models.ForeignKey(
        SeatType, verbose_name=_('Tipo'), on_delete=models.CASCADE
    )
    code = models.CharField(_('Código'), max_length=10, blank=True, null=True)

    def __str__(self):
        return f'{self.seat_kind.name} {self.code}'

    class Meta:
        verbose_name = _('Asiento')
        verbose_name_plural = _('Asientos')

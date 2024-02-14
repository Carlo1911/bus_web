from django.db import models
from django.db.models.signals import post_delete
from django.dispatch.dispatcher import receiver
from django.utils.translation import gettext_lazy as _

from locations.models import Branch
from users.models import CustomUser
from utils.models import TimestampMixin


class Position(TimestampMixin, models.Model):
    description = models.CharField(_("Descripción"), max_length=70, unique=True)

    class Meta:
        verbose_name = _("Cargo")
        verbose_name_plural = _("Cargos")

    def __str__(self):
        return self.description


class Motive(models.Model):
    description = models.CharField(_("Descripción"), max_length=70)

    class Meta:
        verbose_name = _("Motivo")
        verbose_name_plural = _("Motivos")

    def __str__(self):
        return self.description


class Personal(TimestampMixin, models.Model):
    class Status(models.IntegerChoices):
        INACTIVE = 1, "Inactivo"
        ACTIVE = 2, "Activo"
        LICENSE = 3, "Licencia"
        UNLINK = 4, "Desvinculado"

    class ContractType(models.TextChoices):
        UNLIMITED = "unlimited", "Indefinite"
        FIXED = "fixed", "Plazo fijo"

    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE, primary_key=True)
    status = models.IntegerField(_("Estado"), choices=Status.choices, default=Status.ACTIVE)
    contract_type = models.CharField(
        _("Tipo de contrato"),
        max_length=10,
        choices=ContractType.choices,
        default=ContractType.FIXED,
    )
    contract_date = models.DateField(_("Fecha de contratación"), blank=True, null=True)
    motives = models.ManyToManyField(
        Motive,
        through="PersonalMotive",
        through_fields=("personal", "motive"),
    )
    positions = models.ManyToManyField(
        Position,
        through="PersonalPosition",
        through_fields=("personal", "position"),
    )
    # TODO: Un usuario puede estar en más de un terminal registrado?
    branch = models.ForeignKey(Branch, on_delete=models.SET_NULL, null=True, blank=True)

    def add_motives(self, motives_id, date_from, date_to, manage_personal):
        for motive_id in motives_id:
            self.motives.add(
                motive_id,
                through_defaults={
                    "date_from": date_from,
                    "date_to": date_to,
                    "manage_personal": manage_personal,
                },
            )

    def remove_motives(self, motives_id):
        for motive_id in motives_id:
            self.motives.remove(motive_id)

    def add_positions(self, position_ids):
        for position_id in position_ids:
            self.positions.add(position_id)

    @classmethod
    def contract_type_options(cls):
        return [option[0] for option in cls.ContractType.choices]

    @classmethod
    def status_options(cls):
        return [option[0] for option in cls.Status.choices]

    class Meta:
        verbose_name = _("Personal")
        verbose_name_plural = _("Personal")

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"


class PersonalPosition(models.Model):
    class Status(models.IntegerChoices):
        INACTIVE = 1, "Inactivo"
        ACTIVE = 2, "Activo"

    position = models.ForeignKey(Position, verbose_name=_("Posición"), on_delete=models.CASCADE)
    personal = models.ForeignKey(Personal, verbose_name=_("Personal"), on_delete=models.CASCADE)
    status = models.IntegerField(_("Estado"), choices=Status.choices, default=Status.ACTIVE)


class PersonalMotive(models.Model):
    motive = models.ForeignKey(Motive, verbose_name=_("Motivo"), on_delete=models.CASCADE)
    personal = models.ForeignKey(Personal, verbose_name=_("Personal"), on_delete=models.CASCADE)
    date_from = models.DateField(_("Desde"), blank=True, null=True)
    date_to = models.DateField(_("Hasta"), blank=True, null=True)
    created_at = models.DateTimeField(_("Fecha de creacion"), auto_now_add=True, blank=True, null=True)
    manage_personal = models.CharField("Usuario responsable", max_length=50, blank=True, null=True)


class Commission(TimestampMixin, models.Model):
    class Status(models.IntegerChoices):
        INACTIVE = 1, "Inactivo"
        ACTIVE = 2, "Activo"

    percentage = models.DecimalField(_("Porcentaje"), max_digits=5, decimal_places=2)
    date_from = models.DateField(_("Desde"))
    date_to = models.DateField(_("Hasta"))
    personal = models.ForeignKey(
        Personal,
        verbose_name=_("Personal"),
        on_delete=models.CASCADE,
        related_name="commissions",
    )
    route = models.ForeignKey(
        "core.Route",
        verbose_name=_("Ruta"),
        on_delete=models.CASCADE,
        related_name="commissions",
    )
    status = models.IntegerField(_("Estado"), choices=Status.choices, default=Status.ACTIVE)

    def __str__(self) -> str:
        return f"Comisión de {self.personal.user.first_name} \
            {self.personal.user.last_name}"

    class Meta:
        verbose_name = _("Comisión")
        verbose_name_plural = _("Comisiones")


class CommissionLog(TimestampMixin, models.Model):
    commission = models.ForeignKey(
        Commission,
        verbose_name=_("Comisión"),
        on_delete=models.CASCADE,
        related_name="logs",
    )
    date = models.DateField(_("Fecha"), auto_now_add=True)
    percentage = models.DecimalField(_("Porcentaje"), max_digits=5, decimal_places=2)
    date_from = models.DateField(_("Desde"))
    date_to = models.DateField(_("Hasta"))
    user = models.ForeignKey(CustomUser, verbose_name=_("Usuario"), on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self) -> str:
        return f"Log de comisión de {self.commission.personal.user.first_name} \
            {self.commission.personal.user.last_name}"

    class Meta:
        verbose_name = _("Log de comisión")
        verbose_name_plural = _("Logs de comisiones")


# Signals
@receiver(post_delete, sender=Personal)
def delete_img_pre_delete_post(sender, instance, *args, **kwargs):
    instance.user.delete()

import string
import random

from django.contrib.auth.models import (
    AbstractUser,
    Group,
)
from django.db import models
from django.utils.translation import gettext_lazy as _
from rut_chile import rut_chile
from django.core.exceptions import ValidationError


class Nationality(models.Model):
    code = models.CharField(_("Código"), max_length=10, blank=True, null=True)
    name = models.CharField(_("Nombre"), max_length=255)

    def __str__(self):
        return f"{self.code} {self.name}"

    class Meta:
        verbose_name = "Nacionalidad"
        verbose_name_plural = "Nacionalidades"


class Role(Group):
    # TODO: Add through model
    class Meta:
        proxy = True
        verbose_name = _("Rol")
        verbose_name_plural = _("Roles")


class CustomUser(AbstractUser):
    class DocumentType(models.TextChoices):
        RUT = "RUT", "RUT"
        DNI = "DNI", "DNI"
        PASSPORT = "PASSPORT", "PASSPORT"

    class Sex(models.TextChoices):
        MAN = "M", "Masculino"
        WOMAN = "F", "Femenino"
        OTHER = "O", "Otros"

    date_of_birth = models.DateTimeField(_("Fecha de nacimiento"), blank=True, null=True)
    document_type = models.CharField(
        _("Tipo de documento"),
        max_length=9,
        choices=DocumentType.choices,
        default=DocumentType.RUT,
        blank=True,
        null=True,
    )
    nationality = models.ForeignKey(
        Nationality,
        on_delete=models.CASCADE,
        blank=True,
        null=True,
        verbose_name=_("Nacionalidad"),
    )
    maternal_last_name = models.CharField(_("Apellido Materno"), max_length=70, blank=True, null=True)
    document_number = models.CharField(_("RUT"), max_length=12)
    cellphone = models.CharField(_("Número de celular"), max_length=15, blank=True, null=True)
    phone = models.CharField(_("Número de casa"), max_length=15, blank=True, null=True)
    image = models.ImageField(_("Imagen"), upload_to="driver/", blank=True, null=True)
    sex = models.CharField(_("Sexo"), max_length=1, choices=Sex.choices, blank=True, null=True)
    address = models.CharField(_("Dirección"), max_length=120, blank=True, null=True)
    work_phone = models.CharField(_("Número de trabajo"), max_length=15, blank=True, null=True)
    work_address = models.CharField(_("Dirección de trabajo"), max_length=120, blank=True, null=True)

    REQUIRED_FIELDS = [
        "email",
        "first_name",
        "last_name",
        "document_number",
    ]

    @classmethod
    def sex_options(cls):
        return [option[0] for option in cls.Sex.choices]

    def add_groups(self, groups_id):
        for group_id in groups_id:
            self.groups.add(group_id)

    def remove_groups(self, groups_id):
        for group_id in groups_id:
            self.groups.remove(group_id)

    def add_permissions(self, permissions_id):
        for permission_id in permissions_id:
            self.user_permissions.add(permission_id)

    def remove_permissions(self, permissions_id):
        for permission_id in permissions_id:
            self.user_permissions.remove(permission_id)

    def __str__(self):
        return self.username

    def save(self, *args, **kwargs):
        print(self.document_number, self.username)
        if self.document_type == "RUT":
            if self.document_number != "":
                if not rut_chile.is_valid_rut(self.document_number):
                    raise ValidationError("El rut ingresado no es valido")
                self.document_number = rut_chile.format_capitalized_rut_with_dots(self.document_number)
            try:
                if not rut_chile.is_valid_rut(self.username):
                    raise ValidationError("El username debe ser un rut valido")
            except Exception as e:
                print(e, "Error")
                raise ValidationError("El username debe ser un rut valido")
            self.username = rut_chile.format_capitalized_rut_with_dots(self.username)
        return super(CustomUser, self).save(*args, **kwargs)

    @property
    def full_name(self):
        return f"{self.first_name} {self.last_name}"

    @property
    def user_role(self):
        if self.is_superuser:
            return _("Administrador")
        if self.is_staff:
            return _("Moderador")
        return _("Usuario")


class ResetPassword(models.Model):
    user = models.ForeignKey(
        CustomUser,
        on_delete=models.CASCADE,
        verbose_name=_("Usuario"),
    )
    code = models.CharField(_("Código"), max_length=30)
    created = models.DateTimeField(_("Fecha"), auto_now_add=True)
    used = models.DateTimeField(_("Fecha uso"), null=True)

    def save(self, *args, **kwargs):
        if self.pk is None or self.code == '':
            self.code = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        super().save(*args, **kwargs)

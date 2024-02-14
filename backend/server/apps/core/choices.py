from django.db import models


class SalesChannel(models.TextChoices):
    WEB = "web", "Web"
    OFFICE = "office", "Oficina"
    ONWAY = "onway", "En camino"  # coneja


class SeatTypeChoice(models.IntegerChoices):
    SEMI_BED = 2, "Semi cama"
    BED = 3, "Cama"


class Days(models.TextChoices):
    MONDAY = "monday", "Lunes"
    TUESDAY = "tuesday", "Martes"
    WEDNESDAY = "wednesday", "Miércoles"
    THURSDAY = "thursday", "Jueves"
    FRIDAY = "friday", "Viernes"
    SATURDAY = "saturday", "Sábado"
    SUNDAY = "sunday", "Domingo"


class TypeSeason(models.TextChoices):
    LOW = "low", "Bajo"
    MEDIUM = "medium", "Medio"
    HIGH = "high", "Alto"

from django.db import models
from django.utils.translation import gettext_lazy as _


class TimestampMixin(models.Model):
    """
    Abstract base class with a creation and modification date and time
    """

    created = models.DateTimeField(
        _('Fecha de creación'),
        auto_now_add=True,
    )
    modified = models.DateTimeField(
        _('Fecha de modificación'),
        auto_now=True,
    )

    class Meta:
        abstract = True

from django.db import models
from django.utils.crypto import get_random_string


class ContactWeb(models.Model):
    name = models.CharField(max_length=100)
    telephone = models.CharField(max_length=20)
    email = models.EmailField()
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"[{self.id}] {self.name}"

    def send_email(self):
        # TODO: send email
        pass

    class Meta:
        verbose_name = "Contacto"
        verbose_name_plural = "Contactos web"


class Newsletter(models.Model):
    email = models.EmailField(max_length=100, unique=True)
    code = models.CharField(max_length=20)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.email

    def save(self, *args, **kwargs):
        if self.pk is None:
            self.code = get_random_string(length=12)
        super().save(*args, **kwargs)

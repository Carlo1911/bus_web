from django.contrib import admin

from .models import ContactWeb, Newsletter


@admin.register(ContactWeb)
class ContactWebAdmin(admin.ModelAdmin):
    list_display = ["id", "name", "telephone", "email", "created_at"]


@admin.register(Newsletter)
class NewsletterAdmin(admin.ModelAdmin):
    list_display = ["id", "email", "created_at"]

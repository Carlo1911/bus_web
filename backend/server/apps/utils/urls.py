from django.urls import path

from .views import (
    test_pdf,
    test_qr,
    test_ticket_pdf,
)

urlpatterns = [
    path('qr/', test_qr),
    path('pdf/', test_pdf),
    path('ticket/', test_ticket_pdf),
]

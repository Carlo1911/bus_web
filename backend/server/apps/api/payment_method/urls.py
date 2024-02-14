from django.urls import (
    include,
    path,
)

app_name = "payment_method"

urlpatterns = [
    path("", include("api.payment_method.cash.urls")),
    path("", include("api.payment_method.transbank.urls")),
]
from django.urls import (
    include,
    path,
)

app_name = "api_externos"

urlpatterns = [
    path("kupos/", include("api_externos.kupos.urls")),
    # path("recorrido/", include("api_externos.recorridocl.urls")),
    # path("chilepasajes/", include("api_externos.chilepasajes.urls")),
]

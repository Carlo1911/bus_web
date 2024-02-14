from django.urls import (
    include,
    path,
)

app_name = "api"

urlpatterns = [
    path("users/", include("api.users.urls")),
    path("transportation/", include("api.transportation.urls")),
    path("crew/", include("api.crew.urls")),
    path("core/", include("api.core.urls")),
    path("locations/", include("api.locations.urls")),
    path("payment_method/", include("api.payment_method.urls")),
    path("web/", include("api.web.urls")),
]

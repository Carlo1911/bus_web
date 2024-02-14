from rest_framework.routers import SimpleRouter

from .views import(
    CustomUserKuposViewSet,
    DestinationViewSet,
    SaleKuposViewSet,
    StopViewSet,
    ServiceViewSet,
    ReservedSeatsKuposViewSet,
)

app_name = 'kupos'
router = SimpleRouter()

router.register('stops', StopViewSet)
router.register('sales', SaleKuposViewSet)
router.register('services', ServiceViewSet)
router.register('users', CustomUserKuposViewSet)
router.register('destinations', DestinationViewSet)
router.register('reserved-seats', ReservedSeatsKuposViewSet)

urlpatterns = router.urls

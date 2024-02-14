from rest_framework.routers import SimpleRouter

from .views import (
    BranchViewSet,
    BusStopViewSet,
    CityViewSet,
    RegionViewSet,
)

app_name = 'locations'

router = SimpleRouter()
router.register('regions', RegionViewSet)
router.register('cities', CityViewSet)
router.register('buses-stop', BusStopViewSet)
router.register('branches', BranchViewSet)


urlpatterns = router.urls

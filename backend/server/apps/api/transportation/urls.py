from rest_framework.routers import SimpleRouter

from .views import (
    BenefitViewSet,
    BusViewSet,
    ComponentViewSet,
    FloorViewSet,
    LayoutViewSet,
    SeatTypeViewSet,
)

app_name = 'transportation'

router = SimpleRouter()
router.register('buses', BusViewSet)
router.register('benefits', BenefitViewSet)
router.register('components', ComponentViewSet)
router.register('layouts', LayoutViewSet)
router.register('floors', FloorViewSet)
router.register('seat-types', SeatTypeViewSet)


urlpatterns = router.urls

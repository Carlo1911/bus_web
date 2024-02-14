from rest_framework.routers import SimpleRouter

from .views import (
    CommissionViewSet,
    MotiveViewSet,
    PersonalViewSet,
    PositionViewSet,
)

app_name = 'crew'

router = SimpleRouter()
router.register('staff', PersonalViewSet)
router.register('motive', MotiveViewSet)
router.register('position', PositionViewSet)
router.register('commission', CommissionViewSet)

urlpatterns = router.urls

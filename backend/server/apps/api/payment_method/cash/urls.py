from rest_framework.routers import SimpleRouter

from api.payment_method.cash.views import (
    CashViewSet,
)

app_name = 'payment_method'

router = SimpleRouter()

router.register('cash', CashViewSet, basename='payment_method_cash')

urlpatterns = router.urls
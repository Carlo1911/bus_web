from rest_framework.routers import SimpleRouter

from api.payment_method.transbank.views import (
    TransbankViewSet,
)

app_name = 'payment_method'

router = SimpleRouter()

router.register('transbank', TransbankViewSet, basename='payment_method_transbank')

urlpatterns = router.urls

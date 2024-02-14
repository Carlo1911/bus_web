from rest_framework.routers import SimpleRouter

from .views import ContactWebViewSet, NewsletterViewSet

app_name = "web"

router = SimpleRouter()
router.register("contact", ContactWebViewSet)
router.register("newsletter", NewsletterViewSet)

urlpatterns = router.urls

from rest_framework.routers import SimpleRouter

from .views import (
    CashRegisterViewSet,
    CouponViewSet,
    DashboardViewSet,
    PassengerViewSet,
    RateTypeViewSet,
    RefundRequestViewSet,
    ReportViewSet,
    ReservedSeatsViewSet,
    RouteViewSet,
    SaleViewSet,
    ServiceViewSet,
    StretchInfoViewSet,
    TicketViewSet,
    ServiceMessageViewSet,
)

app_name = "core"

router = SimpleRouter()
router.register("routes", RouteViewSet)
router.register("rate-types", RateTypeViewSet)
router.register("services", ServiceViewSet)
router.register("sales", SaleViewSet)
router.register("reserved-seats", ReservedSeatsViewSet)
router.register("tickets", TicketViewSet)
router.register("cash-registers", CashRegisterViewSet)
router.register("passengers", PassengerViewSet)
router.register("refund-request", RefundRequestViewSet)
router.register("tariff", StretchInfoViewSet)
router.register("coupons", CouponViewSet)
router.register("dashboard", DashboardViewSet)
router.register("reports", ReportViewSet)
router.register("service-messages", ServiceMessageViewSet)

urlpatterns = router.urls

from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.parsers import JSONParser

from api.core.serializers import CouponSerializer
from core.models import Coupon
from utils.views import MultiSerializerViewSetMixin


@extend_schema_view(
    list=extend_schema(
        summary="List all coupons",
        description="Return a list of all coupons in the system.",
        tags=["Coupons"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a coupon",
        description="Get details of a specific coupon",
        tags=["Coupons"],
    ),
    create=extend_schema(
        summary="Create a coupon",
        description="Create a coupon",
        tags=["Coupons"],
    ),
    update=extend_schema(
        summary="Update a coupon",
        description="Update details of a specific coupon",
        tags=["Coupons"],
    ),
    partial_update=extend_schema(
        summary="Partial update a coupon",
        description="Update details of a specific coupon",
        tags=["Coupons"],
    ),
    destroy=extend_schema(
        summary="Delete a coupon",
        description="Delete a specific coupon",
        tags=["Coupons"],
    ),
)
class CouponViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = Coupon.objects.all().order_by("id")
    serializer_class = CouponSerializer
    ordering_fields = ["id", "code"]
    search_fields = ["code"]
    parser_classes = (JSONParser,)

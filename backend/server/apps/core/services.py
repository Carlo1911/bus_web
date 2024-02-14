from decimal import Decimal
from typing import (
    Optional,
    Union,
)

from django.utils import timezone
from rest_framework.exceptions import APIException

from core.models import (
    BranchOfficeDiscountStrategy,
    CouponDiscountStrategy,
    DNIDiscountStrategy,
    MetaDiscount,
    RoleDiscountStrategy,
    ServiceDiscountStrategy,
)


class DiscountService:
    def get_discount_value(self, discount: MetaDiscount, amount: Decimal) -> Decimal:
        if discount and discount.discount_type == MetaDiscount.DiscountType.PERCENTAGE:
            return amount * (discount.value / 100)
        elif discount and discount.discount_type == MetaDiscount.DiscountType.AMOUNT:
            return discount.value
        return Decimal(0)

    def calculate_amount(
        self,
        discount: MetaDiscount,
        amount: Decimal,
    ) -> Decimal:
        if discount:
            if discount.discount_type == MetaDiscount.DiscountType.PERCENTAGE:
                return amount * (1 - (discount.value / 100))
            elif discount.discount_type == MetaDiscount.DiscountType.AMOUNT:
                return amount - discount.value
        return amount

    def get_discount(
        self,
        coupon_code: Optional[str] = None,
        rut: Optional[str] = None,
        service_id: Optional[int] = None,
        branch_office: Optional[str] = None,
        position: Optional[int] = None,
    ) -> Union[MetaDiscount, None]:
        """Method to get the discount which corresponts to the parameters.
        Asuming it's just 1 coupon by time"""
        # TODO: preguntar si en la lógica del cupón,
        # se pueden acumular o se debe escoger el que más descuento da
        discount = None
        if coupon_code:
            strategy = None
            if rut:
                strategy = CouponDiscountStrategy.objects.filter(
                    code=coupon_code, rut=rut
                ).first()
            elif service_id:
                strategy = CouponDiscountStrategy.objects.filter(
                    code=coupon_code, service_id=service_id
                ).first()
            if strategy:
                if not strategy.valid_from and not strategy.valid_to:
                    return strategy.discount
                if (
                    strategy.valid_from
                    and not strategy.valid_to
                    and strategy.valid_from <= timezone.now()
                ):
                    return strategy.discount
                if (
                    strategy.valid_to
                    and not strategy.valid_from
                    and strategy.valid_to >= timezone.now()
                ):
                    return strategy.discount
                if (
                    strategy.valid_to
                    and strategy.valid_from
                    and strategy.valid_from <= timezone.now() <= strategy.valid_to
                ):
                    return strategy.discount
            return discount
        elif branch_office:
            strategy = BranchOfficeDiscountStrategy.objects.filter(
                branch_office=branch_office
            ).first()
            if strategy:
                if not strategy.valid_from and not strategy.valid_to:
                    return strategy.discount
                if (
                    strategy.valid_from
                    and not strategy.valid_to
                    and strategy.valid_from <= timezone.now()
                ):
                    return strategy.discount
                if (
                    strategy.valid_to
                    and not strategy.valid_from
                    and strategy.valid_to >= timezone.now()
                ):
                    return strategy.discount
                if (
                    strategy.valid_to
                    and strategy.valid_from
                    and strategy.valid_from <= timezone.now() <= strategy.valid_to
                ):
                    return strategy.discount
            return strategy.discount if strategy else discount
        elif position:
            strategy = RoleDiscountStrategy.objects.filter(position=position).first()
            return strategy.discount if strategy else discount
        elif service_id:
            strategy = ServiceDiscountStrategy.objects.filter(
                service_id=service_id
            ).first()
            if strategy:
                if not strategy.valid_from and not strategy.valid_to:
                    return strategy.discount
                if (
                    strategy.valid_from
                    and not strategy.valid_to
                    and strategy.valid_from <= timezone.now()
                ):
                    return strategy.discount
                if (
                    strategy.valid_to
                    and not strategy.valid_from
                    and strategy.valid_to >= timezone.now()
                ):
                    return strategy.discount
                if (
                    strategy.valid_to
                    and strategy.valid_from
                    and strategy.valid_from <= timezone.now() <= strategy.valid_to
                ):
                    return strategy.discount
            return strategy
        elif rut:
            strategy = DNIDiscountStrategy.objects.filter(rut=rut).first()
            if strategy:
                if not strategy.valid_from and not strategy.valid_to:
                    return strategy.discount
                if (
                    strategy.valid_from
                    and not strategy.valid_to
                    and strategy.valid_from <= timezone.now()
                ):
                    return strategy.discount
                if (
                    strategy.valid_to
                    and not strategy.valid_from
                    and strategy.valid_to >= timezone.now()
                ):
                    return strategy.discount
                if (
                    strategy.valid_to
                    and strategy.valid_from
                    and strategy.valid_from <= timezone.now() <= strategy.valid_to
                ):
                    return strategy.discount
            return strategy
        return discount

    def create_discount(
        self, discount_data: dict
    ) -> Union[
        DNIDiscountStrategy,
        ServiceDiscountStrategy,
        RoleDiscountStrategy,
        BranchOfficeDiscountStrategy,
        CouponDiscountStrategy,
        APIException,
    ]:
        if "coupon_code" in discount_data:
            # TODO: Check if discount code is unique
            if CouponDiscountStrategy.objects.filter(
                code=discount_data["coupon_code"]
            ).exists():
                raise APIException("Coupon code already exists")
            MetaDiscount.objects.create(discount_data)

    def update_discount(self, discount_id, discount_data):
        pass

    def delete_discount(self, discount_id):
        pass

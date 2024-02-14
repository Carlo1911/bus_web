import pytest

from pytest_factoryboy import register
from transportation.factories import (
    BenefitFactory,
    BusFactory,
    FloorFactory,
    LayoutFactory,
    SeatFactory,
    SeatTypeFactory,
)

register(BusFactory)
register(LayoutFactory)
register(FloorFactory)
register(BenefitFactory)
register(SeatTypeFactory)
register(SeatFactory)


@pytest.fixture()
def admin_client(client, admin_user):
    client.force_login(admin_user)
    return client

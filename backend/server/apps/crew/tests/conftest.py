import pytest

from crew.factories import (
    CommissionFactory,
    MotiveFactory,
    PersonalFactory,
    PositionFactory,
)
from pytest_factoryboy import register

register(PersonalFactory)
register(PositionFactory)
register(MotiveFactory)
register(CommissionFactory)


@pytest.fixture()
def admin_client(client, admin_user):
    client.force_login(admin_user)
    return client

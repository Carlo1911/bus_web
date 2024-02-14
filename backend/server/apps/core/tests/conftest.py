import pytest

from core.factories import (
    RouteFactory,
)
from pytest_factoryboy import register

register(RouteFactory)


@pytest.fixture
def admin_client(client, admin_user):
    client.force_login(admin_user)
    return client

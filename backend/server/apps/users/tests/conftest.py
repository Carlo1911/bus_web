import pytest

from pytest_factoryboy import register
from users.factories import CustomUserFactory

register(CustomUserFactory)


@pytest.fixture()
def admin_client(client, admin_user):
    client.force_login(admin_user)
    return client

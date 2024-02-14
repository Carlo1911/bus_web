import pytest
from rest_framework.test import APIClient

from core.factories import RouteFactory
from pytest_factoryboy import register

register(RouteFactory)


@pytest.fixture
def api_client():
    return APIClient

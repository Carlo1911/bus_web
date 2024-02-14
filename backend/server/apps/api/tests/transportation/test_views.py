import json

import pytest
from rest_framework import status

from api.tests.users.test_views import TestUserAndToken
from transportation.factories import (
    BenefitFactory,
    BusFactory,
    FloorFactory,
    LayoutFactory,
)


@pytest.mark.django_db
class TestBenefitViewSet(TestUserAndToken):

    endpoint = '/api/v1/transportation/benefits/'

    def test_benefit_list_without_login(self):
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_benefit_list_with_login(self):
        self._create_user_and_token()
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_benefit_create_without_login(self):
        data = {'name': 'benenfit1'}
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_benefit_create_with_login(self):
        self._create_user_and_token()
        data = {'name': 'benenfit1'}
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_benfit_retrieve_without_login(self):
        benefit = BenefitFactory()
        url = f'{self.endpoint}{benefit.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_benfit_retrieve_with_login(self):
        benefit = BenefitFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{benefit.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_benefit_update_without_login(self):
        benefit = BenefitFactory()
        data = {
            'name': 'benefit',
        }
        url = f'{self.endpoint}{benefit.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_benefit_update_with_login(self):
        benefit = BenefitFactory()
        self._create_user_and_token()
        data = {
            'name': 'benefit',
        }
        url = f'{self.endpoint}{benefit.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated_bus = json.loads(response.content)
        self.assertEqual(updated_bus.get('name'), 'benefit')

    def test_benefit_delete_without_login(self):
        benefit = BenefitFactory()
        url = f'{self.endpoint}{benefit.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_benefit_delete_with_login(self):
        benefit = BenefitFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{benefit.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


@pytest.mark.django_db
class TestBusViewSet(TestUserAndToken):

    endpoint = '/api/v1/transportation/buses/'

    def test_bus_list_without_login(self):
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_bus_list_with_login(self):
        self._create_user_and_token()
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_bus_create_without_login(self):
        benefit = BenefitFactory()
        data = {
            'code': 'code',
            'name': 'Bus',
            'vehicle_type': 1,
            'status': 1,
            'plate': 'VDB77J',
            'motor_serial_number': '12345',
            'chassis_serial_number': '12345',
            'kilometers': 120,
            'color': 'blue',
            'year': 2021,
            'insurance_policy': '12345',
            'insurance_policy_end_date': '2019-08-24',
            'brand': 'VOLVO',
            'model': '1',
            'owner': 'Andimar',
            'services': [benefit.pk],
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_bus_create_with_login(self):
        benefit = BenefitFactory()
        self._create_user_and_token()
        data = {
            'code': 'code',
            'name': 'Bus',
            'vehicle_type': 1,
            'status': 1,
            'plate': 'VDB77J',
            'motor_serial_number': '12345',
            'chassis_serial_number': '12345',
            'kilometers': 120,
            'color': 'blue',
            'year': 2021,
            'insurance_policy': '12345',
            'insurance_policy_end_date': '2019-08-24',
            'brand': 'VOLVO',
            'model': '1',
            'owner': 'Andimar',
            'services': [benefit.pk],
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_bus_retrieve_without_login(self):
        bus = BusFactory()
        url = f'{self.endpoint}{bus.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_bus_retrieve_with_login(self):
        bus = BusFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{bus.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_bus_update_without_login(self):
        bus = BusFactory()
        data = {'name': 'bus', 'color': 'blue', 'owner': 'Andimar'}
        url = f'{self.endpoint}{bus.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_bus_update_with_login(self):
        bus = BusFactory()
        self._create_user_and_token()
        data = {'name': 'bus', 'color': 'blue', 'owner': 'Andimar'}
        url = f'{self.endpoint}{bus.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated_bus = json.loads(response.content)
        self.assertEqual(updated_bus.get('name'), 'bus')
        self.assertEqual(updated_bus.get('color'), 'blue')
        self.assertEqual(updated_bus.get('owner'), 'Andimar')

    def test_bus_delete_without_login(self):
        bus = BusFactory()
        url = f'{self.endpoint}{bus.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_bus_delete_with_login(self):
        bus = BusFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{bus.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


@pytest.mark.django_db
class TestFloorViewSet(TestUserAndToken):

    endpoint = '/api/v1/transportation/floors/'

    def test_floor_list_without_login(self):
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_floor_list_with_login(self):
        self._create_user_and_token()
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_floor_create_without_login(self):
        layout = LayoutFactory()
        data = {
            'number': 1234,
            'length': 100,
            'width': 200,
            'seats': 20,
            'layout': layout.pk,
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_floor_create_with_login(self):
        layout = LayoutFactory()
        self._create_user_and_token()
        data = {
            'number': 1234,
            'length': 100,
            'width': 200,
            'seats': 20,
            'layout': layout.pk,
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_floor_retrieve_without_login(self):
        floor = FloorFactory()
        url = f'{self.endpoint}{floor.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_floor_retrieve_with_login(self):
        floor = FloorFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{floor.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_floor_update_without_login(self):
        floor = FloorFactory()
        data = {
            'seats': 20,
        }
        url = f'{self.endpoint}{floor.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_floor_update_with_login(self):
        floor = FloorFactory()
        self._create_user_and_token()
        data = {
            'seats': 20,
        }
        url = f'{self.endpoint}{floor.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated_floor = json.loads(response.content)
        self.assertEqual(updated_floor.get('seats'), 20)

    def test_floor_delete_without_login(self):
        floor = FloorFactory()
        url = f'{self.endpoint}{floor.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_floor_delete_with_login(self):
        floor = FloorFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{floor.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


@pytest.mark.django_db
class TestLayoutViewSet(TestUserAndToken):

    endpoint = '/api/v1/transportation/layouts/'

    def test_layout_list_without_login(self):
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_layout_list_with_login(self):
        self._create_user_and_token()
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_layout_create_without_login(self):
        bus = BusFactory()
        benefit = BenefitFactory()
        data = {
            'name': 'layout',
            'description': 'test description',
            'bus': bus.pk,
            'services': [benefit.pk],
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_layout_create_with_login(self):
        bus = BusFactory()
        benefit = BenefitFactory()
        self._create_user_and_token()
        data = {
            'name': 'layout',
            'description': 'test description',
            'bus': bus.pk,
            'services': [benefit.pk],
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_layout_retrieve_without_login(self):
        layout = LayoutFactory()
        url = f'{self.endpoint}{layout.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_layout_retrieve_with_login(self):
        layout = LayoutFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{layout.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_layout_update_without_login(self):
        layout = LayoutFactory()
        data = {
            'name': 'layout',
        }
        url = f'{self.endpoint}{layout.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_layout_update_with_login(self):
        layout = LayoutFactory()
        self._create_user_and_token()
        data = {
            'name': 'layout',
        }
        url = f'{self.endpoint}{layout.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated_layout = json.loads(response.content)
        self.assertEqual(updated_layout.get('name'), 'layout')

    def test_layout_delete_without_login(self):
        layout = LayoutFactory()
        url = f'{self.endpoint}{layout.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_layout_delete_with_login(self):
        layout = LayoutFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{layout.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

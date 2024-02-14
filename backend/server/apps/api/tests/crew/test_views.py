import json

import pytest
from rest_framework import status

from api.tests.users.test_views import TestUserAndToken
from core.factories import RouteFactory
from crew.factories import (
    CommissionFactory,
    PersonalFactory,
)
from crew.models import Personal
from faker import Faker
from users.models import CustomUser

faker = Faker('es_ES')


@pytest.mark.django_db
class TestPersonalViewSet(TestUserAndToken):
    # TODO: Add status & contract_type

    endpoint = '/api/v1/crew/staff/'

    def test_personal_list_without_login(self):
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_personal_list_with_login(self):
        self._create_user_and_token()
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_personal_create_without_login(self):
        data = {
            'first_name': 'personal',
            'last_name': 'paternal_test',
            'maternal_last_name': 'maternal_test',
            'document_number': 'document_test',
            'cellphone': '99999999999',
            'phone': '9999999',
            'email': 'test@linets.cl',
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_personal_create_with_login(self):
        self._create_user_and_token()
        # TODO: Incluir image
        data = {
            'username': faker.profile(fields=['username'])['username'],
            'first_name': faker.first_name(),
            'last_name': faker.last_name(),
            'maternal_last_name': faker.last_name(),
            'is_active': True,
            'is_staff': True,
            'email': faker.email(),
            'password': 'P@ssTest1234',
            'address': faker.address(),
            'cellphone': faker.numerify(text='+56#########'),
            'phone': faker.numerify(text='+56#########'),
            'work_phone': faker.numerify(text='+56#########'),
            'work_address': faker.address(),
            'date_from': None,
            'date_to': None,
            'document_number': faker.bothify(text='#########'),
            'sex': faker.random_element(elements=CustomUser.sex_options()),
            'status': faker.random_element(elements=Personal.status_options()),
            'contract_type': faker.random_element(
                elements=Personal.contract_type_options()
            ),
            'contract_date': faker.date_between(start_date='-1y', end_date='now'),
            'motives': [],
            'positions': [],
            'groups': [],
            'user_permissions': [],
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_personal_retrieve_without_login(self):
        personal = PersonalFactory()
        url = f'{self.endpoint}{personal.user.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_personal_retrieve_with_login(self):
        personal = PersonalFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{personal.user.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_personal_update_without_login(self):
        personal = PersonalFactory()
        data = {
            'contract_type': '10x4',
        }
        url = f'{self.endpoint}{personal.user.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_personal_update_with_login(self):
        personal = PersonalFactory()
        self._create_user_and_token()
        contract_type = faker.random_element(elements=Personal.contract_type_options())
        data = {
            'contract_type': contract_type,
        }
        url = f'{self.endpoint}{personal.user.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated_personal = json.loads(response.content)
        self.assertEqual(updated_personal.get('contract_type'), contract_type)

    def test_personal_delete_without_login(self):
        personal = PersonalFactory()
        url = f'{self.endpoint}{personal.user.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_personal_delete_with_login(self):
        personal = PersonalFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{personal.user.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


@pytest.mark.django_db
class TestCommissionViewSet(TestUserAndToken):

    endpoint = '/api/v1/crew/commission/'

    def test_commission_list_without_login(self):
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_commission_list_with_login(self):
        self._create_user_and_token()
        response = self.client.get(self.endpoint)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_commission_create_without_login(self):
        personal = PersonalFactory()
        route = RouteFactory()
        data = {
            'percentage': '12.50',
            'date_from': '2019-08-24',
            'date_to': '2019-08-24',
            'status': 1,
            'route': route.id,
            'personal': personal.user.id,
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_commission_create_with_login(self):
        self._create_user_and_token()
        personal = PersonalFactory()
        route = RouteFactory()
        data = {
            'percentage': '12.50',
            'route': route.id,
            'date_from': '2019-08-24',
            'date_to': '2019-08-24',
            'status': 1,
            'personal': personal.user.id,
        }
        response = self.client.post(self.endpoint, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_commission_retrieve_without_login(self):
        commission = CommissionFactory()
        url = f'{self.endpoint}{commission.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_commission_retrieve_with_login(self):
        commission = CommissionFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{commission.id}/'
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_commission_update_without_login(self):
        commission = CommissionFactory()
        data = {
            'percentage': '12.50',
            'date_from': '2019-08-24',
            'date_to': '2019-08-24',
        }
        url = f'{self.endpoint}{commission.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_commission_update_with_login(self):
        commission = CommissionFactory()
        self._create_user_and_token()
        data = {
            'percentage': '12.50',
            'date_from': '2019-08-24',
            'date_to': '2019-08-24',
        }
        url = f'{self.endpoint}{commission.id}/'
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated_commission = json.loads(response.content)
        self.assertEqual(updated_commission.get('percentage'), '12.50')

    def test_commission_delete_without_login(self):
        commission = CommissionFactory()
        url = f'{self.endpoint}{commission.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_commission_delete_with_login(self):
        commission = CommissionFactory()
        self._create_user_and_token()
        url = f'{self.endpoint}{commission.id}/'
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

import factory
from faker import Faker

from .models import (
    Route,
)

faker = Faker('es_ES')

class RouteFactory(factory.django.DjangoModelFactory):
    code = faker.bothify(text='???-###')
    name = faker.first_name()
    status = True

    class Meta:
        model = Route

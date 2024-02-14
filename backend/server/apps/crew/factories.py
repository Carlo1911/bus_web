import factory
from core.factories import RouteFactory
from faker import Faker
from server.apps.users.factories import CustomUserFactory

from .models import (
    Commission,
    Motive,
    Personal,
    Position,
)

faker = Faker('es_ES')


class PositionFactory(factory.django.DjangoModelFactory):
    description = faker.text(max_nb_chars=70)

    class Meta:
        model = Position


class MotiveFactory(factory.django.DjangoModelFactory):
    description = faker.text(max_nb_chars=70)

    class Meta:
        model = Motive


class PersonalFactory(factory.django.DjangoModelFactory):
    user = factory.SubFactory(CustomUserFactory)
    status = faker.random_element(elements=Personal.status_options())
    contract_date = faker.date_between(start_date='-1y', end_date='now')
    contract_type = faker.random_element(elements=Personal.contract_type_options())

    class Meta:
        model = Personal

    @factory.post_generation
    def motives(self, create, extracted, **kwargs):
        if not create or not extracted:
            # Simple build, or nothing to add, do nothing.
            return

        # Add the iterable of motives using bulk addition
        self.motives.add(*extracted)  # pylint: disable=no-member

    @factory.post_generation
    def positions(self, create, extracted, **kwargs):
        if not create or not extracted:
            # Simple build, or nothing to add, do nothing.
            return

        # Add the iterable of positions using bulk addition
        self.positions.add(*extracted)  # pylint: disable=no-member


class CommissionFactory(factory.django.DjangoModelFactory):
    date_from = faker.date()
    date_to = faker.date()
    personal = factory.SubFactory(PersonalFactory)
    route = factory.SubFactory(RouteFactory)
    status = faker.random_element([1, 2])
    percentage = faker.random_int(min=1, max=100)

    class Meta:
        model = Commission

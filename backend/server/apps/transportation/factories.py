import factory
from faker import Faker

from .models import (
    Benefit,
    Bus,
    Floor,
    Layout,
    Seat,
    SeatType,
)

faker = Faker('es_ES')


class BenefitFactory(factory.django.DjangoModelFactory):
    name = faker.first_name()

    class Meta:
        model = Benefit


class BusFactory(factory.django.DjangoModelFactory):
    code = faker.text(max_nb_chars=40)
    name = faker.text(max_nb_chars=40)
    vehicle_type = 1
    status = 1
    plate = faker.bothify(text='?#?-###')
    motor_serial_number = faker.text(max_nb_chars=50)
    chassis_serial_number = faker.text(max_nb_chars=50)
    kilometers = faker.random_int(min=0, max=10000)
    color = faker.color_name()
    year = faker.year()
    insurance_policy = faker.bothify(text='Póliza de seguro: #####')
    insurance_policy_end_date = faker.future_date()
    brand = faker.text(max_nb_chars=50)
    model = faker.text(max_nb_chars=50)
    owner = faker.name()

    class Meta:
        model = Bus

    @factory.post_generation
    def services(self, create, extracted, **kwargs):
        if not create or not extracted:
            # Simple build, or nothing to add, do nothing.
            return

        # Add the iterable of services using bulk addition
        self.services.add(*extracted)  # pylint: disable=no-member


class LayoutFactory(factory.django.DjangoModelFactory):
    bus = factory.SubFactory(BusFactory)
    name = faker.first_name()
    description = faker.text()

    class Meta:
        model = Layout


class FloorFactory(factory.django.DjangoModelFactory):
    layout = factory.SubFactory(LayoutFactory)
    number = faker.numerify('#')
    length = faker.numerify('###')
    width = faker.numerify('###')
    seats = faker.numerify('##')

    class Meta:
        model = Floor


class SeatTypeFactory(factory.django.DjangoModelFactory):
    name = faker.random_choices(
        elements=('Normal', 'Semi cama', 'Cama', 'Asiento conductor'), length=1
    )

    class Meta:
        model = SeatType


class SeatFactory(factory.django.DjangoModelFactory):
    seat_kind = factory.SubFactory(SeatTypeFactory)
    floors = factory.SubFactory(FloorFactory)
    code = faker.bothify(text='???-###')
    position_x = faker.numerify('#')
    position_y = faker.numerify('#')
    width = faker.numerify('#')
    length = faker.numerify('#')
    kind = 'seat'

    class Meta:
        model = Seat

import itertools
import random
from datetime import (
    datetime,
    timedelta,
)
from decimal import Decimal

from django.core.management.base import BaseCommand

from core.choices import (
    Days,
    SalesChannel,
)
from core.models import (
    Route,
    Service,
    ServiceSeatRate,
)
from transportation.models import Bus


def date_to_days(date_day: datetime) -> str:
    day = date_day.weekday()
    return Days.choices[day][0]


class Command(BaseCommand):
    help = "Create some services for all the routes in system"

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Loading all the routes available in the system"))
        routes = Route.objects.filter()
        bus = Bus.objects.first()

        three_days_ago = datetime.today() - timedelta(days=3)
        thirty_days_next = datetime.today() + timedelta(days=30)
        three_days_ago = three_days_ago.replace(hour=8, minute=0, second=0, microsecond=0)
        thirty_days_next = thirty_days_next.replace(hour=8, minute=0, second=0, microsecond=0)

        seat_types = [2, 3]  # 2: Semi cama, 3: Cama
        for counter, route in enumerate(routes):
            self.stdout.write(f"Ruta: {route.name}")
            # Create the service
            parent_service = Service.objects.create(
                route=route,
                service_type=Service.ServiceType.SHORT,
                code=f"Serv-{counter}",
                name=f"Ser {counter} - {route.start_city} - {route.end_city}",
                status=Service.Status.ACTIVE,
                renovation_months=3,
                start_time=three_days_ago.time(),
                datetime_from=three_days_ago,
                datetime_to=thirty_days_next,
                bus=bus,
            )

            parent_service.calculate_durations()

            self.stdout.write(f"Servicio Padre: {parent_service.name}")

            day = three_days_ago
            while day <= thirty_days_next:
                # Create the service
                service = Service.objects.create(
                    parent=parent_service,
                    route=route,
                    service_type=Service.ServiceType.SHORT,
                    code=f"Serv-{counter}",
                    name=f"Postura {counter} - {route.start_city} - {route.end_city}",
                    status=Service.Status.ACTIVE,
                    renovation_months=3,
                    start_time=day.time(),
                    datetime_publish=day,
                    datetime_from=three_days_ago,
                    datetime_to=thirty_days_next,
                    bus=bus,
                )

                service.calculate_durations()

                for seat_type, sales_channel in itertools.product(seat_types, enumerate(SalesChannel.choices)):
                    for stretch in route.stretches.all():
                        ServiceSeatRate.objects.create(
                            service=service,
                            day=date_to_days(day),
                            stretch=stretch,
                            seat_type_id=seat_type,
                            source_type=sales_channel[1][0],
                            price=Decimal(random.randint(10000, 15000)),
                        )

                day = day + timedelta(days=1)
            three_days_ago = three_days_ago.replace(hour=8 + counter, minute=0, second=0, microsecond=0)
            thirty_days_next = thirty_days_next.replace(hour=8 + counter, minute=0, second=0, microsecond=0)
        self.stdout.write(self.style.SUCCESS("Successfully created all the services"))

from decimal import Decimal

from django.core.management.base import BaseCommand
from openpyxl import load_workbook

from core.choices import (
    Days,
    SalesChannel,
    SeatTypeChoice,
)
from core.models import (
    Service,
    ServiceSeatRate,
)


def output_tariff(row):
    print(f"Servicio: {row[0].value}")
    print(f"Días: {row[1].value}")
    print(f"Tramo: {row[2].value}")
    print(f"Canal: {row[3].value}")
    print(f"Semi cama: {row[4].value}")
    print(f"Cama: {row[5].value}")
    print("===========")


def get_source_type(value):
    match value:
        case "Oficina":
            return SalesChannel.OFFICE
        case "Web":
            return SalesChannel.WEB
        case "Coneja":
            return SalesChannel.ONWAY


def get_day(value):
    match value:
        case "lunes":
            return Days.MONDAY
        case "martes":
            return Days.TUESDAY
        case "miercoles":
            return Days.WEDNESDAY
        case "jueves":
            return Days.THURSDAY
        case "viernes":
            return Days.FRIDAY
        case "sabado":
            return Days.SATURDAY
        case "domingo":
            return Days.SUNDAY


class Command(BaseCommand):
    help = "Load printers from excel file"

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Reading excel file"))
        wb = load_workbook(filename="initial_data_3.xlsx", read_only=True)
        ws = wb["Tarifas"]

        for index, row in enumerate(ws.rows):
            if index == 5:
                break
            if index != 0:
                posture = Service.objects.get(name=row[0].value.strip())

                days = row[1].value.strip().split(",")
                bus_stops = row[2].value.strip().split(" - ")

                stretch = posture.route.stretches.filter(
                    start_bus_stop__name=bus_stops[0].strip(), end_bus_stop__name=bus_stops[1].strip()
                ).first()

                for day in days:
                    ServiceSeatRate.objects.create(
                        service=posture,
                        day=get_day(day),
                        stretch=stretch,
                        seat_type_id=SeatTypeChoice.SEMI_BED,
                        source_type=get_source_type(row[3].value),
                        price=Decimal(row[4].value),
                    )
                    ServiceSeatRate.objects.create(
                        service=posture,
                        day=get_day(day),
                        stretch=stretch,
                        seat_type_id=SeatTypeChoice.BED,
                        source_type=get_source_type(row[3].value),
                        price=Decimal(row[5].value),
                    )

                output_tariff(row)

        wb.close()

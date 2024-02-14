from datetime import timedelta

from django.core.management.base import BaseCommand
from openpyxl import load_workbook

from core.models import StretchInfo
from locations.models import (
    BusStop,
    City,
)


def output_stretch(row):
    print(f"Parada inicial: {row[0].value}")
    print(f"Parada final: {row[2].value}")
    print(f"Tipo: {row[4].value}")
    print(f"Distancia: {row[5].value} km")
    print(f"Duración: {row[6].value}")
    print("===========")


class Command(BaseCommand):
    help = "Load printers from excel file"

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Reading excel file"))
        wb = load_workbook(filename="initial_data.xlsx", read_only=True)
        ws = wb["Tramos"]

        for index, row in enumerate(ws.rows):
            if index != 0:
                stop_type = BusStop.StopType.TERMINAL if row[4].value == "Ciudad" else BusStop.StopType.STOP
                start_bus_stop = BusStop.objects.filter(
                    name__icontains=row[0].value.strip(), city__name__icontains=row[1].value.strip()
                )
                start_city, _ = City.objects.get_or_create(name=row[1].value.strip())
                end_bus_stop = BusStop.objects.filter(
                    name__icontains=row[2].value.strip(), city__name__icontains=row[3].value.strip()
                )
                end_city, _ = City.objects.get_or_create(name=row[3].value.strip())
                distance = int(row[5].value)
                hour, minute, seconds = str(row[6].value).split(":")
                duration = timedelta(hours=int(hour), minutes=int(minute), seconds=int(seconds))

                start_bus_stop = (
                    start_bus_stop[0]
                    if start_bus_stop
                    else BusStop.objects.create(name=row[0].value.strip(), stop_type=stop_type, city=start_city)
                )
                end_bus_stop = (
                    end_bus_stop[0]
                    if end_bus_stop
                    else BusStop.objects.create(name=row[2].value.strip(), city=end_city)
                )
                # TODO: Hacerlo de nuevo en reversa
                stretch, _ = StretchInfo.objects.get_or_create(
                    start_bus_stop=start_bus_stop,
                    end_bus_stop=end_bus_stop,
                    defaults={"distance": distance, "duration": duration},
                )

                output_stretch(row)

        wb.close()

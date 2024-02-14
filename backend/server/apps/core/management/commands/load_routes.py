from django.core.management.base import BaseCommand
from openpyxl import load_workbook

from core.models import (
    Route,
    RouteStretch,
    StretchInfo,
)
from locations.models import BusStop


def output_route(row):
    print(f"Nombre: {row[0].value}")
    print(f"Tramos: {row[1].value}")
    print("===========")


class Command(BaseCommand):
    help = "Load printers from excel file"

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Reading excel file"))
        wb = load_workbook(filename="initial_data_3.xlsx", read_only=True)
        ws = wb["Rutas"]

        for index, row in enumerate(ws.rows):
            output_route(row)
            if index == 2:
                break
            if index != 0:
                route, _ = Route.objects.get_or_create(name=row[0].value.strip())
                stretchs_names = row[1].value.strip().split(",")

                for i in range(len(stretchs_names) - 1):
                    if i == len(stretchs_names) - 1:
                        break
                    start_bus_stop = BusStop.objects.get(name=stretchs_names[i].strip())
                    end_bus_stop = BusStop.objects.get(name=stretchs_names[i + 1].strip())

                    stretch_info = StretchInfo.objects.get(start_bus_stop=start_bus_stop, end_bus_stop=end_bus_stop)
                    RouteStretch.objects.create(
                        stretch_type=RouteStretch.StretchType.STRETCH,
                        route=route,
                        start_bus_stop=start_bus_stop,
                        end_bus_stop=end_bus_stop,
                        duration=stretch_info.duration,
                        distance=stretch_info.distance,
                    )

        wb.close()

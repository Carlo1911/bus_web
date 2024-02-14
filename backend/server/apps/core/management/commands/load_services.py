import datetime

from django.core.management.base import BaseCommand
from openpyxl import load_workbook

from core.models import (
    Route,
    Service,
)


def output_service(row):
    print(f"Nombre: {row[0].value}")
    print(f"Ruta: {row[1].value}")
    print(f"Fecha de inicio: {row[2].value}")
    print(f"Fecha de fin: {row[3].value}")
    print(f"Fecha de salida: {row[4].value}")
    print(f"Tipo de bus: {row[5].value}")
    print("===========")


class Command(BaseCommand):
    help = "Load printers from excel file"

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Reading excel file"))
        wb = load_workbook(filename="initial_data_3.xlsx", read_only=True)
        ws = wb["Servicios"]

        for index, row in enumerate(ws.rows):
            if index == 5:
                break
            if index != 0:
                route = Route.objects.get(name=row[1].value.strip())
                parent_service_name, start_time = row[0].value.strip().split(" ")
                hour, minute = start_time.split(":")
                parent_service, _ = Service.objects.get_or_create(
                    name=parent_service_name,
                    defaults={
                        "status": Service.Status.ACTIVE,
                        "route": route,
                        "start_time": datetime.time(hour=int(hour), minute=int(minute)),
                        "datetime_from": row[2].value,
                        "datetime_to": row[3].value,
                        "service_type": Service.ServiceType.SHORT,
                    },
                )

                parent_service.calculate_durations()

                posture = Service.objects.create(
                    name=row[0].value.strip(),
                    parent=parent_service,
                    status=Service.Status.ACTIVE,
                    route=route,
                    start_time=datetime.time(hour=int(hour), minute=int(minute)),
                    datetime_from=row[2].value,
                    datetime_to=row[3].value,
                    datetime_publish=row[4].value,
                    service_type=Service.ServiceType.SHORT,
                )
                posture.calculate_durations()

                output_service(row)

        wb.close()

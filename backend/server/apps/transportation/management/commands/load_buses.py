from django.core.management.base import BaseCommand
from openpyxl import load_workbook

from transportation.models import Bus


def output_bus(row):
    print(f"Nombre: {row[0].value}")
    print(f"Placa: {row[1].value}")
    print(f"Tipo: {row[11].value}")
    print("===========")


def get_layout(value):
    match value:
        case "Clásico":
            return 3
        case "Cama":
            return 2
        case "Mixto":
            return 1


class Command(BaseCommand):
    help = "Load buses from excel file"

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Reading excel file"))
        wb = load_workbook(filename="initial_data.xlsx", read_only=True)
        ws = wb["Buses"]

        for index, row in enumerate(ws.rows):
            if index != 0:
                bus = Bus.objects.create(
                    code=row[0].value,
                    name=row[0].value,
                    vehicle_type=Bus.VehicleType.REGULAR,
                    status=Bus.Status.ON_SERVICE,
                    plate=row[1].value,
                    kilometers=row[2].value,
                    motor_serial_number=row[3].value,
                    chassis_serial_number=row[4].value,
                    color=row[5].value,
                    year=row[6].value,
                    brand=row[9].value,
                    model=row[9].value,
                    owner=row[10].value,
                    layout_id=get_layout(row[11].value),
                )
                bus.save()
                output_bus(row)

        wb.close()

from django.core.management.base import BaseCommand
from openpyxl import load_workbook

from core.models import Printer


def output_printer(row):
    print(f"Impresora: {row[0].value}")
    print(f"Terminal: {row[1].value}")
    print(f"RUT Cajero: {row[2].value}")
    print("===========")


class Command(BaseCommand):
    help = "Load personal from excel file"

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Reading excel file"))
        wb = load_workbook(filename="initial_data.xlsx", read_only=True)
        ws = wb["Impresora"]

        for index, row in enumerate(ws.rows):
            if index != 0:
                Printer.objects.get_or_create(name=f"{row[0].value} {index+1}", total_prints=10000)
                output_printer(row)

        wb.close()

from django.core.management.base import BaseCommand
from openpyxl import load_workbook

from crew.models import (
    Personal,
    Position,
)
from locations.models import Branch
from users.models import (
    CustomUser,
    Role,
)


def create_user(email, first_name, last_name, maternal_last_name, document_number, cellphone, phone, sex, address):
    user, _ = CustomUser.objects.get_or_create(
        username=document_number,
        email=email,
        defaults={
            "username": document_number,
            "email": email,
            "first_name": first_name,
            "last_name": last_name,
            "maternal_last_name": maternal_last_name,
            "document_number": document_number,
            "cellphone": cellphone,
            "phone": phone,
            "sex": sex,
            "address": address,
            "is_active": True,
        },
    )
    user.set_password("Linets@2022")
    user.save()
    return user


def output_user(row):
    print(f"RUT: {row[0].value}")
    print(f"Nombres: {row[1].value}")
    print(f"Apellido paterno: {row[2].value}")
    print(f"Apellido materno: {row[3].value}")
    print(f"Celular: {row[4].value}")
    print(f"Teléfono: {row[5].value}")
    print(f"Sexo: {row[6].value}")
    print(f"Dirección: {row[7].value}")
    print(f"Tipo de contrato: {row[8].value}")
    print(f"Fecha de contrato: {row[9].value}")
    print(f"Cargo: {row[10].value}")
    print(f"Terminal: {row[11].value}")
    print(f"Rol: {row[12].value}")
    print("===========")


class Command(BaseCommand):
    help = "Load personal from excel file"

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Reading excel file"))
        wb = load_workbook(filename="initial_data.xlsx", read_only=True)
        ws = wb["Personal"]

        for index, row in enumerate(ws.rows):
            if index != 0:
                user = create_user(
                    email=f"{row[1].value.strip().split()[0].lower()}.{row[2].value.strip().lower()}@andimar.cl",
                    first_name=row[1].value.strip(),
                    last_name=row[2].value.strip(),
                    maternal_last_name=row[3].value.strip(),
                    document_number=row[0].value.strip(),
                    cellphone=str(row[4].value).strip() if row[4].value else None,
                    phone=str(row[5].value).strip() if row[5].value else None,
                    sex=row[6].value.strip(),
                    address=row[7].value.strip() if row[7].value else None,
                )

                personal, _ = Personal.objects.get_or_create(
                    user=user,
                    contract_type="indefinite" if row[8].value.strip() == "Indefinido" else "fixed",
                    contract_date=row[9].value if row[9].value else None,
                )

                position, _ = Position.objects.get_or_create(
                    description=row[10].value.strip().upper(),
                )
                personal.add_positions([position])

                # TODO: Ask for terminals and cities
                branches = Branch.objects.filter(name__contains=row[11].value.strip() if row[11].value else "")
                if branches:
                    personal.branch = branches.first()
                    personal.save()

                if row[12].value:
                    role, _ = Role.objects.get_or_create(
                        name=row[12].value.strip(),
                    )
                    personal.user.groups.add(role)

                output_user(row)

        wb.close()

from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = "Load all initial data"
    fixtures = [
        # locations
        "1_region_fixtures.json",
        "2_city_fixtures.json",
        "3_busstop_fixtures.json",
        "4_branch_fixtures.json",
        # trnasportation
        "layout.json",
        "seat_type.json",
        "floor.json",
        "component.json",
        "stretchinfo.json",
        "stretchinforates.json",
        "seat.json",
        # crew
        "motive.json",
        "position.json",
        # core
        "stretchinfo.json",
        "stretchinforates.json",
        # users
        "9_nationality_fixtures.json",
    ]

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS("Start applying migrations"))
        call_command("migrate")

        for fixture_name in self.fixtures:
            call_command("loaddata", fixture_name)
            self.stdout.write(self.style.SUCCESS(f"Successfully load: {fixture_name}"))

        self.stdout.write(self.style.SUCCESS("Successfully load all data"))

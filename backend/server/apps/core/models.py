from datetime import (
    date,
    datetime,
    time,
    timedelta,
)
from decimal import Decimal

from django.conf import settings
from django.contrib import admin
from django.db import models
from django.db.models.aggregates import Sum
from django.template.loader import render_to_string
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

from crew.models import (
    Personal,
    Position,
)
from locations.models import (
    Branch,
    BusStop,
)
from transportation.models import (
    Bus,
    Seat,
    SeatType,
)
from users.models import CustomUser
from utils.mail import EmailSender
from utils.qr import create_qr
from utils.tools import hide_last_4_digits_rut
from weasyprint import (
    CSS,
    HTML,
)
from weasyprint.text.fonts import FontConfiguration

from .choices import (
    Days,
    SalesChannel,
    TypeSeason,
)


class Route(models.Model):
    code = models.CharField(_("Código"), max_length=10, blank=True, null=True)
    name = models.CharField(_("Nombre"), max_length=255)

    @property
    def status(self) -> bool:
        return self.services.filter(status__in=[Service.Status.ACTIVE, Service.Status.CREATED]).exists()

    # TODO: Optimize adding start_city and end_city as fields and created from stretchs

    def __str__(self) -> str:
        return self.name

    @property
    def stretches(self):  # TODO: Check if it's possible order by child
        return self.stretches.filter(stretch_type=RouteStretch.StretchType.STRETCH).order_by("stretch__order")

    @property
    def start_city(self):
        if start_stretch := self.stretches.select_related("start_bus_stop", "start_bus_stop__city").first():
            return start_stretch.start_bus_stop.city
        return None

    @property
    def start_bus_stop(self):
        start_stretch = self.stretches.select_related("start_bus_stop").first()
        return start_stretch.start_bus_stop if start_stretch else None

    @property
    def end_bus_stop(self):
        end_stretch = self.stretches.select_related("end_bus_stop").first()
        return end_stretch.end_bus_stop if end_stretch else None

    @property
    def end_city(self):
        if end_stretch := self.stretches.select_related("end_bus_stop", "end_bus_stop__city").last():
            return end_stretch.end_bus_stop.city
        return None

    class Meta:
        verbose_name = "Ruta"
        verbose_name_plural = "Rutas"


class RouteStretch(models.Model):
    class StretchType(models.TextChoices):
        MAP = "Map", "Mapa"
        STRETCH = "Stretch", "Tramo"

    stretch_type = models.CharField(max_length=10, choices=StretchType.choices, default=StretchType.MAP)
    route = models.ForeignKey(
        Route,
        on_delete=models.CASCADE,
        verbose_name=_("Ruta"),
        related_name="stretches",
    )
    start_bus_stop = models.ForeignKey(
        BusStop,
        on_delete=models.CASCADE,
        related_name="start_routes",
        verbose_name=_("Parada de inicio"),
    )
    end_bus_stop = models.ForeignKey(
        BusStop,
        on_delete=models.CASCADE,
        related_name="end_routes",
        verbose_name=_("Parada de fin"),
    )
    order = models.IntegerField(_("Orden"), default=0)
    duration = models.DurationField(_("Duración"), blank=True, null=True)
    waiting_time = models.TimeField(_("Tiempo de espera"), blank=True, null=True)
    distance = models.DecimalField(_("Distancia"), decimal_places=3, max_digits=7, blank=True, null=True)
    status = models.BooleanField(_("Activo"), default=True)

    def __str__(self) -> str:
        return f"{self.route.name}: {self.start_bus_stop} - {self.end_bus_stop}"

    class Meta:
        verbose_name = "Tramo de ruta"
        verbose_name_plural = "Tramos de ruta"


class RateType(models.Model):
    name = models.CharField(_("Name"), max_length=60)
    time_start = models.TimeField(_("Hora de inicio"))
    time_end = models.TimeField(_("Hora de fin"))

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Tipo de tarifa"
        verbose_name_plural = "Tipos de tarifa"


class RouteStretchRate(models.Model):
    route_stretch = models.ForeignKey(RouteStretch, on_delete=models.CASCADE, verbose_name=_("Ruta"))
    seat_type = models.ForeignKey(SeatType, on_delete=models.CASCADE, verbose_name=_("Tipo de asiento"))
    price = models.DecimalField(_("Precio"), decimal_places=2, max_digits=10, blank=True, null=True)

    class Meta:
        verbose_name = "Tarifa"
        verbose_name_plural = "Tarifas"


class Service(models.Model):
    class Status(models.TextChoices):
        CREATED = "created", _("Creado")
        ACTIVE = "active", "Activo"
        DISABLED = "disabled", "Desactivado"
        MODIFIED = "modified", "Modificado"

    class ServiceType(models.TextChoices):
        SHORT = "short", "Corto"
        LARGE = "large", "Largo"

    parent = models.ForeignKey(
        "self",
        blank=True,
        null=True,
        on_delete=models.CASCADE,
        verbose_name="Servicio Padre",
    )

    code = models.CharField(_("Código"), max_length=10, blank=True, null=True)
    name = models.CharField(_("Nombre"), max_length=255)
    title = models.CharField(_("Título"), max_length=255, blank=True)
    status = models.CharField(_("Estado de servicio"), max_length=9, choices=Status.choices)
    route = models.ForeignKey(Route, on_delete=models.CASCADE, verbose_name=_("Ruta"), related_name="services")
    start_time = models.TimeField(_("Hora de inicio"), blank=True, null=True)
    datetime_publish = models.DateTimeField(_("Fecha de salida"), blank=True, null=True)
    datetime_from = models.DateTimeField(_("Fecha de inicio"))
    datetime_to = models.DateTimeField(_("Fecha de fin"))
    drivers = models.ManyToManyField(Personal, verbose_name=_("Conductores"), related_name="drivers_services")
    assistants = models.ManyToManyField(Personal, verbose_name=_("Auxiliares"), related_name="assistants_services")
    bus = models.ForeignKey(Bus, on_delete=models.CASCADE, verbose_name=_("Bus"), blank=True, null=True)
    service_type = models.CharField(_("Tipo de servicio"), max_length=9, choices=ServiceType.choices)
    renovation_months = models.IntegerField(_("Meses renovación"), blank=True, null=True)

    @property
    def start_city(self):
        return self.route.start_city

    @property
    def end_city(self):
        return self.route.end_city

    @property
    def web_seats(self):
        # TODO: Consider seats taken in datetime_to (reserved and bought)
        components = self.bus.components
        ten_minutes_ago = timezone.now() + timedelta(minutes=-10)
        for component in components:
            component.is_free = (
                not component.seats.filter(
                    reserve__current_datetime__gte=ten_minutes_ago,
                    reserve__service_id=self.id,
                ).exists()
                and not self.tickets.filter(seat=component, ticket_status=Ticket.TicketStatus.ACTIVE).exists()
            )
        return components

    @property
    def sales_seats(self):
        # TODO: Consider seats taken in datetime_to (reserved and bought)
        components = self.bus.components
        five_minutes_ago = timezone.now() + timedelta(minutes=-5)
        for component in components:
            component.is_free = (
                not component.seats.filter(
                    reserve__current_datetime__gte=five_minutes_ago,
                    reserve__service_id=self.id,
                ).exists()
                and not self.tickets.filter(seat=component, ticket_status=Ticket.TicketStatus.ACTIVE).exists()
            )
        return components

    def add_drivers(self, drivers_id: [int]):
        for driver_id in drivers_id:
            self.drivers.add(driver_id)

    def add_assistants(self, assistants_id: [int]):
        for assistant_id in assistants_id:
            self.assistants.add(assistant_id)

    def calculate_durations(self):
        for order, stretch in enumerate(self.route.stretches.all()):
            arrival_time = time(hour=0, minute=0)

            if order == 0:
                departure_time = self.start_time
            else:
                departure_time = (datetime.combine(date(1, 1, 1), arrival_time) + timedelta(minutes=15)).time()

            arrival_time = (datetime.combine(date(1, 1, 1), departure_time) + stretch.duration).time()
            ServiceRouteStretch.objects.create(
                route_stretch=stretch,
                service=self,
                departure_time=departure_time,
                arrival_time=arrival_time,
            )

    @property
    def last_arrival_datetime(self):
        acumulate_time = timedelta(0)
        start_time = self.start_time
        for info_stretch in self.service_route_stretches.all():
            duration = datetime.combine(date.min, info_stretch.arrival_time) - datetime.combine(date.min, start_time)
            acumulate_time += duration
            start_time = info_stretch.departure_time

        return datetime.combine(self.datetime_publish.date(), self.start_time) + acumulate_time

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Servicio"
        verbose_name_plural = "Servicios"


class ServiceRouteStretch(models.Model):
    service = models.ForeignKey(
        Service,
        on_delete=models.CASCADE,
        verbose_name=_("Servicio"),
        related_name="service_route_stretches",
    )
    route_stretch = models.ForeignKey(
        RouteStretch,
        on_delete=models.CASCADE,
        verbose_name=_("Tramo de ruta"),
        related_name="service_route_stretches",
    )
    departure_time = models.TimeField(_("Hora de salida"), blank=True, null=True)
    arrival_time = models.TimeField(_("Hora de llegada"), blank=True, null=True)

    def __str__(self):
        return f"Tiempos: {self.service.name} - {self.route_stretch}"

    class Meta:
        verbose_name = "Tramo de ruta del servicio"
        verbose_name_plural = "Tramos de ruta del servicio"


class ServiceSeatRate(models.Model):
    service = models.ForeignKey(
        Service,
        on_delete=models.CASCADE,
        verbose_name=_("Servicio"),
        related_name="rates",
    )
    day = models.CharField(_("Día"), max_length=9, choices=Days.choices)
    stretch = models.ForeignKey(
        RouteStretch,
        on_delete=models.CASCADE,
        verbose_name=_("Tramo de ruta"),
        blank=True,
        null=True,
    )
    seat_type = models.ForeignKey(SeatType, on_delete=models.CASCADE, verbose_name=_("Tipo de asiento"))
    source_type = models.CharField(
        _("Tipo de canal de venta"),
        max_length=20,
        choices=SalesChannel.choices,
        default=SalesChannel.WEB,
    )
    price = models.DecimalField(_("Precio"), decimal_places=2, max_digits=10)
    created = models.DateTimeField(_("Fecha de creación"), auto_now_add=True)

    class Meta:
        verbose_name = "Tarifa de servicio"
        verbose_name_plural = "Tarifas de servicio"


class PassengerNationality(models.Model):
    code = models.CharField(_("Código"), max_length=10, blank=True, null=True)
    name = models.CharField(_("Nombre"), max_length=255)

    def __str__(self):
        return f"{self.code} {self.name}"

    class Meta:
        verbose_name = "Nacionalidad del pasajero"
        verbose_name_plural = "Nacionalidades de los pasajeros"


class Passenger(models.Model):
    class PassengerType(models.TextChoices):
        CHILD = "child", "Child"
        ADULT = "adult", "Adult"

    passenger_type = models.CharField(
        _("Tipo de pasajero"),
        max_length=6,
        choices=PassengerType.choices,
        default="ADULT",
    )
    user = models.OneToOneField(
        CustomUser,
        on_delete=models.CASCADE,
        primary_key=True,
        verbose_name=_("Usuario"),
    )

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"

    class Meta:
        verbose_name = "Pasajero"
        verbose_name_plural = "Pasajeros"


class Ticket(models.Model):
    class TicketStatus(models.TextChoices):
        DRAFT = "draft", "Borrador"
        RESERVED = "reserved", "Reservado"
        ACTIVE = "active", "Active"
        REFUNDED = "refunded", "Refunded"
        PARTIAL_REFUNDED = "partial_refunded", "Partial Refunded"

    class TicketSource(models.TextChoices):
        NORMAL = "branch_office", "Branch office"
        VIRTUAL = "web", "Web"

    class TicketType(models.TextChoices):
        ONEWAY = "one_way", "One way"
        RETURN = "return", "Return"

    one_way_parent = models.OneToOneField(
        "self",
        on_delete=models.CASCADE,
        verbose_name=_("Servicio Ida"),
        blank=True,
        null=True,
    )

    service = models.ForeignKey(
        Service,
        on_delete=models.CASCADE,
        verbose_name=_("Servicio"),
        related_name="tickets",
    )
    ticket_source = models.CharField(
        _("Fuente de compra del boleto"),
        max_length=15,
        choices=TicketSource.choices,
        blank=True,
        null=True,
    )
    ticket_type = models.CharField(_("Tipo de boleto"), max_length=9, choices=TicketType.choices)
    seat = models.ForeignKey(
        Seat,
        on_delete=models.CASCADE,
        verbose_name=_("Asiento"),
        related_name="tickets",
    )
    reserved_time = models.DateTimeField(_("Bloqueado hasta"))  # now + 10min
    price = models.DecimalField(_("Precio"), decimal_places=2, max_digits=10, blank=True, null=True)
    discount = models.DecimalField(_("Descuento"), decimal_places=2, max_digits=10, blank=True, null=True)
    quantity = models.IntegerField(_("Cantidad"), default=1)
    passenger = models.ForeignKey(
        Passenger,
        on_delete=models.CASCADE,
        verbose_name=_("Pasajero"),
        related_name="tickets",
    )
    ticket_status = models.CharField(
        _("Estado"),
        max_length=20,
        choices=TicketStatus.choices,
        default=TicketStatus.DRAFT,
    )
    start_bus_stop = models.ForeignKey(
        BusStop,
        on_delete=models.CASCADE,
        verbose_name=_("Parada de salida"),
        related_name="tickets_start",
        blank=True,
        null=True,
    )
    end_bus_stop = models.ForeignKey(
        BusStop,
        on_delete=models.CASCADE,
        verbose_name=_("Parada de llegada"),
        related_name="tickets_end",
        blank=True,
        null=True,
    )

    @property
    @admin.display(description="Fue retornado")
    def is_refunded(self):
        return self.refunds.filter(refundrequest__authorized_date__isnull=False).exists()

    def get_data_context(self) -> dict:
        passenger = self.passenger
        sales = self.sales.first()
        return {
            "name": passenger.user.first_name,
            "last_name": passenger.user.last_name,
            "rut": passenger.user.document_number,
            "buy_order": sales.buy_order,
            "seat_number": self.seat.code,
            "start_city": self.service.start_city,
            "end_city": self.service.end_city,
            "travel_date": self.service.datetime_publish.strftime("%d/%m/%Y"),
            "end_travel_date": self.service.datetime_publish.strftime("%d/%m/%Y"),  # TODO: Obtener duración por tramos
            "travel_time": self.service.datetime_publish.strftime("%H:%M"),
            "end_travel_time": self.service.datetime_publish.strftime("%H:%M"),  # TODO: Obtener duración por tramos
            "start_bus_stop": self.service.route.start_bus_stop,
            "end_bus_stop": self.service.route.end_bus_stop,
            "price": str(self.price),
            "discount": 0,
            "total_price": str(self.price),
            "print_code": sales.buy_order,
            "svg": create_qr(sales.buy_order),
        }

    def send_mail(self, buy_order: str):
        passenger = self.passenger
        font_config = FontConfiguration()
        css = CSS(
            string="""
        @page {
            size: A4;
            margin: 0cm;
            }
        """,
            font_config=font_config,
        )

        html = render_to_string("email/compra_ticket_pdf.html", self.get_data_context())
        file_bytes = HTML(string=html).write_pdf(stylesheets=[css], font_config=font_config)

        EmailSender.send_email_with_pdf_attachment(
            subject="Ticket comprado",
            template="email/compra_ticket.html",
            context={
                "name": passenger.user.first_name,
                "last_name": passenger.user.last_name,
                "rut": passenger.user.document_number,
                "buy_order": buy_order,
                "seat_number": self.seat.code,
                "start_city": self.service.start_city,
                "end_city": self.service.end_city,
                "travel_date": self.service.datetime_to.strftime("%d/%m/%Y"),
                "end_travel_date": self.service.datetime_from.strftime("%d/%m/%Y"),
                "travel_time": self.service.datetime_to.strftime("%H:%M"),
                "end_travel_time": self.service.datetime_from.strftime("%H:%M"),
                "start_bus_stop": self.service.route.start_bus_stop,
                "end_bus_stop": self.service.route.end_bus_stop,
                "price": str(self.price),
                "discount": str(self.discount),
                "total_price": str(self.price + self.discount),
                "print_code": buy_order,
            },
            receiver=passenger.user.email,
            attachment=file_bytes,
        )

    @classmethod
    def sources(cls):
        return [element[0] for element in cls.TicketSource.choices]

    @classmethod
    def types(cls):
        return [element[0] for element in cls.TicketType.choices]

    @property
    def tuple_fields(self):
        return (
            self.get_ticket_source_display(),
            self.get_ticket_type_display(),
            self.seat.code,
            self.quantity,
            self.price,
            self.passenger.user.first_name,
            self.passenger.user.last_name,
            self.passenger.get_passenger_type_display(),
            self.passenger.user.get_sex_display(),
            self.passenger.user.date_of_birth,
            self.passenger.user.document_number,
            self.passenger.user.nationality.name if self.passenger.user.nationality else "-",
            self.passenger.user.email,
            self.passenger.user.phone,
        )

    def __str__(self) -> str:
        return f"Boleto {self.id}"

    class Meta:
        verbose_name = "Boleto"
        verbose_name_plural = "Boletos"


class Printer(models.Model):
    name = models.CharField(_("Nombre"), max_length=255)
    total_prints = models.IntegerField(_("Máxima cantidad de impresiones"))

    def __str__(self) -> str:
        return self.name

    class Meta:
        verbose_name = "Impresora"
        verbose_name_plural = "Impresoras"


class CashRegister(models.Model):
    class Status(models.TextChoices):
        CREATED = "created", "Creado"
        OPEN = "open", "Abierto"
        PENDING = "pending", "Pendiente"
        BILLED = "billed", "Depositado"
        BLOCKED = "blocked", "Bloqueado"

    name = models.CharField(_("Nombre"), max_length=100)
    status = models.CharField(_("Estado"), max_length=9, choices=Status.choices, default=Status.CREATED)
    created = models.DateTimeField(_("Fecha"), auto_now_add=True)
    cashier = models.ForeignKey(Personal, verbose_name=_("Cajero"), on_delete=models.CASCADE)
    branch = models.ForeignKey(
        Branch, verbose_name=_("Sucursal"), on_delete=models.CASCADE, related_name="cash_registers"
    )
    total_prints = models.IntegerField(_("Total de impresiones"), default=0)
    printer = models.ForeignKey(
        Printer,
        verbose_name=_("Impresora"),
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )

    def __str__(self) -> str:
        return f"Caja {self.id}"

    @property
    def cashier_fullname(self) -> str:
        return f"{self.cashier.user.first_name} {self.cashier.user.last_name}"

    @property
    def cashier_positions(self) -> str:
        return self.cashier.positions.all()

    @property
    def sucursal_name(self) -> str:
        return self.branch.name

    @property
    def sucursal_id(self) -> int:
        return self.branch.id

    @property
    def last_date_sale(self) -> str:
        return self.sales.last().created

    @property
    def initial_amount(self) -> Decimal:
        movements = self.movements.filter(status="open")
        last_movement = movements.last()
        return last_movement.amount if last_movement and last_movement.amount else Decimal(0)

    @property
    def last_status_date(self):
        last_movement = self.movements.last()
        return last_movement.created_at if last_movement else None

    @property
    def amount_operations(self):
        ins = (
            self.operations.filter(operation_type=CashRegisterOperation.OperationType.IN)
            .aggregate(Sum("amount"))
            .get("amount__sum")
        )
        outs = (
            self.operations.filter(operation_type=CashRegisterOperation.OperationType.OUT)
            .aggregate(Sum("amount"))
            .get("amount__sum")
        )

        outs = outs if outs is not None else Decimal(0)
        ins = ins if ins is not None else Decimal(0)

        return ins - outs

    @property
    def actual_amount(self):
        last_movement = self.movements.exclude(
            status__in=[
                CashRegisterMovement.Status.PENDING,
                CashRegisterMovement.Status.BILLED,
                CashRegisterMovement.Status.BLOCKED,
            ]
        ).last()
        last_amount = last_movement.amount if last_movement and last_movement.amount else Decimal(0)

        return last_amount + self.amount_operations

    def open_cash_register(self, amount: Decimal):
        self.status = CashRegister.Status.OPEN
        self.movements.create(
            amount=amount,
            status=CashRegister.Status.OPEN,
        )
        self.save()

    def close_cash_register(self):
        self.status = CashRegister.Status.PENDING
        # TODO: Close cash register and pending to be deposited
        self.movements.create(status=CashRegister.Status.PENDING, amount=self.actual_amount)
        self.save()

    def deposit_cash_register(self, voucher: str):
        self.status = CashRegister.Status.BILLED
        # TODO: Really close cash register after being deposited
        self.movements.create(
            voucher=voucher,
            status=CashRegister.Status.BILLED,
            amount=self.actual_amount,
        )
        self.save()

    @property
    def can_deposit(self):
        return self.status != CashRegister.Status.BLOCKED

    def reset_print_counter(self):
        self.total_prints = 0
        self.save()

    def increment_print(self):
        self.total_prints += 1
        if self.printer.total_prints < self.total_prints + 50:
            EmailSender.send_html_email(
                subject=f"Cambio de rollo de impresión en caja {self.name}",
                receiver=settings.SUPPORT_EMAIL,
                template="email/renovacion_impresora.html",
                context={
                    "cash_register": self.name,
                },
            )
        self.save()

    class Meta:
        verbose_name = "Caja"
        verbose_name_plural = "Cajas"


class CashRegisterMovement(models.Model):
    class Status(models.TextChoices):
        CREATED = "created", "Creado"
        OPEN = "open", "Abierto"
        PENDING = "pending", "Pendiente"
        BILLED = "billed", "Depositado"
        BLOCKED = "blocked", "Bloqueado"

    status = models.CharField(_("Estado"), max_length=9, choices=Status.choices)
    voucher = models.CharField(_("Voucher"), max_length=50, blank=True, null=True)
    amount = models.DecimalField(_("Monto"), decimal_places=2, max_digits=10, blank=True, null=True)
    created_at = models.DateTimeField(_("Fecha"), auto_now_add=True)
    cash_register = models.ForeignKey(
        CashRegister,
        verbose_name=_("Caja"),
        on_delete=models.CASCADE,
        related_name="movements",
    )

    # TODO: Add cashier and personal who made the deposit

    def __str__(self) -> str:
        return f"Movimiento de {self.cash_register.name}"

    class Meta:
        verbose_name = "Movimiento de caja"
        verbose_name_plural = "Movimientos de caja"


class Sale(models.Model):
    class Status(models.TextChoices):
        PENDING = "pending", "Pendiente"
        PAID = "paid", "Pagado"
        CANCELLED = "cancelled", "Cancelado"
        PARTIAL_REFUNDED = "partial refunded", "Parcialmente reembolsado"
        REFUNDED = "refunded", "Reembolsado"
        REJECTED = "rejected", "Rechazado"
        ERROR = "error", "Error"

    class CashPaymentType(models.TextChoices):
        CASH = "cash", "Efectivo"
        CREDIT = "credit", "Crédito"
        DEBIT = "debit", "Débito"

    created = models.DateTimeField(_("Fecha de creación"), auto_now_add=True)
    buy_order = models.CharField(_("Orden compra"), max_length=200, blank=True, null=True)
    payment_method = models.CharField(_("Método de pago"), max_length=20, blank=True, null=True)
    payment_date = models.DateTimeField(_("Fecha de pago"), blank=True, null=True)
    payment_status = models.BooleanField(_("Estado de pago"), default=False)
    tickets = models.ManyToManyField(Ticket, verbose_name=_("Boletos"), related_name="sales")
    status = models.CharField(_("Estado"), max_length=16, choices=Status.choices)
    cash_payment_type = models.CharField(
        _("Tipo de pago"),
        max_length=6,
        choices=CashPaymentType.choices,
        blank=True,
        null=True,
    )
    seller = models.ForeignKey(
        Personal,
        on_delete=models.CASCADE,
        blank=True,
        null=True,
        verbose_name=_("Vendedor"),
    )
    cash_register = models.ForeignKey(
        CashRegister,
        on_delete=models.CASCADE,
        blank=True,
        null=True,
        related_name="sales",
    )

    @property
    def get_ruts(self) -> list[str]:
        return [
            ticket.passenger.user.document_number for ticket in self.tickets.all().select_related("passenger__user")
        ]

    def add_tickets(self, tickets_id: [int]) -> None:
        for ticket_id in tickets_id:
            self.tickets.add(ticket_id)

    def get_data_context(self) -> dict:
        if tickets := self.tickets.all().select_related("passenger", "seat"):
            first_ticket = tickets.first()
            service = first_ticket.service
            sale = first_ticket.sales.all().first()
            passengers = []
            price = Decimal(0)
            discount = Decimal(0)

            for ticket in tickets:
                passengers.append(
                    {
                        "name": ticket.passenger.user.first_name,
                        "last_name": ticket.passenger.user.last_name,
                        "passenger_type": ticket.passenger.passenger_type,
                        "doc": hide_last_4_digits_rut(ticket.passenger.user.document_number),
                        "seat": ticket.seat.code,
                    }
                )
                price += ticket.price
                discount += ticket.discount

            return {
                "passengers": passengers,
                "origin": service.start_city.name,
                "destination": service.end_city.name,
                "departure_date": service.datetime_publish.date(),
                "arrival_date": service.last_arrival_datetime.date(),
                "departure_time": service.start_time,
                "arrival_time": service.last_arrival_datetime.strftime("%H:%M"),
                "start_bus_stop": first_ticket.start_bus_stop.name,
                "end_bus_stop": first_ticket.end_bus_stop.name,
                "price": str(price + discount),
                "discount": str(discount),
                "total_price": str(price),
                "print_code": sale.buy_order,
                "buy_order": sale.buy_order,
                "svg": create_qr(sale.buy_order),
            }
        return {}

    class Meta:
        verbose_name = "Venta"
        verbose_name_plural = "Ventas"


class ReservedSeats(models.Model):
    """Model for reserved seats considering the platform
    because there's 5 minutes to release the seat in office
    and 10 minutes to release the seat in web
    """

    # TODO: Consider save this in redis instead of database
    class Platform(models.TextChoices):
        WEB = "web", "Web"
        OFFICE = "office", "Oficina"

    session = models.CharField(_("Sesión"), max_length=255)
    service = models.ForeignKey(Service, verbose_name=_("Servicio"), on_delete=models.CASCADE)
    platform = models.CharField(_("Plataforma"), max_length=8, choices=Platform.choices)
    current_datetime = models.DateTimeField(
        _("Fecha y hora actual"),
        auto_now_add=True,
    )

    def __str__(self) -> str:
        return f"{self.service}"

    class Meta:
        verbose_name = "Reserva de asientos"
        verbose_name_plural = "Reservas de asientos"


class ReservedSeat(models.Model):
    reserve = models.ForeignKey(
        ReservedSeats,
        verbose_name=_("Reserva"),
        related_name="seats",
        on_delete=models.CASCADE,
    )
    seat = models.ForeignKey(Seat, verbose_name=_("Asiento"), related_name="seats", on_delete=models.CASCADE)
    is_taken = models.BooleanField(_("Reservado"), default=True)

    def __str__(self) -> str:
        return f"{self.reserve} - {self.seat}"

    class Meta:
        verbose_name = "Asiento reservado"
        verbose_name_plural = "Asientos reservados"


class CashRegisterOperation(models.Model):
    class OperationType(models.TextChoices):
        IN = "in", "Ingreso"
        OUT = "out", "Salida"

    class CashRegisterSubOperation(models.TextChoices):
        WEBPAY = "webpay", "Webpay"
        CASH = "cash", "Efectivo "
        PARTIAL_REFUND = "partial refund", "Reembolso parcial"
        TOTAL_REFUND = "total refund", "Reembolso"
        # COUPON = 'coupon', 'Cupón' # TODO: ASK THIS
        DATE_CHANGE = "date change", "Cambio de fecha"
        DATE_CHANGE_AGREEMENT = "date change agreement", "Cambio de fecha convenio"

    operation_description = models.CharField(
        _("Tipo descripción"),
        max_length=100,
        choices=CashRegisterSubOperation.choices,
        default=CashRegisterSubOperation.CASH,
    )
    operation_type = models.CharField(_("Tipo"), max_length=4, choices=OperationType.choices)
    amount = models.DecimalField(_("Monto"), decimal_places=2, max_digits=10, blank=True, null=True)
    created_at = models.DateTimeField(_("Fecha"), auto_now_add=True)
    cash_register = models.ForeignKey(
        CashRegister,
        verbose_name=_("Caja"),
        on_delete=models.CASCADE,
        related_name="operations",
    )
    sale = models.ForeignKey(
        Sale,
        verbose_name=_("Venta"),
        on_delete=models.CASCADE,
        related_name="operations",
        blank=True,
        null=True,
    )
    linked_operation = models.ForeignKey(
        "self",
        verbose_name=_("reference operation"),
        on_delete=models.CASCADE,
        blank=True,
        null=True,
    )
    description = models.CharField(_("Descripción"), max_length=255, blank=True, null=True)

    class Meta:
        verbose_name = "Operación de caja"
        verbose_name_plural = "Operaciones de caja"


class RefundTicket(models.Model):
    refunded_amount = models.DecimalField(_("Monto"), decimal_places=2, max_digits=10, blank=True, null=True)
    ticket = models.ForeignKey(
        Ticket,
        verbose_name=_("Autorizador"),
        on_delete=models.CASCADE,
        related_name="refunds",
    )
    description = models.CharField(_("Descripción"), max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(_("Fecha creación"), auto_now_add=True)

    class Meta:
        verbose_name = "Ticket devolución"
        verbose_name_plural = "Tickets devolución"


class RefundRequest(models.Model):
    buy_order = models.CharField(_("Orden compra"), max_length=255)
    email = models.EmailField(_("Correo electrónico"))
    description = models.CharField(_("Descripción"), max_length=1000)
    created_at = models.DateTimeField(_("Fecha creación"), auto_now_add=True)
    refunded_amount = models.DecimalField(_("Monto"), decimal_places=2, max_digits=10, blank=True, null=True)
    cash_register = models.ForeignKey(
        CashRegister,
        verbose_name=_("Caja"),
        on_delete=models.CASCADE,
        related_name="refund_requests",
        blank=True,
        null=True,
    )
    seller = models.ForeignKey(
        Personal,
        verbose_name=_("Vendedor"),
        on_delete=models.CASCADE,
        related_name="refund_requests",
        blank=True,
        null=True,
    )
    tickets = models.ManyToManyField(RefundTicket, verbose_name=_("tickets"))
    authorizer = models.ForeignKey(  # TODO: ask if its needed more authorizers
        Personal,
        verbose_name=_("Autorizador"),
        on_delete=models.CASCADE,
        blank=True,
        null=True,
    )
    authorized_date = models.DateTimeField(_("Fecha autorización"), blank=True, null=True)
    sale = models.ForeignKey(
        Sale,
        verbose_name=_("Venta"),
        on_delete=models.CASCADE,
        related_name="refunds",
        blank=True,
        null=True,
    )

    def notify_seller(self):
        """
        Notifica al vendedor que se ha solicitado una devolución
        """
        EmailSender.send_email(
            subject=_(f"Solicitud de devolución {self.buy_order}"),
            message=f"Se ha solicitado una devolución para la orden de compra: {self.buy_order}",
            to=["hola@andimar.cl"],
        )

    def send_mail(self):
        for ticket in self.tickets.all():
            passenger = ticket.passenger
            EmailSender.send_html_email(
                subject="Devolución de ticket",
                template="email/devolucion.html",
                context={
                    "name": passenger.user.first_name,
                    "last_name": passenger.user.last_name,
                    "rut": passenger.user.document_number,
                    "buy_order": self.buy_order,
                    "seat_number": ticket.seat.number,
                    "price": str(ticket.price),
                    "discount": str(ticket.discount),
                    "total_price": str(ticket.price + ticket.discount),
                    "print_code": self.buy_order,
                },
                receiver=passenger.user.email,
            )

    def __str__(self) -> str:
        return f"Devulicón: {self.buy_order}"

    class Meta:
        verbose_name = "Solicitud de devolución"
        verbose_name_plural = "Solicitudes de devolución"


class Season(models.Model):
    name = models.CharField(_("Nombre"), max_length=255)
    type = models.CharField(choices=TypeSeason.choices, max_length=255, default=TypeSeason.LOW)
    start_date = models.DateTimeField(_("Fecha inicio"))
    end_date = models.DateTimeField(_("Fecha fin"))
    status = models.BooleanField(_("Estado"), default=True)

    def __str__(self) -> str:
        return self.name

    class Meta:
        verbose_name = "Temporada"
        verbose_name_plural = "Temporadas"


class StretchInfo(models.Model):
    start_bus_stop = models.ForeignKey(
        BusStop,
        verbose_name=_("Parada inicio"),
        related_name="start_tariff_bus_stop",
        on_delete=models.CASCADE,
    )
    end_bus_stop = models.ForeignKey(
        BusStop,
        verbose_name=_("Parada fin"),
        related_name="end_tariff_bus_stop",
        on_delete=models.CASCADE,
    )
    distance = models.FloatField(_("Distancia"), default=0)
    duration = models.DurationField(_("Tiempo"), default=timedelta(0))
    created_at = models.DateTimeField(_("Fecha creación"), auto_now_add=True)

    def __str__(self) -> str:
        return f"Tarifa: {self.start_bus_stop} - {self.end_bus_stop}"

    class Meta:
        verbose_name = "Información de tramo referencial"
        verbose_name_plural = "Información de tramos referenciales"


class StretchInfoRate(models.Model):
    stretch_info = models.ForeignKey(
        StretchInfo,
        related_name="rates",
        verbose_name=_("Información de tramo"),
        on_delete=models.CASCADE,
    )
    sales_channel = models.CharField(
        "Tipo de canal de venta",
        choices=SalesChannel.choices,
        max_length=10,
        default=SalesChannel.WEB,
    )
    seat_type = models.ForeignKey(SeatType, on_delete=models.CASCADE, verbose_name=_("Tipo de asiento"))
    price = models.DecimalField(_("Precio"), decimal_places=2, max_digits=10, blank=True, null=True)
    season = models.CharField(choices=TypeSeason.choices, max_length=10, default=TypeSeason.LOW)
    created_at = models.DateTimeField(_("Fecha creación"), auto_now_add=True)

    class Meta:
        verbose_name = "tramo referencial por tipo de asiento"
        verbose_name_plural = "tramos referenciales tipo de asiento"


# convenios y cupones
class Coupon(models.Model):
    class DiscountType(models.TextChoices):
        PERCENTAGE = "percentage", "Porcentaje"
        AMOUNT = "amount", "Monto"

    code = models.CharField(_("Código"), max_length=30)
    discount_type = models.CharField(choices=DiscountType.choices, max_length=10, default=DiscountType.PERCENTAGE)
    discount = models.DecimalField(_("Descuento"), decimal_places=2, max_digits=5)
    max_uses = models.PositiveIntegerField(_("Máximo usos"), blank=True, null=True)
    count_uses = models.PositiveIntegerField(_("Usos"), default=0)
    valid_from = models.DateTimeField(_("Válido desde"), blank=True, null=True)
    valid_to = models.DateTimeField(_("Válido hasta"), blank=True, null=True)
    created_at = models.DateTimeField(_("Fecha creación"), auto_now_add=True)
    passangers = models.ManyToManyField(Passenger, verbose_name=_("Pasajeros"), related_name="coupons")
    services = models.ManyToManyField(Service, verbose_name=_("Servicios"), related_name="coupons")
    seat_type = models.ManyToManyField(SeatType, verbose_name=_("Tipo de asiento"), related_name="coupons")

    def __str__(self) -> str:
        return f"Cupón: {self.code}"

    def check_service(self, service_id: str) -> bool:
        return self.services.filter(id=service_id).exists()

    def check_passanger(self, rut: str) -> bool:
        return self.passangers.filter(document_number=rut).exists()

    class Meta:
        verbose_name = "Cupón"
        verbose_name_plural = "Cupones"


class MetaDiscount(models.Model):
    class DiscountStrategy(models.TextChoices):
        DNI = "dni", "DNI"
        SERVICE = "service", "Servicio"
        TICKET_QUANTITY = "ticket_quantity", "Cantidad de boletos"
        ROLE = "role", "Rol"  # global
        BRANCH_OFFICE = "branch_office", "Sucursal"  # sub-operación
        COUPON = "coupon", "Cupón"  # sub-operación

    class DiscountType(models.TextChoices):
        PERCENTAGE = "percentage", "Porcentaje"
        AMOUNT = "amount", "Monto"

    discount_type = models.CharField(choices=DiscountType.choices, max_length=10, default=DiscountType.PERCENTAGE)
    discount = models.DecimalField(_("Descuento"), decimal_places=2, max_digits=10)
    max_uses = models.PositiveIntegerField(_("Máximo usos"), blank=True, null=True)
    count_uses = models.PositiveIntegerField(_("Usos"), default=0)
    created_at = models.DateTimeField(_("Fecha creación"), auto_now_add=True)

    class Meta:
        verbose_name = "Meta descuento"
        verbose_name_plural = "Metas descuento"


class DNIDiscountStrategy(models.Model):
    rut = models.CharField(_("RUT"), max_length=15)
    valid_from = models.DateTimeField(_("Válido desde"), blank=True, null=True)
    valid_to = models.DateTimeField(_("Válido hasta"), blank=True, null=True)
    discount = models.ForeignKey(
        MetaDiscount,
        verbose_name=_("Descuento"),
        related_name="dni_discount",
        on_delete=models.CASCADE,
    )

    class Meta:
        verbose_name = "Descuento por DNI"
        verbose_name_plural = "Descuentos por DNI"


class ServiceDiscountStrategy(models.Model):
    service = models.ForeignKey(
        Service,
        verbose_name=_("Servicio"),
        related_name="service_discount",
        on_delete=models.CASCADE,
    )
    valid_from = models.DateTimeField(_("Válido desde"), blank=True, null=True)
    valid_to = models.DateTimeField(_("Válido hasta"), blank=True, null=True)
    discount = models.ForeignKey(
        MetaDiscount,
        verbose_name=_("Descuento"),
        related_name="service_discount",
        on_delete=models.CASCADE,
    )

    class Meta:
        verbose_name = "Descuento por servicio"
        verbose_name_plural = "Descuentos por servicio"


class RoleDiscountStrategy(models.Model):
    position = models.ForeignKey(
        Position,
        verbose_name=_("Rol"),
        related_name="role_discount",
        on_delete=models.CASCADE,
    )
    discount = models.ForeignKey(
        MetaDiscount,
        verbose_name=_("Descuento"),
        related_name="role_discount",
        on_delete=models.CASCADE,
    )

    class Meta:
        verbose_name = "Descuento por rol"
        verbose_name_plural = "Descuentos por rol"


class BranchOfficeDiscountStrategy(models.Model):
    class DiscountStrategy(models.TextChoices):
        DNI = "dni", "DNI"
        SERVICE = "service", "Servicio"

    strategy = models.CharField(choices=DiscountStrategy.choices, max_length=10, default=DiscountStrategy.DNI)
    valid_from = models.DateTimeField(_("Válido desde"), blank=True, null=True)
    valid_to = models.DateTimeField(_("Válido hasta"), blank=True, null=True)
    branch_office = models.ForeignKey(
        Branch,
        verbose_name=_("Sucursal"),
        related_name="branch_office_discount",
        on_delete=models.CASCADE,
    )
    discount = models.ForeignKey(
        MetaDiscount,
        verbose_name=_("Descuento"),
        related_name="branch_office_discount",
        on_delete=models.CASCADE,
    )

    class Meta:
        verbose_name = "Descuento por sucursal"
        verbose_name_plural = "Descuentos por sucursal"


class CouponDiscountStrategy(models.Model):
    class DiscountStrategy(models.TextChoices):
        DNI = "dni", "DNI"
        SERVICE = "service", "Servicio"

    code = models.CharField(_("Código"), max_length=30)
    strategy = models.CharField(choices=DiscountStrategy.choices, max_length=10, default=DiscountStrategy.DNI)
    valid_from = models.DateTimeField(_("Válido desde"), blank=True, null=True)
    valid_to = models.DateTimeField(_("Válido hasta"), blank=True, null=True)
    rut = models.CharField(_("RUT"), max_length=15, blank=True, null=True)
    service = models.ForeignKey(
        Service,
        verbose_name=_("Servicio"),
        related_name="coupon_discount",
        on_delete=models.CASCADE,
        blank=True,
        null=True,
    )
    discount = models.ForeignKey(
        MetaDiscount,
        verbose_name=_("Descuento"),
        related_name="coupon_discount",
        on_delete=models.CASCADE,
    )

    class Meta:
        verbose_name = "Descuento por cupón"
        verbose_name_plural = "Descuentos por cupón"


class RecoverableError(models.Model):
    code = models.TextField()
    user = models.IntegerField(null=True)
    params = models.JSONField()
    metadata = models.JSONField()
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    resolved = models.BooleanField(default=False)


class ServiceMessage(models.Model):
    service = models.ForeignKey(
        Service,
        verbose_name=_("Servicio"),
        related_name="messages",
        on_delete=models.CASCADE,
    )
    personal = models.ForeignKey(
        Personal,
        verbose_name=_("Personal"),
        related_name="messages",
        on_delete=models.CASCADE,
    )
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

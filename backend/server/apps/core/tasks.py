from django.db.models import QuerySet
from django.utils import timezone

from celery.utils.log import get_task_logger
from dateutil.relativedelta import relativedelta
from mongodb.models import (
    PaymentConfirmation,
    PaymentIntention,
    Refund,
)
from server.celery import app

from .models import (
    CashRegister,
    RecoverableError,
    ReservedSeats,
    Service,
    Ticket,
)

logger = get_task_logger(__name__)


@app.task(bind=True, name="task.core.update_schedule_for_service")
def update_schedule_for_service(self):
    services = Service.objects.filter(status=Service.Status.ACTIVE, datetime_to__date=timezone.now().date())
    for service in services:
        if service.renovation_months:
            to_time = service.datetime_to.time()
            now = timezone.now()
            service.datetime_to = now.replace(hour=to_time.hour, minute=to_time.minute) + relativedelta(
                months=service.renovation_months
            )
            service.save()


@app.task(bind=True, name="task.core.release_seats")
def release_seats(self):
    # Pasados los 10 o 5 minutos se debe liberar los asientos
    seat_web = ReservedSeats.objects.filter(
        platform=ReservedSeats.Platform.WEB, current_datetime__lte=timezone.now() - timezone.timedelta(minutes=10)
    )
    seat_office = ReservedSeats.objects.filter(
        platform=ReservedSeats.Platform.OFFICE, current_datetime__lte=timezone.now() - timezone.timedelta(minutes=5)
    )
    seat_web.delete()
    seat_office.delete()


@app.task(bind=True, name="task.core.block_cash_registers")
def block_cash_registers(self):
    """Close cash registers that are inactive by 2 days."""
    # Include filters to exclude cash registers that are already closed
    cash_registers = CashRegister.objects.filter(
        status__in=[
            CashRegister.Status.OPEN,
            CashRegister.Status.PENDING,
            CashRegister.Status.BILLED,
        ]
    )
    for cash_register in cash_registers:
        last_movement = cash_register.movements.last()
        if last_movement and last_movement.created_at.date() + relativedelta(days=2) < timezone.now().date():
            cash_register.status = CashRegister.Status.BLOCKED
            cash_register.save()


@app.task(bind=True, name="task.core.resolve_recoverable_error")
def resolve_recoverable_error(self):
    errors = RecoverableError.objects.filter(resolved=False)

    for error in errors:
        if error.code == "SAVE_TRANSBANK_PAY_MONGODB_ERROR":
            pay_data_recoverable_error(error)
        elif error.code == "SAVE_TRANSBANK_COMMIT_MONGODB_ERROR":
            commit_data_recoverable_error(error)
        elif error.code == "SAVE_TRANSBANK_REFUND_MONGODB_ERROR":
            refund_data_recover(error)
        elif error.code == "SEND_TICKET_CONFIRMATION_SENDGRID_ERROR":
            ticket_email_recover(error)


def pay_data_recoverable_error(error: QuerySet[RecoverableError]) -> None:
    metadata = error.metadata
    intention_document = PaymentIntention(
        buy_order=metadata["buy_order"],
        sale=metadata["sale"],
        payment_method_request=metadata["payment_method_request"],
        payment_method_response=metadata["payment_method_response"],
    )
    intention_document.save()
    error.resolved = True
    error.save()


def commit_data_recoverable_error(error: QuerySet[RecoverableError]) -> None:
    metadata = error.metadata
    confirmation = PaymentConfirmation(
        buy_order=metadata["buy_order"],
        payment_method_request=metadata["payment_method_request"],
        payment_method_response=metadata["payment_method_response"],
    )
    confirmation.save()
    error.resolved = True
    error.save()


def refund_data_recover(error: QuerySet[RecoverableError]) -> None:
    metadata = error.metadata
    refund = Refund(
        buy_order=metadata["buy_order"],
        token=metadata["token"],
        amount=metadata["amount"],
        payment_method_request=metadata["payment_method_request"],
        payment_method_response=metadata["payment_method_response"],
    )
    refund.save()
    error.resolved = True
    error.save()


def ticket_email_recover(error: QuerySet[RecoverableError]) -> None:
    metadata = error.metadata
    ticket = Ticket.objects.get(pk=metadata["ticket_id"])
    ticket.send_mail(metadata["buy_order"])
    error.resolved = True
    error.save()

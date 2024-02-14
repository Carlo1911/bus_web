import os

from celery import Celery
from celery.schedules import crontab

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "server.settings.prod")
app = Celery("config")
app.config_from_object("django.conf:settings", namespace="CELERY")
app.autodiscover_tasks()

app.conf.beat_schedule = {
    "update-schedule-service": {
        "task": "task.core.update_schedule_for_service",
        "schedule": crontab(minute=0, hour=0),
    },
    "block-cash-registers": {
        "task": "task.core.block_cash_registers",
        "schedule": crontab(minute=0, hour=0),
    },
    "resolve-recoverable-error": {
        "task": "task.core.resolve_recoverable_error",
        "schedule": crontab(minute="*/2"),
    },
    "release-seats": {
        "task": "task.core.release_seats",
        "schedule": crontab(minute="*/1"),
    },
}

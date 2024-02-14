from celery import shared_task
from django.conf import settings
from utils.mail import EmailSender
from users.models import ResetPassword


@shared_task
def send_email_reset_password(reset_id):
    try:
        reset_password = ResetPassword.objects.select_related('user').get(pk=reset_id)
    except ResetPassword.DoesNotExist:
        print(f'No se encontró el registro relacionado al reinicio de contraseña {reset_id}')

    url = f"{settings.WEBSITE_URL}/reset-password?code={reset_password.code}&pk={reset_password.pk}"
    EmailSender.send_html_email(
        subject=f"Recuperación de contraseña {reset_password.user.get_full_name()}",
        receiver=reset_password.user.email,
        template="email/reset_password.html",
        context={
            "reset_password_url": url,
        },
    )

    return f'Enviado email para la recuperación de contraseña a {reset_password.user.email} ({reset_password.pk})'

@shared_task
def send_email_password_update_success(reset_id):
    try:
        reset_password = ResetPassword.objects.select_related('user').get(pk=reset_id)
    except ResetPassword.DoesNotExist:
        print(f'No se encontró el registro relacionado al reinicio de contraseña {reset_id}')

    EmailSender.send_html_email(
        subject=f"Contraseña actualizada con éxito",
        receiver=reset_password.user.email,
        template="email/password_update_success.html",
        context={
            'full_name': reset_password.user.get_full_name()
        },
    )

    return f'Enviado email para la recuperación de contraseña a {reset_password.user.email} ({reset_password.pk})'

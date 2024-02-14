from typing import Optional

from django.conf import settings
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.core.mail import EmailMessage


class EmailSender:
    @classmethod
    def send_html_email(
            cls,
            subject: str,
            template: str,
            context: dict,
            receiver: str,
            message: Optional[str] = None,
    ):
        html_string = render_to_string(template, context)
        send_mail(
            subject,
            message or subject,
            settings.DEFAULT_FROM_EMAIL,
            [receiver],
            html_message=html_string,
            fail_silently=False,
        )

    @classmethod
    def send_email(cls, subject: str, receiver: str, message: str):
        send_mail(
            subject,
            message,
            settings.DEFAULT_FROM_EMAIL,
            [receiver],
            fail_silently=False,
        )

    @classmethod
    def send_email_with_pdf_attachment(cls, subject: str, template: str, receiver: str, attachment: bytes,
                                       context: dict) -> None:
        html_string = render_to_string(template, context)
        email = EmailMessage(subject, html_string, settings.DEFAULT_FROM_EMAIL, [receiver])
        email.content_subtype = "html"
        email.attach("ticket.pdf", attachment, "application/pdf")
        email.send(fail_silently=False)

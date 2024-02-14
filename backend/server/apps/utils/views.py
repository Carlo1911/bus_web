from django.http import HttpResponse
from django.shortcuts import render
from django.template.loader import render_to_string

from utils.qr import create_qr
from weasyprint import (
    CSS,
    HTML,
)
from weasyprint.text.fonts import FontConfiguration


def test_qr(request):
    context = {}
    if request.method == "POST":
        context["svg"] = create_qr(request.POST.get("qr_text", ""))
    return render(request, "index.html", context=context)


def test_pdf(request):
    font_config = FontConfiguration()

    passengers = [
        {
            "name": "Carlo",
            "last_name": "Alva",
            "doc": "123123",
            "ticket_id": "123",
            "seat": "52",
        },
        {
            "name": "André",
            "last_name": "Alva",
            "doc": "123125",
            "ticket_id": "124",
            "seat": "53",
        },
        {
            "name": "Michael",
            "last_name": "Cordero",
            "doc": "123133",
            "ticket_id": "125",
            "seat": "54",
        },
    ]

    page_length = 75 + len(passengers) * 18 + 75

    css_string = f"""
    @page {{
        margin: 0;
        size: 80mm {page_length}mm;
    }}
    body {{font-size: 11px;}}
    body ul {{ margin: 0;}}
    .space {{margin-top: 10px;}}
    .passangers-title
    .destiny-title
    .origin-title {{
        font-size: 13px;
    }}
    """

    css = CSS(
        string=css_string,
        font_config=font_config,
    )

    context = {
        "passengers": passengers,
        "origin": "Lima",
        "destination": "Arequipa",
        "departure_date": "12/12/2021",
        "arrival_date": "14/12/2021",
        "departure_time": "11:10",
        "arrival_time": "12:10",
        "start_bus_stop": "parada1",
        "end_bus_stop": "parada2",
        "price": "15000",
        "discount": 0,
        "total_price": "15000",
    }

    html = render_to_string("email/mini-pdf.html", context)
    response = HttpResponse(content_type="application/pdf")
    response["Content-Disposition"] = "inline; report.pdf"
    HTML(string=html).write_pdf(response, stylesheets=[css], font_config=font_config, optimize_size=("fonts", "images"))
    return response


def test_ticket_pdf(request):
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

    context = {
        "name": "carlo",
        "last_name": "Alva",
        "buy_order": "123123",
        "seat_number": "13",
        "start_city": "Lima",
        "end_city": "Arequipa",
        "travel_date": "12/12/2021",
        "end_travel_date": "14/12/2021",
        "travel_time": "11:10",
        "end_travel_time": "12:10",
        "start_bus_stop": "parada1",
        "end_bus_stop": "parada2",
        "price": "15000",
        "discount": 0,
        "total_price": "15000",
        "print_code": 12,
        "address": "casa",
        "rut": "123123",
        "svg": create_qr("http://andimar.dev.cl/api/v1/tickets/123123"),
    }
    html = render_to_string("email/compra_ticket_pdf.html", context)
    response = HttpResponse(content_type="application/pdf")
    response["Content-Disposition"] = "inline; report.pdf"
    HTML(string=html).write_pdf(response, stylesheets=[css], font_config=font_config)
    return response


class MultiSerializerViewSetMixin:
    def get_serializer_class(self):
        try:
            return self.serializer_action_classes[self.action]
        except (KeyError, AttributeError):
            return super().get_serializer_class()

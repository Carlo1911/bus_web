from django.http import HttpResponse
from django.template.loader import render_to_string
from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import (
    OpenApiParameter,
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.parsers import JSONParser
from rest_framework.permissions import IsAuthenticatedOrReadOnly

from api.core.filters import TicketFilter
from api.core.serializers import (
    CreateTicketSerializer,
    TicketSerializer,
)
from core.models import Ticket
from core.utils import generate_simple_csv
from utils.views import MultiSerializerViewSetMixin
from weasyprint import (
    CSS,
    HTML,
)
from weasyprint.text.fonts import FontConfiguration


@extend_schema_view(
    list=extend_schema(
        summary="List all tickets",
        description="Return a list of all tickets in the system.",
        tags=["Tickets"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a Ticket",
        description="Get details of a specific ticket",
        tags=["Tickets"],
    ),
    create=extend_schema(
        summary="Create a Ticket",
        description="Create a ticket",
        tags=["Tickets"],
    ),
    update=extend_schema(
        summary="Update a Ticket",
        description="Update details of a specific ticket",
        tags=["Tickets"],
    ),
    partial_update=extend_schema(
        summary="Partial update a Ticket",
        description="Update details of a specific ticket",
        tags=["Tickets"],
    ),
    destroy=extend_schema(
        summary="Delete a Ticket",
        description="Delete a specific ticket",
        tags=["Tickets"],
    ),
)
class TicketViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = Ticket.objects.all().order_by("id")
    serializer_class = TicketSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)
    filterset_class = TicketFilter
    parser_classes = (JSONParser,)
    serializer_action_classes = {
        "create": CreateTicketSerializer,
    }

    @extend_schema(
        summary="Export ticket information in csv",
        description="Export ticket information in csv",
        tags=["Tickets"],
        parameters=[
            OpenApiParameter(
                name="service",
                type=OpenApiTypes.NUMBER,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="quantity",
                type=OpenApiTypes.NUMBER,
                location=OpenApiParameter.QUERY,
            ),
            OpenApiParameter(
                name="ticket_source",
                type=OpenApiTypes.STR,
                location=OpenApiParameter.QUERY,
                enum=Ticket.sources(),
            ),
            OpenApiParameter(
                name="ticket_type",
                type=OpenApiTypes.STR,
                location=OpenApiParameter.QUERY,
                enum=Ticket.types(),
            ),
        ],
        responses={("200", "text/csv"): OpenApiTypes.STR},
    )
    @action(
        detail=False,
        methods=["get"],
        url_path="export",
        url_name="export_ticket_info",
    )
    def export_buses_to_csv(self, request):
        data = {}
        if "service" in request.query_params:
            data["service"] = request.query_params.get("service")
        if "quantity" in request.query_params:
            data["quantity"] = request.query_params.get("quantity")
        if "ticket_source" in request.query_params:
            data["ticket_source"] = request.query_params.get("ticket_source")
        if "ticket_type" in request.query_params:
            data["ticket_type"] = request.query_params.get("ticket_type")
        queryset = self.get_queryset()
        queryset = queryset.filter(**data)
        return generate_simple_csv(
            (
                "Fuente de compra del boleto",
                "Tipo de boleto",
                "Asiento",
                "Cantidad",
                "Precio",
                "Nombre",
                "Apellido",
                "Tipo de pasajero",
                "Género",
                "Fecha de nacimiento",
                "Número de documento",
                "Nacionalidad",
                "Correo electrónico",
                "Teléfono",
            ),
            "tickets",
            queryset,
        )

    @extend_schema(
        summary="Export pdf for ticket",
        description="Export ticket information in pdf",
        tags=["Tickets"],
        responses={("200", "application/pdf"): OpenApiTypes.BINARY},
    )
    @action(
        detail=True,
        methods=["get"],
        url_path="export-pdf",
        url_name="export_ticket_pdf",
    )
    def export_pdf(self, request, pk=None):
        ticket = self.get_object()
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
        html = render_to_string("email/compra_ticket_pdf.html", ticket.get_data_context())
        response = HttpResponse(content_type="application/pdf")
        response["Content-Disposition"] = f"inline; ticket_{ticket.id}.pdf"
        HTML(string=html).write_pdf(response, stylesheets=[css], font_config=font_config)
        return response

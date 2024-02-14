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
from rest_framework.response import Response

from api.core.filters import SaleFilter
from api.core.serializers import (
    CreateSaleSerializer,
    SaleRetrieveSerializer,
    SaleSerializer,
)
from core.models import (
    Sale,
    Service,
)
from utils.views import MultiSerializerViewSetMixin
from weasyprint import (
    CSS,
    HTML,
)
from weasyprint.text.fonts import FontConfiguration


@extend_schema_view(
    list=extend_schema(
        summary="List all Sales",
        description="Return a list of all sales in the system.",
        tags=["Sales"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a Sale",
        description="Get details of a specific Sale",
        tags=["Sales"],
    ),
    create=extend_schema(
        summary="Create a Sale",
        description="Create a Sale",
        tags=["Sales"],
    ),
    update=extend_schema(
        summary="Update a Sale",
        description="Update details of a specific Sale",
        tags=["Sales"],
    ),
    partial_update=extend_schema(
        summary="Partial update a Sale",
        description="Update details of a specific Sale",
        tags=["Sales"],
    ),
    destroy=extend_schema(
        summary="Delete a Sale",
        description="Delete a specific Sale",
        tags=["Sales"],
    ),
)
class SaleViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = Sale.objects.all().prefetch_related("tickets").order_by("id")
    serializer_class = SaleSerializer
    filterset_class = SaleFilter
    ordering_fields = ["created", "id"]
    permission_classes = (IsAuthenticatedOrReadOnly,)
    parser_classes = (JSONParser,)
    serializer_action_classes = {
        "create": CreateSaleSerializer,
        "retrieve": SaleRetrieveSerializer,
    }

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        first_ticket = instance.tickets.first()
        instance.service = Service.objects.filter(id=first_ticket.service_id).first()
        serializer = self.get_serializer(instance)

        return Response(serializer.data)

    @extend_schema(
        summary="Export a simplified pdf for all tickets ",
        description="Export a simplified information in pdf",
        tags=["Sales"],
        responses={("200", "application/pdf"): OpenApiTypes.BINARY},
        parameters=[
            OpenApiParameter(
                name="thermal",
                type=OpenApiTypes.BOOL,
                location=OpenApiParameter.QUERY,
            ),
        ],
    )
    @action(
        detail=True,
        methods=["get"],
        url_path="export-pdf",
        url_name="export_pdf",
    )
    def export_pdf(self, request, pk=None):
        thermal = request.query_params.get("thermal")
        sale = self.get_object()
        font_config = FontConfiguration()
        # TODO: if context is empty return a 400 error

        if thermal:
            page_length = 297

            css_string = f"""
            @page {{
                margin: 0;
                size: 70mm {page_length}mm;
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

            html = render_to_string("email/mini-pdf.html", sale.get_data_context())
            response = HttpResponse(content_type="application/pdf")
            response["Content-Disposition"] = f"inline; sale_{sale.id}.pdf"
            HTML(string=html).write_pdf(response, stylesheets=[css], font_config=font_config)
            return response

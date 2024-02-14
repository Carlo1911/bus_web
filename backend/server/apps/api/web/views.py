from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import viewsets
from rest_framework.parsers import JSONParser
from rest_framework.permissions import AllowAny

from web.models import ContactWeb, Newsletter

from .serializers import CreateContactWebSerializer, NewsletterSerializer


@extend_schema_view(
    create=extend_schema(
        summary="Create a new contact from the form web",
        description="Create a new contact from the form web to solve some doubts",
        tags=["Web"],
    )
)
class ContactWebViewSet(viewsets.GenericViewSet, viewsets.mixins.CreateModelMixin):
    queryset = ContactWeb.objects.all()
    serializer_class = CreateContactWebSerializer
    permission_classes = (AllowAny,)
    parser_classes = (JSONParser,)


@extend_schema_view(
    create=extend_schema(
        summary="Add email to newsletter list",
        description="Subscribe email to newsletter list",
        tags=["Newsletter"],
    ),
    destroy=extend_schema(
        summary="Delete email from newsletter list",
        description="Unsubscribe email from newsletter",
        tags=["Newsletter"],
    )
)
class NewsletterViewSet(viewsets.GenericViewSet, viewsets.mixins.CreateModelMixin, viewsets.mixins.DestroyModelMixin):
    queryset = Newsletter.objects.all()
    serializer_class = NewsletterSerializer
    permission_classes = (AllowAny,)
    parser_classes = (JSONParser,)

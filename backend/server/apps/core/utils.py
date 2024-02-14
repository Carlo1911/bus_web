import csv
import enum
import itertools
import re
from typing import Any

from django.db.models import QuerySet
from django.http import (
    HttpResponse,
    StreamingHttpResponse,
)
from django.utils import timezone
from drf_spectacular.generators import SchemaGenerator
from rest_framework import serializers
from rest_framework.request import Request


class Echo:
    """An object that implements just the write method of the file-like
    interface.
    """

    def write(self, value):
        """Write the value by returning it, instead of storing in a buffer."""
        return value


def generate_simple_csv(
        headers: tuple, file_name: str, queryset: QuerySet
) -> HttpResponse:
    formatted_name = (
        f'{file_name}_{timezone.now().date().strftime("%Y%m%d%H%M%s")}.csv"'
    )
    response = HttpResponse(
        content_type='text/csv',
        headers={
            'Content-Disposition': f'attachment; \
                filename="{formatted_name}'
        },
    )
    writer = csv.writer(response)
    writer.writerow(headers)
    for element in queryset:
        writer.writerow(element.tuple_fields)
    return response


def gerenate_csv_from_dict(
        headers: tuple, file_name: str, data: list[dict[str, Any]]
) -> HttpResponse:
    formatted_name = (
        f'{file_name}_{timezone.now().date().strftime("%Y%m%d%H%M%s")}.csv"'
    )
    response = HttpResponse(
        content_type='text/csv',
        headers={
            'Content-Disposition': f'attachment; \
                    filename="{formatted_name}'
        },
    )
    writer = csv.writer(response)
    writer.writerow(headers)
    for element in data:
        writer.writerow(element.values())

    return response


def generate_csv(
        headers: tuple, file_name: str, queryset: QuerySet
) -> StreamingHttpResponse:
    """Generate a csv file from a queryset. It's required to implement a
    property in element called: tuple_fields that contains the values to
    show in the csv by row.

    Args:
        headers (tuple): hearders of the csv file.
        file_name (str): name of the file.
        queryset (QuerySet): queryset to generate the csv file.

    Returns:
        StreamingHttpResponse: Excel file with report
    """

    def iter_items(queryset: QuerySet, pseudo_buffer: Echo, headers: tuple):
        writer = csv.writer(pseudo_buffer, delimiter=';', quotechar='"')
        yield writer.writerow(headers)

        for element in queryset:
            yield writer.writerow(element.tuple_fields)

    response = StreamingHttpResponse(
        streaming_content=(iter_items(queryset, Echo(), headers)),
        content_type='text/csv',
    )

    response[
        'Content-Disposition'
    ] = f'attachment; \
        filename="{file_name}_{timezone.now().date().strftime("%Y%m%d%H%M%s")}.csv"'
    return response


def first_or_default(predicate, iterable):
    for element in iterable:
        if predicate(element):
            return element
    return None


def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()


def string_has_number(string):
    return any(char.isdigit() for char in string)


def add_enum_varnames_to_openapi_document(
        model: Any, result: dict, schema_name: str
) -> None:
    for attr, value in vars(model).items():
        if isinstance(value, enum.EnumMeta):
            enum_varsnames = [
                enum_name.replace(' ', '')
                if string_has_number(enum_name)
                else enum_name.replace(' ', '_')
                for (enum_value, enum_name) in value.choices
            ]

            if schema_name in result['components']['schemas']:
                model_name = model.__name__
                selected_schema = result['components']['schemas'][schema_name]
                property_name = camel_to_snake(attr)

                if property_name in selected_schema['properties']:
                    schema_property = selected_schema['properties'][property_name]
                    schema_property['x-enum-varnames'] = enum_varsnames

                property_name = attr.removesuffix(model_name)
                if property_name in selected_schema['properties']:
                    schema_property = selected_schema['properties'][property_name]
                    schema_property['x-enum-varnames'] = enum_varsnames


def enum_hook(
        result: dict, generator: SchemaGenerator, request: Request, public: bool
) -> dict:
    total_serializers = [
        callback.cls.serializer_class
        for (path, path_regex, method, callback) in generator.endpoints
        if hasattr(callback.cls, 'serializer_class')
    ]
    serializer_action_classes = [
        callback.cls.serializer_action_classes
        for (path, path_regex, method, callback) in generator.endpoints
        if hasattr(callback.cls, 'serializer_action_classes')
    ]
    action_classes_models = list(
        set(
            itertools.chain.from_iterable(
                [[*k.values()] for k in serializer_action_classes]
            )
        )
    )
    total_models = list(
        {
            to_check_model.Meta.model
            for to_check_model in total_serializers
            if hasattr(to_check_model, 'Meta')
        }
    )

    unique_models = action_classes_models + total_models

    for model in unique_models:
        if isinstance(model, serializers.SerializerMetaclass):
            schema_name = model.__name__
            schema_name = schema_name.replace('Serializer', '')

            if hasattr(model, 'Meta'):
                schema_model = model.Meta.model if hasattr(model, 'Meta') else model
                add_enum_varnames_to_openapi_document(schema_model, result, schema_name)
        else:
            schema_name = model.__name__
            add_enum_varnames_to_openapi_document(model, result, schema_name)

    total_patched = [
        key
        for key, val in result['components']['schemas'].items()
        if key.startswith('Patched') and not key.endswith('Polymorphic')
    ]

    for patched_schema in total_patched:
        if patched_schema in result['components']['schemas']:
            schema = patched_schema.replace('Patched', '')
            if schema in result['components']['schemas']:
                result['components']['schemas'][patched_schema]['properties'] = result[
                    'components'
                ]['schemas'][schema]['properties']

    return result

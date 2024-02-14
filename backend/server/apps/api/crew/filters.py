from django_filters import rest_framework as filters

from crew.models import Personal


class PersonalFilter(filters.FilterSet):
    ids = filters.CharFilter(method="multiple_personal")
    document = filters.CharFilter(method="document_personal")
    email = filters.CharFilter(method="email_personal")
    name = filters.CharFilter(method="name_personal")
    last_name = filters.CharFilter(method="last_name_personal")

    def last_name_personal(self, queryset, name, value):
        return queryset.filter(
            **{
                "user__last_name__icontains": value,
            }
        )

    def name_personal(self, queryset, name, value):
        return queryset.filter(
            **{
                "user__first_name__icontains": value,
            }
        )

    def multiple_personal(self, queryset, name, value):
        if "," in value:
            value = value.split(",")
        return queryset.filter(
            **{
                "user_id__in": value,
            }
        )

    def document_personal(self, queryset, name, value):
        return queryset.filter(
            **{
                "user__document_number": value,
            }
        )

    def email_personal(self, queryset, name, value):
        return queryset.filter(
            **{
                "user__email": value,
            }
        )

    class Meta:
        model = Personal
        fields = [
            "name",
            "last_name",
            "email",
            "document",
            "status",
            "positions",
            "contract_type",
            "motives",
            "ids",
        ]

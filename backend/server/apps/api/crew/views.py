from drf_spectacular.utils import (
    extend_schema,
    extend_schema_view,
)
from rest_framework import (
    status,
    viewsets,
)
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.response import Response

from crew.models import (
    Commission,
    Motive,
    Personal,
    Position,
)
from utils.views import MultiSerializerViewSetMixin

from .filters import PersonalFilter
from .serializers import (
    AssignPermissionSerializer,
    CheckUserSerializer,
    CommissionSerializer,
    CreatePersonalSerializer,
    MassiveCommissionPositionSerializer,
    MotiveSerializer,
    PersonalSerializer,
    PositionSerializer,
)


@extend_schema_view(
    list=extend_schema(
        summary="List all workers",
        description="Return a list of all workers in the system.",
        tags=["Personal"],
    ),
    retrieve=extend_schema(
        summary="Retrieve worker",
        description="Get details of a specific worker",
        tags=["Personal"],
    ),
    create=extend_schema(summary="Create a worker", description="Create a worker", tags=["Personal"]),
    update=extend_schema(
        summary="Update a worker",
        description="Update details of a specific worker",
        tags=["Personal"],
    ),
    partial_update=extend_schema(
        summary="Partial update a worker",
        description="Update details of a specific worker",
        tags=["Personal"],
    ),
    destroy=extend_schema(
        summary="Delete a worker",
        description="Delete a specific worker",
        tags=["Personal"],
    ),
)
class PersonalViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = Personal.objects.all().order_by("user_id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = PersonalSerializer
    ordering_fields = ["user_id", "user__username", "user__email"]
    filterset_class = PersonalFilter
    search_fields = ["user__username", "user__email"]
    serializer_action_classes = {
        "create": CreatePersonalSerializer,
        "partial_update": CreatePersonalSerializer,
        "update": CreatePersonalSerializer,
        "assign_permission": AssignPermissionSerializer,
        "check_user": CheckUserSerializer,
    }

    @extend_schema(
        summary="Assign permissions",
        description="Assign permissions to a worker",
        tags=["Personal"],
    )
    @action(
        detail=True,
        methods=["post"],
        serializer_class=AssignPermissionSerializer,
        url_path="assign-permission",
        url_name="personal_permissions",
    )
    def assign_permission(self, request, pk=None):
        personal = self.get_object()
        permissions = request.data.get("permissions_id")
        if "," in permissions:
            permissions = permissions.split(",")
        serializer = AssignPermissionSerializer(data={"permissions_id": permissions})
        if serializer.is_valid():
            personal.user.add_permissions(serializer.validated_data.get("permissions_id"))
            return Response({"status": "Permissions set"}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @extend_schema(
        summary="Check personal exists",
        description="Verify if a personal exists",
        tags=["Personal"],
    )
    @action(
        detail=False,
        methods=["get"],
        serializer_class=CheckUserSerializer,
        url_path="validate",
        url_name="personal_validation",
    )
    def check_user(self, request):
        document_number = request.GET.get("document_number")
        email = request.GET.get("email")
        serializer = self.get_serializer(data={"document_number": document_number, "email": email})
        if serializer.is_valid():
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    # TODO: Action to change password (maybe using forget password)


@extend_schema_view(
    list=extend_schema(
        summary="List all motives",
        description="Return a list of all motives in the system.",
        tags=["Motives"],
    ),
    retrieve=extend_schema(
        summary="Retrieve motive",
        description="Get details of a specific motive",
        tags=["Motives"],
    ),
    create=extend_schema(summary="Create a motive", description="Create a motive", tags=["Motives"]),
    update=extend_schema(
        summary="Update a motive",
        description="Update details of a specific motive",
        tags=["Motives"],
    ),
    partial_update=extend_schema(
        summary="Partial update a motive",
        description="Update details of a specific motive",
        tags=["Motives"],
    ),
    destroy=extend_schema(
        summary="Delete a motive",
        description="Delete a specific motive",
        tags=["Motives"],
    ),
)
class MotiveViewSet(viewsets.ModelViewSet):
    queryset = Motive.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = MotiveSerializer


@extend_schema_view(
    list=extend_schema(
        summary="List all positions",
        description="Return a list of all positions for the personal in the system.",
        tags=["Positions"],
    ),
    retrieve=extend_schema(
        summary="Retrieve position",
        description="Get details of a specific position",
        tags=["Positions"],
    ),
    create=extend_schema(summary="Create a position", description="Create a position", tags=["Positions"]),
    update=extend_schema(
        summary="Update a position",
        description="Update details of a specific position",
        tags=["Positions"],
    ),
    partial_update=extend_schema(
        summary="Partial update a position",
        description="Update details of a specific position",
        tags=["Positions"],
    ),
    destroy=extend_schema(
        summary="Delete a position",
        description="Delete a specific position",
        tags=["Positions"],
    ),
)
class PositionViewSet(viewsets.ModelViewSet):
    queryset = Position.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = PositionSerializer


@extend_schema_view(
    list=extend_schema(
        summary="List all commissions",
        description="Return a list of all commissions for the personal in the system.",
        tags=["Commissions"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a commission",
        description="Get details of a specific commission",
        tags=["Commissions"],
    ),
    create=extend_schema(
        summary="Create a commission",
        description="Create a commission",
        tags=["Commissions"],
    ),
    update=extend_schema(
        summary="Update a commission",
        description="Update details of a specific commission",
        tags=["Commissions"],
    ),
    partial_update=extend_schema(
        summary="Partial update a commission",
        description="Update details of a specific commission",
        tags=["Commissions"],
    ),
    destroy=extend_schema(
        summary="Delete a commission",
        description="Delete a specific commission",
        tags=["Commissions"],
    ),
)
class CommissionViewSet(MultiSerializerViewSetMixin, viewsets.ModelViewSet):
    queryset = Commission.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = CommissionSerializer
    ordering_fields = ["date_from", "date_to"]
    filterset_fields = ["date_from", "date_to", "status", "personal"]
    search_fields = ["user__username", "user__email"]
    serializer_action_classes = {
        "massive_comissions": MassiveCommissionPositionSerializer,
    }

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context.update({"request": self.request})
        return context

    @extend_schema(
        summary="Update multiple comissions by file",
        description="Update multiple comissions by file",
        tags=["Commissions"],
    )
    @action(
        detail=False,
        methods=["post"],
        serializer_class=MassiveCommissionPositionSerializer,
        url_path="upload-file",
        url_name="upload_comission_file",
    )
    def massive_comissions(self, request, pk=None):
        # Add route to upload file
        # TODO: Check if the file is a csv
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            serializer.process_file()
            return Response({"status": "Archivo procesado"}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

import jwt
from django.conf import settings
from django.contrib.auth.models import Permission
from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import (
    OpenApiParameter,
    extend_schema,
    extend_schema_view,
)
from rest_framework import (
    status,
    viewsets,
)
from rest_framework.decorators import action
from rest_framework.mixins import (
    ListModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin,
)
from rest_framework.permissions import (
    AllowAny,
    IsAuthenticated,
    IsAuthenticatedOrReadOnly,
)
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken

from users.models import (
    CustomUser,
    Nationality,
    Role,
    ResetPassword,
)
from utils.mail import EmailSender
from utils.views import MultiSerializerViewSetMixin

from .serializers import (
    CreateCustomUserSerializer,
    CustomUserSerializer,
    NationalitySerializer,
    PermissionSerializer,
    RoleSerializer,
    ResetPasswordSerializer,
    UpdatePasswordSerializer,
)
from users.tasks import send_email_reset_password, send_email_password_update_success


class CustomUserViewSet(
    MultiSerializerViewSetMixin,
    viewsets.GenericViewSet,
    RetrieveModelMixin,
    UpdateModelMixin,
):
    queryset = CustomUser.objects.all().order_by("id")
    permission_classes = (IsAuthenticated,)
    serializer_class = CustomUserSerializer
    serializer_action_classes = {
        "creation": CreateCustomUserSerializer,
        "partial_update": CreateCustomUserSerializer,
        "update": CreateCustomUserSerializer,
    }

    @action(
        detail=False,
        methods=["get"],
        name="Información de usuario",
        url_path="me",
        url_name="personal_information",
    )
    def user_information(self, request):
        serializer = self.get_serializer(self.request.user)
        return Response(serializer.data)

    @extend_schema(
        summary="Verify email of new user",
        description="Service to check if email from new user is valid",
        parameters=[
            OpenApiParameter(
                name="token",
                type=OpenApiTypes.STR,
                location=OpenApiParameter.QUERY,
            )
        ],
    )
    @action(
        detail=False,
        methods=["get"],
        name="Verificar email de usuario",
        url_path="verify-email",
        url_name="verify_email",
        permission_classes=[AllowAny],
    )
    def verify_email(self, request):
        token = request.GET.get("token")
        try:
            payload = jwt.decode(token, settings.SECRET_KEY, algorithms=["HS256"])
            user = CustomUser.objects.get(pk=payload["user_id"])
            user.is_active = True
            user.save()
            return Response({"message": "Email verificado correctamente"}, status=status.HTTP_200_OK)
        except jwt.ExpiredSignatureError:
            message = {"message": "El token ha expirado"}
        except jwt.InvalidTokenError:
            message = {"message": "El token no es válido"}
        except CustomUser.DoesNotExist:
            message = {"message": "El usuario no existe"}

        return Response(message, status=status.HTTP_400_BAD_REQUEST)

    @action(
        detail=False,
        methods=["post"],
        name="Creación de usuario",
        url_path="create",
        url_name="create_user",
        permission_classes=[AllowAny],
    )
    def creation(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()

        token = RefreshToken.for_user(user).access_token
        url = f"{settings.SERVER_URL}/api/v1/users/users/verify-email?token={token}"

        EmailSender.send_email(
            subject="Verificación de email",
            message=f"Para verificar su correo debe ingresar al enlace: {url}",
            receiver=user.email,
        )
        return Response(serializer.data, status=status.HTTP_201_CREATED)


@extend_schema_view(
    list=extend_schema(
        summary="List all permissions",
        description="Return a list of all permissions in the system.",
        tags=["Permissions"],
    ),
    retrieve=extend_schema(
        summary="Retrieve permission",
        description="Get details of a specific permission",
        tags=["Permissions"],
    ),
)
class PermissionViewSet(viewsets.GenericViewSet, RetrieveModelMixin, ListModelMixin):
    queryset = Permission.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = PermissionSerializer


@extend_schema_view(
    list=extend_schema(
        summary="List all roles",
        description="Return a list of all roles in the system.",
        tags=["Roles"],
    ),
    retrieve=extend_schema(
        summary="Retrieve role",
        description="Get details of a specific role",
        tags=["Roles"],
    ),
    create=extend_schema(summary="Create a role", description="Create a role", tags=["Roles"]),
    update=extend_schema(
        summary="Update a role",
        description="Update details of a specific role",
        tags=["Roles"],
    ),
    partial_update=extend_schema(
        summary="Partial update a role",
        description="Update details of a specific role",
        tags=["Roles"],
    ),
    destroy=extend_schema(
        summary="Delete a role",
        description="Delete a specific role",
        tags=["Roles"],
    ),
)
class RoleViewSet(viewsets.ModelViewSet):
    queryset = Role.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = RoleSerializer


@extend_schema_view(
    list=extend_schema(
        summary="List all nationalities",
        description="Return a list of all nationalities in the system.",
        tags=["Nationalities"],
    ),
    retrieve=extend_schema(
        summary="Retrieve a nationality",
        description="Get details of a specific nationality",
        tags=["Nationalities"],
    ),
    create=extend_schema(
        summary="Create a nationality",
        description="Create a nationality",
        tags=["Nationalities"],
    ),
    update=extend_schema(
        summary="Update a nationality",
        description="Update details of a specific nationality",
        tags=["Nationalities"],
    ),
    partial_update=extend_schema(
        summary="Partial update a nationality",
        description="Update details of a specific nationality",
        tags=["Nationalities"],
    ),
    destroy=extend_schema(
        summary="Delete a nationality",
        description="Delete a specific nationality",
        tags=["Nationalities"],
    ),
)
class NationalityViewSet(viewsets.ModelViewSet):
    queryset = Nationality.objects.all().order_by("id")
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = NationalitySerializer


class ResetPasswordViewSet(
    MultiSerializerViewSetMixin,
    viewsets.GenericViewSet,
):
    queryset = ResetPassword.objects.all()
    serializer_class = ResetPasswordSerializer
    serializer_action_classes = {
        "reset_password": ResetPasswordSerializer,
        "update_password": UpdatePasswordSerializer,
    }

    @action(
        detail=False,
        methods=["post"],
        name="Generar reinicio de contraseña",
        url_path="create",
        url_name="reset_password",
        permission_classes=[AllowAny],
    )
    def reset_password(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        reset_password = serializer.save()
        send_email_reset_password.delay(reset_password.pk)
        return Response('Se enviará un correo, con un enlace para que reinicie su contraseña',
                        status=status.HTTP_201_CREATED)

    @action(
        detail=False,
        methods=["post"],
        name="Actualizar contraseña",
        url_path="update",
        url_name="update_password",
        permission_classes=[AllowAny],
    )
    def update_password(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        reset_password = serializer.save()
        send_email_password_update_success.delay(reset_password.pk)
        return Response('Su contraseña se ha actualizado con éxito',
                        status=status.HTTP_201_CREATED)

from datetime import datetime
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import extend_schema_field
from rest_framework import serializers

from users.models import (
    CustomUser,
    Nationality,
    Role,
    ResetPassword,
)


class PermissionSerializer(serializers.ModelSerializer):
    app_name = serializers.SerializerMethodField(
        label="Nombre de app", read_only=True, style={"placeholder": "Nombre de App"}
    )
    model_name = serializers.SerializerMethodField(
        label="Nombre de modelo",
        read_only=True,
        style={"placeholder": "Nombre de modelo"},
    )

    @extend_schema_field(OpenApiTypes.STR)
    def get_app_name(self, obj):
        content = ContentType.objects.get(pk=obj.content_type_id)
        return content.app_label.capitalize()

    @extend_schema_field(OpenApiTypes.STR)
    def get_model_name(self, obj):
        content = ContentType.objects.get(pk=obj.content_type_id)
        return content.name.capitalize()

    class Meta:
        model = Permission
        fields = "__all__"


class RoleSerializer(serializers.ModelSerializer):
    permissions = PermissionSerializer(many=True)

    class Meta:
        model = Role
        fields = "__all__"


class NationalitySerializer(serializers.ModelSerializer):
    class Meta:
        model = Nationality
        fields = "__all__"


class CustomUserSerializer(serializers.ModelSerializer):
    user_permissions = PermissionSerializer(many=True, read_only=True)
    groups = RoleSerializer(many=True, read_only=True)
    branch_name = serializers.SerializerMethodField()
    branch_id = serializers.SerializerMethodField()

    @extend_schema_field(OpenApiTypes.STR)
    def get_branch_name(self, obj):
        if getattr(obj, "personal", None):
            return obj.personal.branch.name if getattr(obj.personal, "branch") else ""
        return ""

    @extend_schema_field(OpenApiTypes.STR)
    def get_branch_id(self, obj):
        if getattr(obj, "personal", None):
            return obj.personal.branch.id if getattr(obj.personal, "branch") else ""
        return ""

    class Meta:
        model = CustomUser
        exclude = ("password",)


class CreateCustomUserWithoutPasswordSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    username = serializers.CharField()

    def create(self, validated_data):
        validated_data["is_active"] = False
        user, _ = CustomUser.objects.update_or_create(
            username=validated_data.get("validated_data"), defaults=validated_data
        )
        return user

    def update(self, instance: CustomUser, validated_data: dict) -> CustomUser:
        instance.username = validated_data.get("username") or instance.username
        instance.first_name = validated_data.get("first_name") or instance.first_name
        instance.last_name = validated_data.get("last_name") or instance.last_name
        instance.email = validated_data.get("email") or instance.email
        instance.maternal_last_name = validated_data.get("maternal_last_name") or instance.maternal_last_name
        instance.document_number = validated_data.get("document_number") or instance.document_number
        instance.cellphone = validated_data.get("cellphone") or instance.cellphone
        instance.sex = validated_data.get("sex") or instance.sex
        instance.nationality = validated_data.get("nationality") or instance.nationality
        instance.date_of_birth = validated_data.get("date_of_birth") or instance.date_of_birth
        instance.document_type = validated_data.get("document_type") or instance.document_type
        instance.save()
        return instance

    class Meta:
        model = CustomUser
        fields = (
            "id",
            "username",
            "first_name",
            "last_name",
            "email",
            "maternal_last_name",
            "document_number",
            "document_type",
            "cellphone",
            "sex",
            "nationality",
            "date_of_birth",
        )
        read_only_fields = ["id"]


class CreateCustomUserSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    password = serializers.CharField(write_only=True)
    password2 = serializers.CharField(write_only=True)

    def validate(self, attrs):
        if attrs.get("password") != attrs.get("password2"):
            raise serializers.ValidationError({"password": "Las contraseñas no coinciden"})
        return attrs

    def create(self, validated_data):
        validated_data.pop("password2")
        validated_data["is_active"] = False
        return CustomUser.objects.create_user(**validated_data)

    def update(self, instance: CustomUser, validated_data: dict) -> CustomUser:
        instance.username = validated_data.get("username") or instance.username
        instance.first_name = validated_data.get("first_name") or instance.first_name
        instance.last_name = validated_data.get("last_name") or instance.last_name
        instance.email = validated_data.get("email") or instance.email
        instance.maternal_last_name = validated_data.get("maternal_last_name") or instance.maternal_last_name
        instance.document_number = validated_data.get("document_number") or instance.document_number
        instance.cellphone = validated_data.get("cellphone") or instance.cellphone
        instance.sex = validated_data.get("sex") or instance.sex
        instance.nationality = validated_data.get("nationality") or instance.nationality
        instance.date_of_birth = validated_data.get("date_of_birth") or instance.date_of_birth
        instance.document_type = validated_data.get("document_type") or instance.document_type
        instance.save()

        return instance

    class Meta:
        model = CustomUser
        fields = (
            "id",
            "username",
            "password",
            "password2",
            "first_name",
            "last_name",
            "email",
            "maternal_last_name",
            "document_number",
            "document_type",
            "cellphone",
            "sex",
            "nationality",
            "date_of_birth",
        )
        read_only_fields = ["id"]


class BasicCustomUserSerializer(serializers.ModelSerializer):

    class Meta:
        model = CustomUser
        fields = ['pk', 'first_name', 'last_name', 'username', 'document_number', 'image', 'email', 'work_phone']


class ResetPasswordSerializer(serializers.Serializer):
    username = serializers.CharField(write_only=True)

    def validate_username(self, value):
        try:
            username = CustomUser.objects.get(username=value)
        except CustomUser.DoesNotExist:
            raise serializers.ValidationError(f'No existe el usuario {value}')
        return username

    def create(self, validated_data):
        username = validated_data.pop('username')
        reset_password = ResetPassword.objects.create(user_id=username.pk)
        return reset_password

    def update(self, instance, validated_data):
        pass


class UpdatePasswordSerializer(serializers.Serializer):
    pk = serializers.IntegerField(write_only=True, required=True)
    code = serializers.CharField(write_only=True, required=True)
    password = serializers.CharField(write_only=True, required=True, min_length=8, max_length=30)
    password2 = serializers.CharField(write_only=True, required=True, min_length=8, max_length=30)

    def validate(self, data):
        if data.get("password") != data.get("password2"):
            raise serializers.ValidationError({"password": "Las contraseñas no coinciden"})
        try:
            object = ResetPassword.objects.get(pk=data.get('pk'))
        except ResetPassword.DoesNotExist:
            raise serializers.ValidationError(f"No existe un pk recuperación de contraseña {data.get('pk')} válido")
        if object.code != data.get('code'):
            raise serializers.ValidationError(f"Code inválido")
        if object.used is not None:
            raise serializers.ValidationError(f"Contraseña cambiada previamente, por favor genere una nueva solicitud de cambio de contraseña")
        return data

    def create(self, validated_data):
        object = ResetPassword.objects.select_related('user').get(pk=validated_data.get('pk'))
        user = object.user
        user.set_password(validated_data.get('password'))
        object.used = datetime.now()
        object.save()
        user.save()
        return object

    def update(self, instance, validated_data):
        pass


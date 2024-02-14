from rest_framework import serializers

from web.models import ContactWeb, Newsletter


class CreateContactWebSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    created_at = serializers.DateTimeField(required=False)

    def create(self, validated_data):
        contact = ContactWeb.objects.create(**validated_data)
        # send email
        contact.send_email()
        return contact

    class Meta:
        model = ContactWeb
        fields = "__all__"


class NewsletterSerializer(serializers.ModelSerializer):

    class Meta:
        model = Newsletter
        fields = ['email']

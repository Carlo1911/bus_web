from abc import abstractmethod
from decimal import Decimal
from uuid import uuid4

from django.conf import settings
from rest_framework import serializers
from transbank.webpay.webpay_plus.request import TransactionCreateRequest

from api.payment_method.utils import create_hash_id


class TransbankCreateResponseSerializer(serializers.Serializer):
    token = serializers.CharField()
    url = serializers.CharField()
    buy_order = serializers.CharField()
    sale_id = serializers.IntegerField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class TransbankCommitRequestSerializer(serializers.Serializer):
    # buy_order = serializers.CharField()
    token_ws = serializers.CharField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class CardDetailSerializer(serializers.Serializer):
    card_number = serializers.CharField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class TransbankConfirmResponseSerializer(serializers.Serializer):
    vci = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    amount = serializers.FloatField()
    status = serializers.CharField()
    buy_order = serializers.CharField()
    session_id = serializers.CharField()
    card_detail = CardDetailSerializer()
    accounting_date = serializers.CharField()
    transaction_date = serializers.CharField()
    authorization_code = serializers.CharField()
    payment_type_code = serializers.CharField()
    response_code = serializers.IntegerField()
    installments_number = serializers.IntegerField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass

class TransbankStatusRequestSerializer(serializers.Serializer):
    buy_order = serializers.CharField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass

class TransbankStatusResponseSerializer(serializers.Serializer):
    status = serializers.CharField()
    buy_order = serializers.CharField()
    details = TransbankConfirmResponseSerializer(allow_null=True, required=False)

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass

class TransbankRefundSerializer(serializers.Serializer):
    buy_order = serializers.CharField()
    token = serializers.CharField()
    amount = serializers.IntegerField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class TransbankRefundResponseSerializer(serializers.Serializer):
    type = serializers.CharField()
    balance = serializers.FloatField(required=False, allow_null=True)
    authorization_code = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    response_code = serializers.IntegerField(required=False, allow_null=True)
    authorization_date = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    nullified_amount = serializers.FloatField(required=False, allow_null=True)

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass


class PaymentUtils:
    @staticmethod
    def create_transaction_request(amount: Decimal) -> TransactionCreateRequest:
        return TransactionCreateRequest(
            buy_order=create_hash_id(),
            return_url=settings.TRANSBANK_RETURN_URL,
            amount=float(amount),
            session_id=uuid4().hex,
        )

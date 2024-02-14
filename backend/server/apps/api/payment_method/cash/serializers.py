from abc import abstractmethod
from rest_framework import serializers


class CashCreateResponseSerializer(serializers.Serializer):
    buy_order = serializers.CharField()
    sale_id = serializers.IntegerField()

    @abstractmethod
    def create(self, validated_data):
        pass

    @abstractmethod
    def update(self, instance, validated_data):
        pass
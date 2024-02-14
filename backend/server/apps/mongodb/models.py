from datetime import datetime

from mongoengine import (
    DateTimeField,
    DecimalField,
    DictField,
    Document,
    StringField,
)


class PaymentIntention(Document):
    buy_order = StringField()
    sale = DictField()
    payment_method_request = DictField()
    payment_method_response = DictField()
    created = DateTimeField(default=datetime.utcnow)

    meta = {
        "collection": "payment-intentions",
        "indexes": [
            "$buy_order"  # Text index
        ]
    }


class PaymentConfirmation(Document):
    buy_order = StringField()
    payment_method = StringField()
    payment_method_request = DictField()
    payment_method_response = DictField()
    created = DateTimeField(default=datetime.utcnow)

    meta = {
        "collection": "payment-confirmation",
        "indexes": [
            "$buy_order"  # Text index
        ]
    }


class Refund(Document):
    buy_order = StringField()
    payment_method = StringField()
    token = StringField()
    amount: DecimalField()
    payment_method_request = DictField()
    payment_method_response = DictField()
    created = DateTimeField(default=datetime.utcnow)

    meta = {
        "collection": "refund",
        "indexes": [
            "$buy_order"  # Text index
        ]
    }

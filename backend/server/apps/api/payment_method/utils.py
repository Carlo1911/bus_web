import hashlib
from uuid import uuid4
from django.contrib.auth.models import (
    AnonymousUser, AbstractBaseUser
)


def create_hash_id():
    hash_sha = hashlib.shake_256(uuid4().hex.encode("utf-8"))
    return hash_sha.hexdigest(13)  # pylint: disable=too-many-function-args

def is_seller_user(user: AbstractBaseUser | AnonymousUser):
    return user.groups.filter(name="Vendedor").exists()
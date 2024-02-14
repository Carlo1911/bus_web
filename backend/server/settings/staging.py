from ._base import *  # noqa

DEBUG = True
WEBSITE_URL = 'http://andimar-qa.lnt.cl'

CELERY_TASK_ALWAYS_EAGER = True
CELERY_TASK_EAGER_PROPAGATES = True

INSTALLED_APPS += ['django_extensions']  # noqa

TEMPLATES[0]['OPTIONS']['debug'] = True  # noqa

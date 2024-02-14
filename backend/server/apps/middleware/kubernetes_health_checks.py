import mongoengine
from django.db import connections
from django.http import (
    HttpRequest,
    HttpResponse,
    HttpResponseServerError,
)
from mongoengine import ConnectionFailure

from server.settings._base import env


class KubernetesHealthChecks:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request: HttpRequest):
        if request.method == 'GET':
            if request.path == '/healthz':
                return self.healthz()
            if request.path == '/readiness':
                return self.readiness()

        return self.get_response(request)

    def healthz(self):
        return HttpResponse('OK')

    def readiness(self):
        try:
            # check mysql connection
            for name in connections:
                cursor = connections[name].cursor()
                cursor.execute('SELECT 1;')
                row = cursor.fetchone()
                if row is None:
                    return HttpResponseServerError('invalid database response')

            MONGODB = env(
                'MONGODB',
                default='mongodb://andimar:andimar123@mongodb:27017/andimar?authSource=admin',
            )

            mongoengine.connect(host=MONGODB)

            return HttpResponse('OK')

        except ConnectionFailure:
            # TODO: metrics
            return HttpResponseServerError('database connection error')
        except Exception:
            return HttpResponseServerError('database connection error')

import unittest
from datetime import datetime
from unittest.mock import patch

from api.core.serializers import ServiceSerializer
from core.models import (
    Route,
    Service,
)
from transportation.models import Bus


class ServiceTestsCases(unittest.TestCase):

    @patch('core.models.Service')
    @patch('core.models.Service.objects')
    def test_update(self, service_mock, service_mock_call):
        """modifying already create service"""

        service_mock_call.filter.return_value = [
            service_mock(code='Test',
                         name='test servicio',
                         status=Service.Status.ACTIVE,
                         datetime_publish=datetime(2022, 1, 1, 18, 43, 47),
                         datetime_from=datetime(2022, 1, 8, 18, 43, 47),
                         datetime_to=datetime(2022, 1, 1, 18, 43, 47),
                         service_type=Service.ServiceType.SHORT,
                         renovation_months=1,
                         route=Route(name='route test'),
                         bus=Bus(name='bus test')
                         ),
            service_mock(code='Test',
                         name='test servicio',
                         status=Service.Status.ACTIVE,
                         datetime_publish=datetime(2022, 1, 2, 18, 43, 47),
                         datetime_from=datetime(2022, 1, 1, 18, 43, 47),
                         datetime_to=datetime(2022, 1, 8, 18, 43, 47),
                         service_type=Service.ServiceType.SHORT,
                         renovation_months=1,
                         route=Route(name='route test'),
                         bus=Bus(name='bus test')
                         ),
            service_mock(code='Test',
                         name='test servicio',
                         status=Service.Status.ACTIVE,
                         datetime_publish=datetime(2022, 1, 3, 18, 43, 47),
                         datetime_from=datetime(2022, 1, 1, 18, 43, 47),
                         datetime_to=datetime(2022, 1, 8, 18, 43, 47),
                         service_type=Service.ServiceType.SHORT,
                         renovation_months=1,
                         route=Route(name='route test'),
                         bus=Bus(name='bus test')
                         ),
            service_mock(code='Test',
                         name='test servicio',
                         status=Service.Status.ACTIVE,
                         datetime_publish=datetime(2022, 1, 4, 18, 43, 47),
                         datetime_from=datetime(2022, 1, 1, 18, 43, 47),
                         datetime_to=datetime(2022, 1, 8, 18, 43, 47),
                         service_type=Service.ServiceType.SHORT,
                         renovation_months=1,
                         route=Route(name='route test'),
                         bus=Bus(name='bus test')
                         )
        ]

        data_available_dates = [
            datetime(2022, 1, 5, 18, 43, 47)  # "2022-01-11T18:43:47.219Z"
        ]
        data = {
            "available_dates": data_available_dates,
            "code": "string",
            "name": "test servicio mod",
            "status": "active",
            "datetime_publish": datetime(2021, 12, 22, 18, 43, 47),
            "datetime_from": datetime(2021, 12, 22, 18, 43, 47),  # "2022-01-11T18:43:47.220Z",
            "datetime_to": datetime(2022, 1, 8, 18, 43, 47),  # "2022-01-29T18:43:47.220Z",
            "service_type": Service.ServiceType.SHORT,
            "renovation_months": 1,
            "route": Route(name='route test mod'),
            "bus": Bus(name='bus test mod'),
            "drivers": [],
            "assistants": []
        }

        service_instance = service_mock(code='Test',
                                        name='test servicio',
                                        status=Service.Status.ACTIVE,
                                        datetime_publish=datetime(2022, 1, 1, 18, 43, 47),
                                        datetime_from=datetime(2022, 1, 1, 18, 43, 47),
                                        datetime_to=datetime(2022, 1, 8, 18, 43, 47),
                                        service_type=Service.ServiceType.SHORT,
                                        renovation_months=1,
                                        route=Route(name='route test'),
                                        bus=Bus(name='bus test')
                                        )

        serializer = ServiceSerializer(data)
        updated_service_instance = serializer.update(service_instance, validated_data=data)

        diff = data['datetime_to'] - data['datetime_from']
        modded_created_service_instances = diff.days + len(data_available_dates)

        # check update instance is saved
        self.assertEqual(service_instance.save.call_count, 1)

        # assert props
        self.assertEqual(service_mock.create.call_count, modded_created_service_instances)
        self.assertEqual(updated_service_instance.datetime_publish, service_instance.datetime_publish)
        self.assertEqual(updated_service_instance.datetime_from, service_instance.datetime_from)
        self.assertEqual(updated_service_instance.datetime_to, service_instance.datetime_to)
        self.assertEqual(updated_service_instance.service_type, service_instance.service_type)

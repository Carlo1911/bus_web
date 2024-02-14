import pytest

from transportation.factories import (
    FloorFactory,
    SeatTypeFactory,
)
from transportation.forms import SeatForm


@pytest.mark.django_db
def test_valid_form(floor: FloorFactory, seat_type: SeatTypeFactory):
    data = {
        'floors': floor.id,
        'seat_kind': seat_type.id,
        'kind': 'seat',
        'position_x': '1',
        'position_y': '1',
        'width': '1',
        'length': '1',
        'code': 'A1',
    }
    form = SeatForm(data)
    assert form.is_valid() is True


def test_empty_form():
    form = SeatForm()
    fields = [
        'kind',
        'seat_kind',
        'position_x',
        'position_y',
        'width',
        'length',
        'floors',
        'code',
    ]
    for field in fields:
        assert field in form.fields

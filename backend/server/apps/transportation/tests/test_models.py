import pytest


@pytest.mark.django_db
def test_benefit_factory(benefit):
    assert benefit.name is not None
    assert benefit.name is benefit.__str__()


@pytest.mark.django_db
def test_bus_factory(bus):
    assert bus.id is not None
    assert bus.code is not None
    assert bus.name is not None
    assert bus.vehicle_type is not None
    assert bus.status is not None
    assert bus.plate is not None
    assert bus.motor_serial_number is not None
    assert bus.chassis_serial_number is not None
    assert bus.kilometers is not None
    assert bus.color is not None
    assert bus.year is not None
    assert bus.insurance_policy is not None
    assert bus.insurance_policy_end_date is not None
    assert bus.brand is not None
    assert bus.model is not None
    assert bus.owner is not None
    assert bus.total_kilometers == 0  # TODO: Fix this
    assert bus.name is bus.__str__()


@pytest.mark.django_db
def test_layout_factory(layout):
    assert layout.name is not None
    assert layout.description is not None
    assert layout.image_by_floor(1) == '1.jpg'  # TODO: Fix this
    assert layout.name is layout.__str__()
    assert layout.total_seats is not None
    assert layout.total_floors is not None


@pytest.mark.django_db
def test_floor_factory(floor):
    assert floor.id is not None
    assert floor.layout_id is not None
    assert floor.number is not None
    assert floor.width is not None
    assert floor.seats is not None


@pytest.mark.django_db
def test_seat_type_factory(seat_type):
    assert seat_type.name is not None
    assert seat_type.name is seat_type.__str__()


@pytest.mark.django_db
def test_seat_factory(seat):
    assert seat.seat_kind is not None
    assert seat.code is not None
    assert seat.position_x is not None
    assert seat.position_y is not None
    assert seat.width is not None
    assert seat.length is not None
    assert seat.kind is not None
    assert seat.floors is not None

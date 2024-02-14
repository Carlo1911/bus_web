import pytest


@pytest.mark.django_db
def test_position_factory(position_factory):
    position = position_factory()
    assert position.description is not None
    assert position.description is position.__str__()


@pytest.mark.django_db
def test_motive_factory(motive_factory):
    position = motive_factory()
    assert position.description is not None
    assert position.description is position.__str__()


@pytest.mark.django_db
def test_personal_factory(personal_factory):
    personal = personal_factory()
    assert personal.user is not None
    assert personal.status is not None
    assert personal.contract_date is not None
    assert personal.contract_type is not None
    assert personal.motives is not None
    assert personal.positions is not None
    assert f'{personal.user.first_name} {personal.user.last_name}' == personal.__str__()


@pytest.mark.django_db
def test_commission_factory(commission_factory):
    commission = commission_factory()
    assert commission.percentage is not None
    assert commission.status is not None
    assert commission.date_from is not None
    assert commission.date_to is not None
    assert commission.personal is not None

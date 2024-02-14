from django import forms

from .models import Seat


class SeatForm(forms.ModelForm):
    class Meta:
        model = Seat
        fields = '__all__'
        labels = {'seat_kind': 'Tipo de asiento'}

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        choices = (('seat', 'Asiento'),)
        self.fields['kind'].choices = choices

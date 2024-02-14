# Generated by Django 3.2.10 on 2022-01-07 13:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('transportation', '0005_auto_20211228_1122'),
        ('core', '0013_auto_20220105_1710'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReservedSeats',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('session', models.CharField(max_length=255, verbose_name='Sesión')),
                ('platform', models.CharField(choices=[('web', 'Web'), ('office', 'Oficina')], max_length=8, verbose_name='Plataforma')),
                ('current_datetime', models.DateTimeField(auto_now_add=True, verbose_name='Fecha y hora actual')),
                ('service', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.service', verbose_name='Servicio')),
            ],
            options={
                'verbose_name': 'Reserva de asientos',
                'verbose_name_plural': 'Reservas de asientos',
            },
        ),
        migrations.CreateModel(
            name='ReservedSeat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_taken', models.BooleanField(default=True, verbose_name='Reservado')),
                ('reserve', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='seats', to='core.reservedseats', verbose_name='Reserva')),
                ('seat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='transportation.seat', verbose_name='Asiento')),
            ],
            options={
                'verbose_name': 'Asiento reservado',
                'verbose_name_plural': 'Asientos reservado',
            },
        ),
    ]
# Generated by Django 4.0.3 on 2022-05-16 13:57

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0009_remove_busstop_distance_remove_busstop_duration'),
        ('transportation', '0006_alter_component_polymorphic_ctype'),
        ('core', '0062_alter_passenger_document_number'),
    ]

    operations = [
        migrations.CreateModel(
            name='Season',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Nombre')),
                ('type', models.CharField(choices=[('low', 'Bajo'), ('medium', 'Medio'), ('high', 'Alto')], default='low', max_length=255)),
                ('start_date', models.DateTimeField(verbose_name='Fecha inicio')),
                ('end_date', models.DateTimeField(verbose_name='Fecha fin')),
                ('status', models.BooleanField(default=True, verbose_name='Estado')),
            ],
            options={
                'verbose_name': 'Temporada',
                'verbose_name_plural': 'Temporadas',
            },
        ),
        migrations.CreateModel(
            name='StretchInfo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('distance', models.FloatField(default=0, verbose_name='Distancia')),
                ('duration', models.DurationField(default=datetime.timedelta(0), verbose_name='Tiempo')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Fecha creación')),
                ('end_bus_stop', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='end_tariff_bus_stop', to='locations.busstop', verbose_name='Parada fin')),
                ('start_bus_stop', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='start_tariff_bus_stop', to='locations.busstop', verbose_name='Parada inicio')),
            ],
            options={
                'verbose_name': 'Información de tramo referencial',
                'verbose_name_plural': 'Información de tramos referenciales',
            },
        ),
        migrations.CreateModel(
            name='StretchInfoRate',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sales_channel', models.CharField(choices=[('web', 'Web'), ('office', 'Oficina'), ('onway', 'En camino')], default='web', max_length=10, verbose_name='Tipo de canal de venta')),
                ('price', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True, verbose_name='Precio')),
                ('season', models.CharField(choices=[('low', 'Bajo'), ('medium', 'Medio'), ('high', 'Alto')], default='low', max_length=10)),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Fecha creación')),
                ('seat_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='transportation.seattype', verbose_name='Tipo de asiento')),
                ('stretch_info', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='rates', to='core.stretchinfo', verbose_name='Información de tramo')),
            ],
            options={
                'verbose_name': 'tramo referencial por tipo de asiento',
                'verbose_name_plural': 'tramos referenciales tipo de asiento',
            },
        ),
        migrations.RemoveField(
            model_name='tariffrate',
            name='seat_type',
        ),
        migrations.RemoveField(
            model_name='tariffrate',
            name='tariff',
        ),
        migrations.RemoveField(
            model_name='serviceseatrate',
            name='seat_rate_type',
        ),
        migrations.AddField(
            model_name='serviceseatrate',
            name='source_type',
            field=models.CharField(choices=[('web', 'Web'), ('office', 'Oficina'), ('onway', 'En camino')], default='web', max_length=20, verbose_name='Tipo de canal de venta'),
        ),
        migrations.AddField(
            model_name='serviceseatrate',
            name='stretch',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.routestretch', verbose_name='Tramo de ruta'),
        ),
        migrations.DeleteModel(
            name='Tariff',
        ),
        migrations.DeleteModel(
            name='TariffRate',
        ),
    ]

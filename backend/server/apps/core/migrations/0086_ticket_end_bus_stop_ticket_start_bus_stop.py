# Generated by Django 4.0.5 on 2022-07-26 23:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0009_remove_busstop_distance_remove_busstop_duration'),
        ('core', '0085_coupon_passangers_ticket_passenger'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='end_bus_stop',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='tickets_end', to='locations.busstop', verbose_name='Parada de llegada'),
        ),
        migrations.AddField(
            model_name='ticket',
            name='start_bus_stop',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='tickets_start', to='locations.busstop', verbose_name='Parada de salida'),
        ),
    ]
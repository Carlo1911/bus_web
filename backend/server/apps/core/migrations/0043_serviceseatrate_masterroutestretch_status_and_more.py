# Generated by Django 4.0.3 on 2022-04-06 17:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('transportation', '0006_alter_component_polymorphic_ctype'),
        ('core', '0042_merge_20220406_1742'),
    ]

    operations = [
        migrations.CreateModel(
            name='ServiceSeatRate',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('seat_rate_type', models.CharField(choices=[('branch office', 'Sucursal'), ('web', 'Web')], max_length=20, verbose_name='Tipo de tarifa')),
                ('price', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='Precio')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creación')),
                ('seat_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='transportation.seattype', verbose_name='Tipo de asiento')),
                ('service', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.service', verbose_name='Servicio')),
            ],
            options={
                'verbose_name': 'Tarifa de servicio',
                'verbose_name_plural': 'Tarifas de servicio',
            },
        ),
        migrations.AddField(
            model_name='masterroutestretch',
            name='status',
            field=models.BooleanField(default=True, verbose_name='Activo'),
        ),
        migrations.AddField(
            model_name='masterroutestretch',
            name='stretch_status',
            field=models.CharField(choices=[('Map', 'Mapa'), ('Stretch', 'Tramo')], default='Map', max_length=10),
        ),
        migrations.AddField(
            model_name='masterroutestretch',
            name='waiting_time',
            field=models.TimeField(blank=True, null=True, verbose_name='Tiempo de espera'),
        ),
        migrations.DeleteModel(
            name='MasterRouteMap',
        ),
    ]
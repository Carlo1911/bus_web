# Generated by Django 3.2.9 on 2021-12-06 12:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0003_auto_20211129_1553'),
        ('core', '0004_alter_masterroutestretchrate_master_route_stretch'),
    ]

    operations = [
        migrations.CreateModel(
            name='MasterRouteMap',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order', models.IntegerField(default=0, verbose_name='Orden')),
                ('status', models.BooleanField(default=True, verbose_name='Activo')),
                ('bus_stop', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='maps', to='locations.busstop', verbose_name='Paradas')),
                ('master_route', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='maps', to='core.masterroute', verbose_name='Ruta maestra')),
            ],
            options={
                'verbose_name': 'Mapa de ruta maestra',
                'verbose_name_plural': 'Mapas de rutas maestras',
            },
        ),
    ]

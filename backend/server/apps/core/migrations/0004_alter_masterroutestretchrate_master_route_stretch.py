# Generated by Django 3.2.9 on 2021-12-02 14:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20211202_0918'),
    ]

    operations = [
        migrations.AlterField(
            model_name='masterroutestretchrate',
            name='master_route_stretch',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.masterroutestretch', verbose_name='Tramo de ruta maestra'),
        ),
    ]
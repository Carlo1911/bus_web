# Generated by Django 4.0.3 on 2022-04-22 15:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0006_busstop_distance_busstop_time'),
    ]

    operations = [
        migrations.AddField(
            model_name='busstop',
            name='status',
            field=models.CharField(choices=[('active', 'Activo'), ('inactive', 'Inactivo')], default='active', max_length=20),
        ),
    ]
# Generated by Django 4.0.3 on 2022-03-15 13:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0004_city_priority'),
    ]

    operations = [
        migrations.AddField(
            model_name='busstop',
            name='order',
            field=models.IntegerField(default=0, verbose_name='Orden'),
        ),
    ]

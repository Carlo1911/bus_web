# Generated by Django 3.2.10 on 2021-12-13 13:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_masterroutemap_unique bus stop in master route'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='masterroutestretch',
            name='city',
        ),
    ]

# Generated by Django 3.2.10 on 2021-12-14 13:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0007_remove_masterroutestretch_city'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='reserved_time',
            field=models.DateTimeField(default=None, verbose_name='Bloqueado hasta'),
            preserve_default=False,
        ),
    ]

# Generated by Django 4.0.3 on 2022-05-06 10:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0055_alter_tariffrate_source'),
    ]

    operations = [
        migrations.AlterField(
            model_name='route',
            name='status',
            field=models.BooleanField(default=False, verbose_name='Estado'),
        ),
    ]

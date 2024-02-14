# Generated by Django 4.0.2 on 2022-02-18 09:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0004_city_priority'),
        ('crew', '0014_auto_20211215_1721'),
    ]

    operations = [
        migrations.AddField(
            model_name='personal',
            name='branch',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='locations.branch'),
        ),
    ]

# Generated by Django 3.2.9 on 2021-11-17 11:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('crew', '0006_commission'),
    ]

    operations = [
        migrations.AddField(
            model_name='personalmotive',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, null=True, verbose_name='Fecha de creacion'),
        ),
        migrations.AddField(
            model_name='personalmotive',
            name='manage_personal',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='Usuario responsable'),
        ),
    ]

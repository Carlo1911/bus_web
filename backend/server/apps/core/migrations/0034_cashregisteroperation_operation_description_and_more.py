# Generated by Django 4.0.3 on 2022-03-15 15:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0033_refund'),
    ]

    operations = [
        migrations.AddField(
            model_name='cashregisteroperation',
            name='operation_description',
            field=models.CharField(choices=[('cash', 'Efectivo '), ('partial refund', 'Reembolso parcial'), ('total refund', 'Reembolso'), ('date change', 'Cambio de fecha'), ('date change agreement', 'Cambio de fecha convenio')], default='cash', max_length=100, verbose_name='Tipo descripción'),
        ),
        migrations.DeleteModel(
            name='Refund',
        ),
    ]
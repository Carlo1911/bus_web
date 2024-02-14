# Generated by Django 4.0.2 on 2022-02-15 17:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0019_auto_20220211_1332'),
    ]

    operations = [
        migrations.AddField(
            model_name='sale',
            name='cash_payment_type',
            field=models.CharField(blank=True, choices=[('cash', 'Efectivo'), ('credit', 'Crédito'), ('debit', 'Débito')], max_length=6, null=True, verbose_name='Tipo de pago'),
        ),
    ]
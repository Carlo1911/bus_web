# Generated by Django 4.0.2 on 2022-02-18 09:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0024_alter_service_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cashregistermovement',
            name='amount',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True, verbose_name='Monto'),
        ),
    ]
# Generated by Django 4.0.3 on 2022-04-11 15:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0046_remove_routestretchrate_rate_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sale',
            name='status',
            field=models.CharField(choices=[('pending', 'Pendiente'), ('paid', 'Pagado'), ('canceled', 'Cancelado'), ('partial refunded', 'Parcialmente reembolsado'), ('refunded', 'Reembolsado')], max_length=16, verbose_name='Estado'),
        ),
    ]

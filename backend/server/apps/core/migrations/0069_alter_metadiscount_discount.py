# Generated by Django 4.0.3 on 2022-05-23 22:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0068_metadiscount_alter_serviceseatrate_service_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='metadiscount',
            name='discount',
            field=models.DecimalField(decimal_places=2, max_digits=10, verbose_name='Descuento'),
        ),
    ]

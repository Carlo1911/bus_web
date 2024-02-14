# Generated by Django 3.2.10 on 2022-01-11 11:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0016_auto_20220110_1733'),
    ]

    operations = [
        migrations.AlterField(
            model_name='service',
            name='status',
            field=models.CharField(choices=[('active', 'activo'), ('disabled', 'Desactivado'), ('modified', 'Modificado')], max_length=9, verbose_name='Estado de servicio'),
        ),
    ]

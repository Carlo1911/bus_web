# Generated by Django 3.2.9 on 2021-11-30 16:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('crew', '0008_alter_commission_personal'),
    ]

    operations = [
        migrations.CreateModel(
            name='CommissionLog',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creación')),
                ('modified', models.DateTimeField(auto_now=True, verbose_name='Fecha de modificación')),
                ('date', models.DateField(verbose_name='Fecha')),
                ('percentage', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='Porcentaje')),
                ('date_from', models.DateField(verbose_name='Desde')),
                ('date_to', models.DateField(verbose_name='Hasta')),
                ('commission', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='logs', to='crew.commission', verbose_name='Comisión')),
            ],
            options={
                'verbose_name': 'Log de comisión',
                'verbose_name_plural': 'Logs de comisiones',
            },
        ),
    ]
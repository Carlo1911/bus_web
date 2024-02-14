# Generated by Django 3.2.9 on 2021-11-10 13:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='customuser',
            name='address',
            field=models.CharField(blank=True, max_length=120, null=True, verbose_name='Dirección'),
        ),
        migrations.AddField(
            model_name='customuser',
            name='sex',
            field=models.CharField(choices=[('M', 'Masculino'), ('F', 'Femenino'), ('O', 'Otros')], default='O', max_length=1, verbose_name='Sexo'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='customuser',
            name='work_address',
            field=models.CharField(blank=True, max_length=120, null=True, verbose_name='Dirección de trabajo'),
        ),
        migrations.AddField(
            model_name='customuser',
            name='work_phone',
            field=models.CharField(blank=True, max_length=15, null=True, verbose_name='Número de trabajo'),
        ),
    ]
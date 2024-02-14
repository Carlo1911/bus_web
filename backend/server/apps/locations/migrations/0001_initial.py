# Generated by Django 3.2.9 on 2021-11-25 03:32

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Region',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(blank=True, max_length=10, null=True, verbose_name='Código')),
                ('name', models.CharField(max_length=255, verbose_name='Nombre')),
                ('iso_code', models.CharField(blank=True, max_length=20, null=True, verbose_name='Código ISO')),
            ],
            options={
                'verbose_name': 'Región',
                'verbose_name_plural': 'Regiones',
            },
        ),
    ]
# Generated by Django 3.2.9 on 2021-11-10 17:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('crew', '0002_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='position',
            name='description',
            field=models.CharField(max_length=70, unique=True, verbose_name='Descripción'),
        ),
    ]
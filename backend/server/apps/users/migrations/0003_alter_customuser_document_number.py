# Generated by Django 3.2.10 on 2022-01-20 19:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20211110_1358'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customuser',
            name='document_number',
            field=models.CharField(max_length=12, verbose_name='RUT'),
        ),
    ]

# Generated by Django 4.0.3 on 2022-05-06 11:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0058_coupon_count_uses'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='coupon',
            name='valid_until',
        ),
        migrations.AddField(
            model_name='coupon',
            name='valid_to',
            field=models.DateTimeField(blank=True, null=True, verbose_name='Válido hasta'),
        ),
        migrations.AlterField(
            model_name='coupon',
            name='valid_from',
            field=models.DateTimeField(blank=True, null=True, verbose_name='Válido desde'),
        ),
    ]

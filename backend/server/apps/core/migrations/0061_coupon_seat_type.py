# Generated by Django 4.0.3 on 2022-05-09 07:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('transportation', '0006_alter_component_polymorphic_ctype'),
        ('core', '0060_remove_coupon_document_number_remove_coupon_service_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='coupon',
            name='seat_type',
            field=models.ManyToManyField(related_name='coupons', to='transportation.seattype', verbose_name='Tipo de asiento'),
        ),
    ]

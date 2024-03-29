# Generated by Django 4.0.2 on 2022-02-28 10:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('transportation', '0006_alter_component_polymorphic_ctype'),
        ('core', '0029_cashregisteroperation_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='passenger',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='tickets', to='core.passenger', verbose_name='Pasajero'),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='seat',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='tickets', to='transportation.seat', verbose_name='Asiento'),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='ticket_source',
            field=models.CharField(blank=True, choices=[('branch_office', 'Branch office'), ('web', 'Web')], max_length=15, null=True, verbose_name='Fuente de compra del boleto'),
        ),
    ]

# Generated by Django 4.0.3 on 2022-04-08 13:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('crew', '0015_personal_branch'),
        ('core', '0041_alter_service_datetime_publish'),
    ]

    operations = [
        migrations.AddField(
            model_name='refundrequest',
            name='cash_register',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='refund_requests', to='core.cashregister', verbose_name='Caja'),
        ),
        migrations.AddField(
            model_name='refundrequest',
            name='seller',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='refund_requests', to='crew.personal', verbose_name='Vendedor'),
        ),
    ]
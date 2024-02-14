# Generated by Django 4.0.3 on 2022-03-16 10:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('crew', '0015_personal_branch'),
        ('core', '0035_refundticket_refundrequest'),
    ]

    operations = [
        migrations.AlterField(
            model_name='refundrequest',
            name='authorizer',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='crew.personal', verbose_name='Autorizador'),
        ),
        migrations.AlterField(
            model_name='refundrequest',
            name='tickets',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.refundticket', verbose_name='tickets'),
        ),
    ]
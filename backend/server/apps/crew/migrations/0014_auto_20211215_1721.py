# Generated by Django 3.2.10 on 2021-12-15 17:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0010_alter_routemap_route'),
        ('crew', '0013_alter_personal_contract_type'),
    ]

    operations = [
        migrations.AddField(
            model_name='commission',
            name='route',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, related_name='commissions', to='core.route', verbose_name='Ruta'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='commission',
            name='personal',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='commissions', to='crew.personal', verbose_name='Personal'),
        ),
    ]

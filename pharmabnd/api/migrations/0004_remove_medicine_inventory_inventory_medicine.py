# Generated by Django 4.2.11 on 2024-04-13 08:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_inventory_medicine_inventory'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='medicine',
            name='inventory',
        ),
        migrations.AddField(
            model_name='inventory',
            name='Medicine',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='inventory', to='api.medicine'),
        ),
    ]

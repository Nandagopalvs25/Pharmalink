# Generated by Django 4.2.11 on 2024-04-13 08:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_medicine'),
    ]

    operations = [
        migrations.CreateModel(
            name='Inventory',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='medicine',
            name='inventory',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='inventory', to='api.inventory'),
        ),
    ]

# Generated by Django 3.2.12 on 2022-04-11 05:34

import datetime

from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ("authnapp", "0002_user_model_extend"),
    ]

    operations = [
        migrations.AlterField(
            model_name="shopuser",
            name="activation_key_expires",
            field=models.DateTimeField(
                default=datetime.datetime(2022, 4, 13, 5, 34, 57, 210941, tzinfo=utc), verbose_name="актуальность ключа"
            ),
        ),
    ]

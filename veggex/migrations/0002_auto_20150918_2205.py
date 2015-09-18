# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='cart',
            options={'ordering': ['timeOfUpdate']},
        ),
        migrations.AlterModelOptions(
            name='order',
            options={'ordering': ['timeOfUpdate']},
        ),
    ]

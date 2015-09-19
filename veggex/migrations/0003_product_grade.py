# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0002_auto_20150918_2205'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='grade',
            field=models.TextField(default=''),
            preserve_default=False,
        ),
    ]

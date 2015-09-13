# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0006_remove_product_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='status',
            field=models.IntegerField(default=1),
        ),
    ]

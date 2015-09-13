# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0004_auto_20150913_2050'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='priceType',
            field=models.CharField(default=b'custom rates', max_length=300, choices=[(b'as per mandi rates', b'as per mandi rates'), (b'custom rates', b'custom rates')]),
        ),
    ]

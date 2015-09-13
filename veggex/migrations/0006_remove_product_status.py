# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0005_auto_20150912_2303'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='status',
        ),
    ]

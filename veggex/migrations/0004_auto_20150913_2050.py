# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0003_auto_20150912_2245'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customcategoryproducts',
            name='product',
        ),
        migrations.AddField(
            model_name='customcategoryproducts',
            name='product',
            field=models.ManyToManyField(to='veggex.Product'),
        ),
    ]

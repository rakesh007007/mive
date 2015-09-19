# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0003_product_grade'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='related_products',
            field=models.ManyToManyField(related_name='related_products_rel_+', null=True, to='veggex.Product', blank=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='grade',
            field=models.TextField(default=b'', choices=[(b'Grade-A', b'Grade-A'), (b'Grade-B', b'Grade-B'), (b'Grade-C', b'Grade-C'), (b'Grade-D', b'Grade-D'), (b'', b'')]),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0007_auto_20150808_2359'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='coverphoto',
            field=models.ImageField(null=True, upload_to=b'media', blank=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='coverphoto',
            field=models.ImageField(upload_to=b'media'),
        ),
        migrations.AlterField(
            model_name='seller',
            name='profilePhoto',
            field=models.ImageField(null=True, upload_to=b'media', blank=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='profilePhoto',
            field=models.ImageField(null=True, upload_to=b'media', blank=True),
        ),
    ]

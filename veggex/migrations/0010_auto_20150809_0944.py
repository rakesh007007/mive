# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0009_user_thumbnail'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='thumbnail',
        ),
        migrations.AlterField(
            model_name='category',
            name='coverphoto',
            field=models.ImageField(null=True, upload_to=b'', blank=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='coverphoto',
            field=models.ImageField(upload_to=b''),
        ),
        migrations.AlterField(
            model_name='seller',
            name='profilePhoto',
            field=models.ImageField(null=True, upload_to=b'', blank=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='profilePhoto',
            field=models.ImageField(null=True, upload_to=b'', blank=True),
        ),
    ]

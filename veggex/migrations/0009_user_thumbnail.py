# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0008_auto_20150809_0111'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='thumbnail',
            field=models.FileField(null=True, upload_to=b'media'),
        ),
    ]

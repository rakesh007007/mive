# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone
import veggex.models


class Migration(migrations.Migration):

    dependencies = [
        ('veggex', '0006_auto_20150808_1101'),
    ]

    operations = [
        migrations.CreateModel(
            name='Seller',
            fields=[
                ('seller_id', models.AutoField(serialize=False, primary_key=True)),
                ('nameOfSeller', models.CharField(max_length=300)),
                ('mailId', models.CharField(max_length=300)),
                ('mobileNo', models.BigIntegerField()),
                ('profilePhoto', models.ImageField(null=True, upload_to=b'', blank=True)),
                ('address', models.ForeignKey(blank=True, to='veggex.Address', null=True)),
            ],
        ),
        migrations.AddField(
            model_name='product',
            name='isPerishable',
            field=models.NullBooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='cart',
            name='timeOfCreate',
            field=veggex.models.AutoDateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='cart',
            name='timeOfUpdate',
            field=veggex.models.AutoDateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='order',
            name='timeOfCreate',
            field=veggex.models.AutoDateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='order',
            name='timeOfUpdate',
            field=veggex.models.AutoDateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AddField(
            model_name='product',
            name='seller',
            field=models.ForeignKey(blank=True, to='veggex.Seller', null=True),
        ),
    ]

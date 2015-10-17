# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone
import veggex.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Accartitem',
            fields=[
                ('accartitem_id', models.AutoField(serialize=False, primary_key=True)),
                ('qtyInUnits', models.IntegerField()),
                ('resason', models.TextField(null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('address_id', models.AutoField(serialize=False, primary_key=True)),
                ('area', models.CharField(max_length=300)),
                ('city', models.CharField(max_length=300)),
                ('state', models.CharField(max_length=300)),
                ('pincode', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Career',
            fields=[
                ('career_id', models.AutoField(serialize=False, primary_key=True)),
                ('firstname', models.CharField(max_length=300)),
                ('lastname', models.CharField(max_length=300)),
                ('email', models.CharField(max_length=300)),
                ('subject', models.CharField(max_length=300)),
                ('coverletter', models.TextField(max_length=300)),
                ('resume', models.FileField(upload_to=b'')),
                ('timeOfCreate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('timeOfUpdate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('cart_id', models.AutoField(serialize=False, primary_key=True)),
                ('timeOfCreate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('timeOfUpdate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('cartTotal', models.IntegerField(default=0)),
            ],
            options={
                'ordering': ['timeOfUpdate'],
            },
        ),
        migrations.CreateModel(
            name='Cartitem',
            fields=[
                ('cartitem_id', models.AutoField(serialize=False, primary_key=True)),
                ('qtyInUnits', models.PositiveIntegerField()),
                ('timeOfCreate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('timeOfUpdate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('cart', models.ForeignKey(to='veggex.Cart')),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('category_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=300)),
                ('coverphoto', models.ImageField(null=True, upload_to=b'', blank=True)),
                ('description', models.CharField(max_length=300)),
            ],
        ),
        migrations.CreateModel(
            name='CategoryVendor',
            fields=[
                ('categoryvendor_id', models.AutoField(serialize=False, primary_key=True)),
            ],
        ),
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('contact_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=300)),
                ('email', models.CharField(max_length=300)),
                ('message', models.TextField(max_length=300)),
                ('mobile', models.BigIntegerField()),
                ('timeOfCreate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('timeOfUpdate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Currentstock',
            fields=[
                ('currentstock_id', models.AutoField(serialize=False, primary_key=True)),
                ('remainingstock', models.FloatField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='CustomCategoryProducts',
            fields=[
                ('uid', models.AutoField(serialize=False, primary_key=True)),
            ],
        ),
        migrations.CreateModel(
            name='Mandi',
            fields=[
                ('mandi_id', models.AutoField(serialize=False, primary_key=True)),
                ('nameOfMandi', models.CharField(max_length=300)),
                ('description', models.TextField()),
                ('Photo', models.ImageField(null=True, upload_to=b'', blank=True)),
                ('address', models.ForeignKey(blank=True, to='veggex.Address', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('order_id', models.AutoField(serialize=False, primary_key=True)),
                ('payment_mode', models.CharField(max_length=200, null=True, blank=True)),
                ('subtotal', models.IntegerField(null=True, blank=True)),
                ('status', models.CharField(default=b'PLACED', max_length=200)),
                ('orderMsg', models.TextField(null=True, blank=True)),
                ('deliveryTime', models.DateField(null=True, blank=True)),
                ('timeOfCreate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('timeOfUpdate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('category', models.ForeignKey(blank=True, to='veggex.Category', null=True)),
            ],
            options={
                'ordering': ['timeOfCreate'],
            },
        ),
        migrations.CreateModel(
            name='Orderitem',
            fields=[
                ('orderitem_id', models.AutoField(serialize=False, primary_key=True)),
                ('unit', models.CharField(default=b'kg', max_length=100)),
                ('qtyInUnits', models.IntegerField()),
                ('priceType', models.CharField(max_length=200, choices=[(b'as per mandi rates', b'as per mandi rates'), (b'custom rates', b'custom rates')])),
                ('priceAtThatTime', models.IntegerField()),
                ('order', models.ForeignKey(to='veggex.Order')),
            ],
        ),
        migrations.CreateModel(
            name='Owner',
            fields=[
                ('owner_id', models.AutoField(serialize=False, primary_key=True)),
                ('nameOfOwner', models.CharField(max_length=300)),
                ('mailId', models.CharField(max_length=300)),
                ('mobileNo', models.BigIntegerField(unique=True)),
                ('profilePhoto', models.ImageField(null=True, upload_to=b'', blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('product_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=300)),
                ('description', models.TextField(null=True, blank=True)),
                ('popularityIndex', models.IntegerField(null=True, blank=True)),
                ('unit', models.CharField(default=b'kg', max_length=100)),
                ('priceType', models.CharField(default=b'custom rates', max_length=300, choices=[(b'as per mandi rates', b'as per mandi rates'), (b'custom rates', b'custom rates')])),
                ('pricePerUnit', models.IntegerField()),
                ('coverphoto', models.ImageField(upload_to=b'')),
                ('origin', models.CharField(max_length=300)),
                ('maxAvailableUnits', models.IntegerField()),
                ('qualityRemarks', models.TextField()),
                ('grade', models.CharField(default=b'', max_length=200, choices=[(b'Grade-A', b'Grade-A'), (b'Grade-B', b'Grade-B'), (b'Grade-C', b'Grade-C'), (b'Grade-D', b'Grade-D'), (b'', b'')])),
                ('status', models.IntegerField(default=1)),
                ('isPerishable', models.NullBooleanField(default=False)),
                ('category', models.ForeignKey(to='veggex.Category')),
                ('related_products', models.ManyToManyField(related_name='related_products_rel_+', to='veggex.Product', blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Seller',
            fields=[
                ('seller_id', models.AutoField(serialize=False, primary_key=True)),
                ('nameOfSeller', models.CharField(max_length=300)),
                ('mailId', models.CharField(max_length=300)),
                ('mobileNo', models.BigIntegerField()),
                ('profilePhoto', models.ImageField(null=True, upload_to=b'', blank=True)),
                ('categories', models.CharField(max_length=240, null=True, blank=True)),
                ('rating', models.IntegerField(default=0)),
                ('address', models.ForeignKey(blank=True, to='veggex.Address', null=True)),
                ('mandi', models.ForeignKey(blank=True, to='veggex.Mandi', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Stockconsumption',
            fields=[
                ('stockwastage_id', models.AutoField(serialize=False, primary_key=True)),
                ('consumption', models.FloatField(default=0)),
                ('timeOfCreate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('comment', models.TextField(null=True, blank=True)),
                ('stock', models.ForeignKey(to='veggex.Currentstock')),
            ],
        ),
        migrations.CreateModel(
            name='Stockwastage',
            fields=[
                ('stockwastage_id', models.AutoField(serialize=False, primary_key=True)),
                ('wastage', models.FloatField(default=0)),
                ('timeOfCreate', veggex.models.AutoDateTimeField(default=django.utils.timezone.now, null=True, blank=True)),
                ('comment', models.TextField(null=True, blank=True)),
                ('stock', models.ForeignKey(to='veggex.Currentstock')),
            ],
        ),
        migrations.CreateModel(
            name='Subscribe',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('email', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('user_id', models.AutoField(serialize=False, primary_key=True)),
                ('nameOfInstitution', models.CharField(max_length=300)),
                ('nameOfOwner', models.CharField(max_length=300)),
                ('institutionType', models.CharField(max_length=300, choices=[(b'hotels', b'hotels'), (b'juice vendors', b'juice vendors'), (b'veg. vendors', b'veg. vendors'), (b'other buyers', b'other buyers')])),
                ('mailId', models.CharField(max_length=300)),
                ('mobileNo', models.BigIntegerField(unique=True)),
                ('password', models.CharField(max_length=300)),
                ('gpsLocation', models.CharField(max_length=300, null=True, blank=True)),
                ('profilePhoto', models.ImageField(null=True, upload_to=b'', blank=True)),
                ('address', models.ForeignKey(blank=True, to='veggex.Address', null=True)),
                ('cart', models.ForeignKey(to='veggex.Cart')),
                ('categories', models.ManyToManyField(to='veggex.CategoryVendor', null=True, blank=True)),
                ('owner', models.ForeignKey(blank=True, to='veggex.Owner', null=True)),
            ],
        ),
        migrations.AddField(
            model_name='product',
            name='seller',
            field=models.ForeignKey(blank=True, to='veggex.Seller', null=True),
        ),
        migrations.AddField(
            model_name='orderitem',
            name='product',
            field=models.ForeignKey(to='veggex.Product'),
        ),
        migrations.AddField(
            model_name='order',
            name='seller',
            field=models.ForeignKey(blank=True, to='veggex.Seller', null=True),
        ),
        migrations.AddField(
            model_name='order',
            name='user',
            field=models.ForeignKey(to='veggex.User'),
        ),
        migrations.AddField(
            model_name='customcategoryproducts',
            name='product',
            field=models.ManyToManyField(to='veggex.Product'),
        ),
        migrations.AddField(
            model_name='customcategoryproducts',
            name='user',
            field=models.ForeignKey(to='veggex.User'),
        ),
        migrations.AddField(
            model_name='currentstock',
            name='product',
            field=models.OneToOneField(to='veggex.Product'),
        ),
        migrations.AddField(
            model_name='categoryvendor',
            name='products',
            field=models.ManyToManyField(to='veggex.Product', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='categoryvendor',
            name='seller',
            field=models.ForeignKey(to='veggex.Seller'),
        ),
        migrations.AddField(
            model_name='cartitem',
            name='product',
            field=models.ForeignKey(to='veggex.Product'),
        ),
        migrations.AddField(
            model_name='accartitem',
            name='cart',
            field=models.ForeignKey(to='veggex.Cart'),
        ),
        migrations.AddField(
            model_name='accartitem',
            name='product',
            field=models.ForeignKey(to='veggex.Product'),
        ),
    ]

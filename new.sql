# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey('AuthPermission')

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType')
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user_id', 'group_id'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class AuthtokenToken(models.Model):
    key = models.CharField(primary_key=True, max_length=40)
    created = models.DateTimeField()
    user = models.ForeignKey(AuthUser, unique=True)

    class Meta:
        managed = False
        db_table = 'authtoken_token'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', blank=True, null=True)
    user = models.ForeignKey(AuthUser)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class VeggexAddress(models.Model):
    address_id = models.AutoField(primary_key=True)
    area = models.CharField(max_length=300)
    city = models.CharField(max_length=300)
    state = models.CharField(max_length=300)
    pincode = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'veggex_address'


class VeggexCart(models.Model):
    cart_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('VeggexUser')
    timeofcreate = models.DateTimeField(db_column='timeOfCreate')  # Field name made lowercase.
    timeofupdate = models.DateTimeField(db_column='timeOfUpdate')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'veggex_cart'


class VeggexCartitem(models.Model):
    cartitem_id = models.AutoField(primary_key=True)
    cart = models.ForeignKey(VeggexCart)
    qtyinunits = models.IntegerField(db_column='qtyInUnits')  # Field name made lowercase.
    product = models.ForeignKey('VeggexProduct')

    class Meta:
        managed = False
        db_table = 'veggex_cartitem'


class VeggexCategory(models.Model):
    category_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=300)
    coverphoto = models.CharField(max_length=100, blank=True, null=True)
    description = models.CharField(max_length=300)

    class Meta:
        managed = False
        db_table = 'veggex_category'


class VeggexOrder(models.Model):
    order_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('VeggexUser')
    timeofcreate = models.DateTimeField(db_column='timeOfCreate')  # Field name made lowercase.
    timeofupdate = models.DateTimeField(db_column='timeOfUpdate')  # Field name made lowercase.
    payment_mode = models.CharField(max_length=200, blank=True, null=True)
    subtotal = models.IntegerField(blank=True, null=True)
    status = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'veggex_order'


class VeggexOrderitem(models.Model):
    orderitem_id = models.AutoField(primary_key=True)
    order = models.ForeignKey(VeggexOrder)
    unit = models.CharField(max_length=100)
    qtyinunits = models.IntegerField(db_column='qtyInUnits')  # Field name made lowercase.
    pricetype = models.CharField(db_column='priceType', max_length=200)  # Field name made lowercase.
    priceatthattime = models.IntegerField(db_column='priceAtThatTime')  # Field name made lowercase.
    product = models.ForeignKey('VeggexProduct')

    class Meta:
        managed = False
        db_table = 'veggex_orderitem'


class VeggexProduct(models.Model):
    product_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=300)
    description = models.TextField(blank=True, null=True)
    category = models.ForeignKey(VeggexCategory)
    popularityindex = models.IntegerField(db_column='popularityIndex', blank=True, null=True)  # Field name made lowercase.
    unit = models.CharField(max_length=100)
    pricetype = models.CharField(db_column='priceType', max_length=300)  # Field name made lowercase.
    priceperunit = models.IntegerField(db_column='pricePerUnit')  # Field name made lowercase.
    coverphoto = models.CharField(max_length=100)
    origin = models.CharField(max_length=300)
    maxavailableunits = models.IntegerField(db_column='maxAvailableUnits')  # Field name made lowercase.
    qualityremarks = models.TextField(db_column='qualityRemarks')  # Field name made lowercase.
    seller = models.ForeignKey('VeggexSeller', blank=True, null=True)
    isperishable = models.IntegerField(db_column='isPerishable', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'veggex_product'


class VeggexSeller(models.Model):
    seller_id = models.AutoField(primary_key=True)
    nameofseller = models.CharField(db_column='nameOfSeller', max_length=300)  # Field name made lowercase.
    mailid = models.CharField(db_column='mailId', max_length=300)  # Field name made lowercase.
    mobileno = models.BigIntegerField(db_column='mobileNo')  # Field name made lowercase.
    profilephoto = models.CharField(db_column='profilePhoto', max_length=100, blank=True, null=True)  # Field name made lowercase.
    address = models.ForeignKey(VeggexAddress, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'veggex_seller'


class VeggexUser(models.Model):
    user_id = models.AutoField(primary_key=True)
    nameofinstitution = models.CharField(db_column='nameOfInstitution', max_length=300)  # Field name made lowercase.
    nameofowner = models.CharField(db_column='nameOfOwner', max_length=300)  # Field name made lowercase.
    institutiontype = models.CharField(db_column='institutionType', max_length=300)  # Field name made lowercase.
    mailid = models.CharField(db_column='mailId', max_length=300)  # Field name made lowercase.
    mobileno = models.BigIntegerField(db_column='mobileNo')  # Field name made lowercase.
    password = models.CharField(max_length=300)
    gpslocation = models.CharField(db_column='gpsLocation', max_length=300, blank=True, null=True)  # Field name made lowercase.
    profilephoto = models.CharField(db_column='profilePhoto', max_length=100, blank=True, null=True)  # Field name made lowercase.
    address = models.ForeignKey(VeggexAddress, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'veggex_user'

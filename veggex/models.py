from django.db import models
from datetime import datetime, timedelta
from django.utils import timezone
from mive import settings
from django.utils import timezone

# Create your models here.
institutionTypeChoices = (
    ('hotels', "hotels"),
    ('juice vendors', "juice vendors"),
    ('veg. vendors', "veg. vendors"),
    ('other buyers', "other buyers"),
)
priceType =(
	('as per mandi rates','as per mandi rates'),
	('custom rates','custom rates'),
	)
class AutoDateTimeField(models.DateTimeField):
    def pre_save(self, model_instance, add):
        return timezone.now()
class Address(models.Model):
	address_id = models.AutoField(primary_key=True)
	area=models.CharField(max_length=300, blank=False, null=False)
	city =models.CharField(max_length=300, blank=False, null=False)
	state = models.CharField(max_length=300, blank=False, null=False)
	pincode=models.IntegerField(blank=False,null=False)
	def __unicode__(self):
		return str(self.address_id)

class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    nameOfInstitution = models.CharField(max_length=300, blank=False, null=False)
    nameOfOwner = models.CharField(max_length=300, blank=False, null=False)
    institutionType = models.CharField(max_length=300,choices = institutionTypeChoices , blank=False, null=False)
    mailId =models.CharField(max_length=300, blank=False, null=False)
    mobileNo = models.BigIntegerField(blank=False,null=False)
    password = models.CharField(max_length=300, blank=False, null=False)
    gpsLocation = models.CharField(max_length=300,blank=True,null=True)
    profilePhoto = models.ImageField(blank=True,null=True)
    address = models.ForeignKey(Address, blank=True, null=True)
    def profilephotourl(self):
    	return self.profilePhoto.url

    def __unicode__(self):
    	return str(self.nameOfInstitution)
class Mandi(models.Model):
    mandi_id = models.AutoField(primary_key=True)
    nameOfMandi = models.CharField(max_length=300, blank=False, null=False)
    description =models.TextField(blank=False, null=False)
    Photo = models.ImageField(blank=True,null=True)
    address = models.ForeignKey(Address, blank=True, null=True)

    def __unicode__(self):
    	return str(self.nameOfMandi)
class Seller(models.Model):
    seller_id = models.AutoField(primary_key=True)
    nameOfSeller = models.CharField(max_length=300, blank=False, null=False)
    mailId =models.CharField(max_length=300, blank=False, null=False)
    mobileNo = models.BigIntegerField(blank=False,null=False)
    profilePhoto = models.ImageField(blank=True,null=True)
    address = models.ForeignKey(Address, blank=True, null=True)
    mandi = models.ForeignKey(Mandi,blank=True,null=True)

    def __unicode__(self):
    	return str(self.nameOfSeller)
class Category(models.Model):
	category_id = models.AutoField(primary_key=True)
	name=models.CharField(max_length=300,blank=False,null=False)
	coverphoto = models.ImageField(blank=True,null=True)
	description =models.CharField(max_length=300,blank=False,null=False)
	def coverphotourl(self):
		return self.coverphoto.url
	def __unicode__(self):
		return str(self.name)
class Product(models.Model):
	product_id = models.AutoField(primary_key=True)
	name=models.CharField(max_length=300,blank=False,null=False)
	description=models.TextField(blank=True,null=True)
	category = models.ForeignKey(Category)
	popularityIndex = models.IntegerField(blank=True,null=True)
	unit = models.CharField(max_length=100,default='kg')
	priceType = models.CharField(max_length=300,choices=priceType)
	pricePerUnit = models.IntegerField(blank=False,null=False)
	coverphoto = models.ImageField()
	origin = models.CharField(max_length=300)
	maxAvailableUnits=models.IntegerField()
	qualityRemarks = models.TextField()
	seller = models.ForeignKey(Seller,blank=True,null=True)
	isPerishable = models.NullBooleanField(blank=True,null=True,default=False)
	def coverphotourl(self):
		return self.coverphoto.url
	def __unicode__(self):
		return str(self.name)
class Cart(models.Model):
	cart_id = models.AutoField(primary_key=True)
	user=models.ForeignKey(User,blank=False,null=False)
	#check this time thing
	timeOfCreate = AutoDateTimeField(default=timezone.now)
	timeOfUpdate =AutoDateTimeField(default=timezone.now)
class Cartitem(models.Model):
	cartitem_id = models.AutoField(primary_key=True)
	cart=models.ForeignKey(Cart,blank=False,null=False)
	qtyInUnits = models.IntegerField()
	product = models.ForeignKey(Product,blank=False,null=False)
class Order(models.Model):
	order_id = models.AutoField(primary_key=True)
	user=models.ForeignKey(User,blank=False,null=False)
	timeOfCreate = AutoDateTimeField(default=timezone.now)
	timeOfUpdate =AutoDateTimeField(default=timezone.now)
	payment_mode = models.CharField(max_length=200,blank=True,null=True)
	subtotal=models.IntegerField(blank=True,null=True)
	status = models.CharField(max_length=200,default='PLACED')
class Orderitem(models.Model):
	orderitem_id = models.AutoField(primary_key=True)
	order=models.ForeignKey(Order,blank=False,null=False)
	unit = models.CharField(max_length=100,default='kg')
	qtyInUnits = models.IntegerField()
	priceType = models.CharField(max_length=200,choices=priceType)
	priceAtThatTime = models.IntegerField()
	product = models.ForeignKey(Product,blank=False,null=False)
class Subscribe(models.Model):
	id = models.AutoField(primary_key=True)
	email = models.TextField(blank=False,null=False)
	def __unicode__(self):
		return str(self.email)

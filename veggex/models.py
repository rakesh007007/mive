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
categoryType =(
	('custom','custom'),
	('normal','normal'),
	)
class AutoDateTimeField(models.DateTimeField):
    def pre_save(self, model_instance, add):
        return timezone.now()
class Category(models.Model):
	category_id = models.AutoField(primary_key=True)
	name=models.CharField(max_length=300,blank=False,null=False)
	coverphoto = models.ImageField(blank=True,null=True)
	description =models.CharField(max_length=300,blank=False,null=False)
	def coverphotourl(self):
		return self.coverphoto.url
	def categoryId(self):
		return self.category_id
	def __unicode__(self):
		return str(self.name)
class Address(models.Model):
	address_id = models.AutoField(primary_key=True)
	area=models.CharField(max_length=300, blank=False, null=False)
	city =models.CharField(max_length=300, blank=False, null=False)
	state = models.CharField(max_length=300, blank=False, null=False)
	pincode=models.IntegerField(blank=False,null=False)
	def __unicode__(self):
		return str(self.address_id)
	def addressId(self):
		return self.address_id
class Contact(models.Model):
	contact_id = models.AutoField(primary_key=True)
	name=models.CharField(max_length=300, blank=False, null=False)
	email =models.CharField(max_length=300, blank=False, null=False)
	message = models.TextField(max_length=300, blank=False, null=False)
	mobile=models.BigIntegerField(blank=False,null=False)
	def __unicode__(self):
		return str(self.contact_id)
class Career(models.Model):
	career_id = models.AutoField(primary_key=True)
	firstname=models.CharField(max_length=300, blank=False, null=False)
	lastname=models.CharField(max_length=300, blank=False, null=False)
	email =models.CharField(max_length=300, blank=False, null=False)
	subject=models.CharField(max_length=300, blank=False, null=False)
	coverletter = models.TextField(max_length=300, blank=False, null=False)
	resume = models.FileField(blank=False,null=False)
	def __unicode__(self):
		return str(self.career_id)
class Cart(models.Model):
	cart_id = models.AutoField(primary_key=True)
	#check this time thing
	timeOfCreate = AutoDateTimeField(default=timezone.now)
	timeOfUpdate =AutoDateTimeField(default=timezone.now)
	cartTotal = models.IntegerField(default=0)
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    nameOfInstitution = models.CharField(max_length=300, blank=False, null=False)
    nameOfOwner = models.CharField(max_length=300, blank=False, null=False)
    institutionType = models.CharField(max_length=300,choices = institutionTypeChoices , blank=False, null=False)
    mailId =models.CharField(max_length=300, blank=False, null=False)
    mobileNo = models.BigIntegerField(blank=False,null=False,unique=True)
    password = models.CharField(max_length=300, blank=False, null=False)
    gpsLocation = models.CharField(max_length=300,blank=True,null=True)
    profilePhoto = models.ImageField(blank=True,null=True)
    address = models.ForeignKey(Address, blank=True, null=True)
    cart =models.ForeignKey(Cart,blank=False,null=False)
    def profilephotourl(self):
    	return self.profilePhoto.url
    def cartId(self):
    	return self.cart.cart_id
    def userId(self):
		return self.user_id
    def addressId(self):
		return self.address.address_id

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
	status = models.IntegerField(default=0)
	seller = models.ForeignKey(Seller,blank=True,null=True)
	isPerishable = models.NullBooleanField(blank=True,null=True,default=False)
	def coverphotourl(self):
		return self.coverphoto.url
	def productId(self):
		return self.product.product_id
	def __unicode__(self):
		return str(self.name)
class CustomCategoryProducts(models.Model):
	uid=models.AutoField(primary_key=True)
	user = models.ForeignKey(User,blank=False,null=False)
	product = models.ForeignKey(Product, blank=False, null=False)
	def __unicode__(self):
		return str(self.user.nameOfOwner)
class Cartitem(models.Model):
	cartitem_id = models.AutoField(primary_key=True)
	cart=models.ForeignKey(Cart,blank=False,null=False)
	qtyInUnits = models.PositiveIntegerField()
	product = models.ForeignKey(Product,blank=False,null=False)
	def cartItemId(self):
		return self.cartitem_id
class Accartitem(models.Model):
	accartitem_id = models.AutoField(primary_key=True)
	cart=models.ForeignKey(Cart,blank=False,null=False)
	qtyInUnits = models.IntegerField()
	product = models.ForeignKey(Product,blank=False,null=False)
	resason = models.TextField(blank=True,null=True)
class Order(models.Model):
	order_id = models.AutoField(primary_key=True)
	user=models.ForeignKey(User,blank=False,null=False)
	timeOfCreate = AutoDateTimeField(default=timezone.now)
	timeOfUpdate =AutoDateTimeField(default=timezone.now)
	payment_mode = models.CharField(max_length=200,blank=True,null=True)
	subtotal=models.IntegerField(blank=True,null=True)
	status = models.CharField(max_length=200,default='PLACED')
	deliveryTime = models.TextField(blank=True,null=True)
	def orderId(self):
		return self.order_id
class Orderitem(models.Model):
	orderitem_id = models.AutoField(primary_key=True)
	order=models.ForeignKey(Order,blank=False,null=False)
	unit = models.CharField(max_length=100,default='kg')
	qtyInUnits = models.IntegerField()
	priceType = models.CharField(max_length=200,choices=priceType)
	priceAtThatTime = models.IntegerField()
	product = models.ForeignKey(Product,blank=False,null=False)
	def orderItemId(self):
		return self.orderitem_id
class Subscribe(models.Model):
	id = models.AutoField(primary_key=True)
	email = models.TextField(blank=False,null=False)
	def __unicode__(self):
		return str(self.email)

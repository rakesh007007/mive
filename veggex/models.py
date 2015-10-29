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
grades = (
	('Grade-A', 'Grade-A'),
	('Grade-B', 'Grade-B'),
	('Grade-C', 'Grade-C'),
	('Grade-D', 'Grade-D'),
	('',''),

	)
orderTypes = (
	('real','real'),
	('dummy','dummy'),
	)
class AutoDateTimeField(models.DateTimeField):
    def pre_save(self, model_instance, add):
        return timezone.now()
class NotificationManager(models.Manager):	
	def get_queryset(self):
		return super(NotificationManager, self).get_queryset().filter(seen=0)
class MessageManager(models.Manager):	
	def get_queryset(self):
		return super(MessageManager, self).get_queryset().filter(seen=0)
class Seller2Manager(models.Manager):
    def get_queryset(self):
        return super(Seller2Manager, self).get_queryset().filter(status=1)
class Product2Manager(models.Manager):
    def get_queryset(self):
        return super(Product2Manager, self).get_queryset().filter(status=1)
class Sellernotification(models.Model):
	sellernotification_id = models.AutoField(primary_key=True)
	body = models.TextField(null=False,blank=False,default='Test Notification from mive')
	title = models.CharField(max_length=240,null=False,blank=False,default='New Notification')
	link = models.CharField(max_length=240,null=False,blank=False,default='#')
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	seen = models.IntegerField(null=False,blank=False,default=0)
	objects =models.Manager()
	unseen = NotificationManager()
	class Meta:	
		ordering = ['-timeOfCreate']
	def SellernotificationId(self):
		return self.sellernotification_id
	def __unicode__(self):
		return str(self.sellernotification_id)
class Notification(models.Model):
	notification_id = models.AutoField(primary_key=True)
	body = models.TextField(null=False,blank=False,default='Test Notification from mive')
	title = models.CharField(max_length=240,null=False,blank=False,default='New Notification')
	link = models.CharField(max_length=240,null=False,blank=False,default='#')
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	seen = models.IntegerField(null=False,blank=False,default=0)
	objects =models.Manager()
	unseen = NotificationManager()
	class Meta:	
		ordering = ['-timeOfCreate']
	def NotificationId(self):
		return self.notification_id
	def __unicode__(self):
		return str(self.notification_id)
class Message(models.Model):
	message_id = models.AutoField(primary_key=True)
	body = models.TextField(null=False,blank=False,default='body.....')
	title = models.CharField(max_length=240,null=False,blank=False,default='New Notification')
	link = models.CharField(max_length=240,null=False,blank=False,default='#')
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	seen = models.IntegerField(null=False,blank=False,default=0)
	objects =models.Manager()
	unseen = MessageManager()
	class Meta:	
		ordering = ['-timeOfCreate']
	def NotificationId(self):
		return self.notification_id
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
class Mandi(models.Model):
    mandi_id = models.AutoField(primary_key=True)
    nameOfMandi = models.CharField(max_length=300, blank=False, null=False)
    description =models.TextField(blank=False, null=False)
    Photo = models.ImageField(blank=True,null=True)
    address = models.ForeignKey(Address, blank=True, null=True)

    def __unicode__(self):
    	return str(self.nameOfMandi)
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
class Seller(models.Model):
    seller_id = models.AutoField(primary_key=True)
    nameOfSeller = models.CharField(max_length=300, blank=False, null=False)
    mailId =models.CharField(max_length=300, blank=False, null=False)
    mobileNo = models.BigIntegerField(blank=False,null=False,unique=True)
    profilePhoto = models.ImageField(blank=True,null=True)
    address = models.ForeignKey(Address, blank=True, null=True)
    categories = models.CharField(max_length=240,blank=True,null=True)
    rating = models.IntegerField(default=0)
    password = models.CharField(max_length=300, blank=False, null=False,default='pbkdf2_sha256$20000$xcPbF0CMVCyw$eZECZo2qDkuIVr8+UxTiIosfDPdHx6mMQNhUbp3AAjM=')
    status = models.IntegerField(default=0)
    notifications = models.ManyToManyField(Sellernotification,blank=True,default=1)
    objects = models.Manager()
    rak =Seller2Manager() 
    def __unicode__(self):
    	return str(self.nameOfSeller)
    def jsfy(self):
    	return {'seller_id':self.seller_id,'nameOfSeller':self.nameOfSeller}
    def get_query_set(self):
        return super(CustomManager, self).get_query_set().filter(canceled=False)
    def sellerId(self):
    	return self.seller_id
class Product(models.Model):
	product_id = models.AutoField(primary_key=True)
	name=models.CharField(max_length=300,blank=False,null=False)
	description=models.TextField(blank=True,null=True)
	category = models.ForeignKey(Category,blank=True,null=True,default=1)
	popularityIndex = models.IntegerField(blank=True,null=True)
	unit = models.CharField(max_length=100,default='kg')
	priceType = models.CharField(max_length=300,choices=priceType, default='custom rates')
	pricePerUnit = models.IntegerField(blank=False,null=False)
	coverphoto = models.ImageField(default='./No_image_available.png')
	origin = models.CharField(max_length=300,null=True,blank=True,default='')
	maxAvailableUnits=models.IntegerField(null=True,blank=True,default=100000)
	qualityRemarks = models.TextField(null=True,blank=True,default='Custom Product')
	grade = models.CharField(max_length=200,choices=grades,default='')
	status = models.IntegerField(default=1)
	seller = models.ForeignKey(Seller,blank=True,null=True)
	isPerishable = models.NullBooleanField(blank=True,null=True,default=False)
	related_products = models.ManyToManyField("self", blank=True)
	objects = models.Manager()
	rak = Product2Manager()
	def coverphotourl(self):
		return self.coverphoto.url
	def productId(self):
		return self.product.product_id
	def __unicode__(self):
		return str(self.name)+'-'+str(self.grade)+'-'+str(self.origin)
class CategoryVendor(models.Model):
	categoryvendor_id = models.AutoField(primary_key=True)
	seller = models.ForeignKey(Seller,blank=False,null=False)
	products = models.ManyToManyField(Product,blank=True)
	def categoryvendorId(self):
		return self.categoryvendor_id
	def __unicode__(self):
		return str(self.seller.nameOfSeller+"-"+str(self.categoryvendor_id))
class DummyVendor(models.Model):
	dummyvendor_id = models.AutoField(primary_key=True)
	seller = models.ForeignKey(Seller,blank=False,null=False)
	products = models.ManyToManyField(Product,blank=True)
	def dummyvendorId(self):
		return self.dummyvendor_id
	def __unicode__(self):
		return str(self.seller.nameOfSeller+"-"+str(self.dummyvendor_id))
class Contact(models.Model):
	contact_id = models.AutoField(primary_key=True)
	name=models.CharField(max_length=300, blank=False, null=False)
	email =models.CharField(max_length=300, blank=False, null=False)
	message = models.TextField(max_length=300, blank=False, null=False)
	mobile=models.BigIntegerField(blank=False,null=False)
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	timeOfUpdate =models.DateTimeField(default=timezone.now,null=True,blank=True)
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
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	timeOfUpdate =models.DateTimeField(default=timezone.now,null=True,blank=True)
	def __unicode__(self):
		return str(self.career_id)
class Cart(models.Model):
	cart_id = models.AutoField(primary_key=True)
	#check this time thing
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	timeOfUpdate =models.DateTimeField(default=timezone.now,null=True,blank=True)
	cartTotal = models.IntegerField(default=0)
	class Meta:
		ordering = ['timeOfUpdate']
	def __unicode__(self):
		return str(self.cart_id)
class Dummycart(models.Model):
	dummycart_id = models.AutoField(primary_key=True)
	#check this time thing
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	timeOfUpdate =models.DateTimeField(default=timezone.now,null=True,blank=True)
	dummycartTotal = models.IntegerField(default=0)
	class Meta:
		ordering = ['timeOfUpdate']
	def __unicode__(self):
		return str(self.dummycart_id)
class Owner(models.Model):
	owner_id = models.AutoField(primary_key=True)
	nameOfOwner = models.CharField(max_length=300, blank=False, null=False)
	mailId =models.CharField(max_length=300, blank=False, null=False)
	mobileNo = models.BigIntegerField(blank=False,null=False,unique=True)
	profilePhoto = models.ImageField(blank=True,null=True)
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    nameOfInstitution = models.CharField(max_length=300, blank=False, null=False)
    nameOfOwner = models.CharField(max_length=300, blank=False, null=False)
    institutionType = models.CharField(max_length=300,choices = institutionTypeChoices , blank=False, null=False)
    mailId =models.CharField(max_length=300, blank=False, null=False)
    mobileNo = models.BigIntegerField(blank=False,null=False,unique=True)
    description = models.TextField(default='Not available')
    password = models.CharField(max_length=300, blank=False, null=False)
    gpsLocation = models.CharField(max_length=300,blank=True,null=True)
    profilePhoto = models.ImageField(blank=True,null=True)
    address = models.ForeignKey(Address, blank=True, null=True)
    cart =models.ForeignKey(Cart,blank=False,null=False)
    dummycart =models.ForeignKey(Dummycart,blank=False)
    owner = models.ForeignKey(Owner,blank=True, null=True)
    categories = models.ManyToManyField(CategoryVendor,blank=True)
    dummyvendors = models.ManyToManyField(DummyVendor,blank=True)
    creditlimit = models.IntegerField(default=10000,null=True,blank=True)
    notifications = models.ManyToManyField(Notification,blank=True)
    message = models.ManyToManyField(Message,blank=True)
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
class CustomCategoryProducts(models.Model):
	uid=models.AutoField(primary_key=True)
	user = models.ForeignKey(User,blank=False,null=False)
	product = models.ManyToManyField(Product, blank=False, null=False)
	def __unicode__(self):
		return str(self.user.nameOfOwner)
class Cartitem(models.Model):
	cartitem_id = models.AutoField(primary_key=True)
	cart=models.ForeignKey(Cart,blank=False,null=False)
	qtyInUnits = models.PositiveIntegerField()
	product = models.ForeignKey(Product,blank=False,null=False)
	pricePerUnit = models.PositiveIntegerField(blank=False,null=False, default=0)
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	timeOfUpdate =models.DateTimeField(default=timezone.now,null=True,blank=True)
	class Meta:	
		ordering = ['-timeOfCreate']
	def cartItemId(self):
		return self.cartitem_id
	def __unicode__(self):
		return str(self.product.name)
	def jsfy(self):
		return {'cartitem_id':self.cartitem_id,'qtyInUnits':self.qtyInUnits,'timeOfCreate':self.timeOfCreate}
class Dummycartitem(models.Model):
	dummycartitem_id = models.AutoField(primary_key=True)
	dummycart=models.ForeignKey(Dummycart,blank=False,null=False)
	qtyInUnits = models.PositiveIntegerField()
	product = models.ForeignKey(Product,blank=False,null=False)
	pricePerUnit = models.PositiveIntegerField(blank=False,null=False,default=0)
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	timeOfUpdate =models.DateTimeField(default=timezone.now,null=True,blank=True)
	class Meta:	
		ordering = ['-timeOfCreate']
	def cartItemId(self):
		return self.dummycartitem_id
	def __unicode__(self):
		return str(self.product.name)
class Accartitem(models.Model):
	accartitem_id = models.AutoField(primary_key=True)
	cart=models.ForeignKey(Cart,blank=False,null=False)
	qtyInUnits = models.IntegerField()
	product = models.ForeignKey(Product,blank=False,null=False)
	resason = models.TextField(blank=True,null=True)
class Invoiceimage(models.Model):
    invoiceimage_id = models.AutoField(primary_key=True)
    image = models.ImageField(upload_to='./invoices')
class Order(models.Model):
	order_id = models.AutoField(primary_key=True)
	user=models.ForeignKey(User,blank=False,null=False)
	timeOfCreate = models.DateTimeField(default=timezone.now,null=True,blank=True)
	timeOfUpdate =models.DateTimeField(default=timezone.now,null=True,blank=True)
	payment_mode = models.CharField(max_length=200,blank=True,null=True)
	subtotal=models.IntegerField(blank=True,null=True)
	status = models.CharField(max_length=200,default='PLACED')
	orderMsg = models.TextField(blank=True,null=True)
	deliveryTime = models.DateField(blank=True,null=True)
	seller = models.ForeignKey(Seller,blank=True,null=True)
	category = models.ForeignKey(Category,blank=True,null=True)
	invoices = models.ManyToManyField(Invoiceimage,blank=True)
	orderType = models.CharField(max_length=240,blank=False,null=False,choices=orderTypes,default='real')
	class Meta:	
		ordering = ['-timeOfCreate']
	def orderId(self):
		return self.order_id
	def __unicode__(self):
		return str(self.order_id)+str(self.user.nameOfInstitution)
class Orderitem(models.Model):
	orderitem_id = models.AutoField(primary_key=True)
	order=models.ForeignKey(Order,blank=False,null=False)
	unit = models.CharField(max_length=100,default='kg')
	qtyInUnits = models.IntegerField()
	priceType = models.CharField(max_length=200,choices=priceType)
	pricePerUnit = models.IntegerField(blank=False,null=False)
	product = models.ForeignKey(Product,blank=False,null=False)
	def orderItemId(self):
		return self.orderitem_id
class Subscribe(models.Model):
	id = models.AutoField(primary_key=True)
	email = models.TextField(blank=False,null=False)
	def __unicode__(self):
		return str(self.email)
class Currentstock(models.Model):
	currentstock_id = models.AutoField(primary_key=True)
	product = models.ForeignKey(Product,blank=False,null=False)
	user = models.ForeignKey(User,null=False,blank=False,default=1)
	remainingstock = models.FloatField(blank=False,null=False,default=0)
	timeOfCreate = models.DateField(default=timezone.now,null=True,blank=True)
	def __unicode__(self):
		return str(self.product.name)
	class Meta:	
		ordering = ['-timeOfCreate']
class Stockconsumption(models.Model):
	stockwastage_id = models.AutoField(primary_key=True)
	stock  = models.ForeignKey(Currentstock,blank=False,null=False)
	user = models.ForeignKey(User,null=False,blank=False,default=1)
	consumption = models.FloatField(blank=False,null=False,default=0)
	timeOfCreate = models.DateField(default=timezone.now,null=True,blank=True)
	comment = models.TextField(blank=True,null=True)
	def __unicode__(self):
		return str(self.stock)
	class Meta:	
		ordering = ['-timeOfCreate']
class Stockwastage(models.Model):
	stockwastage_id = models.AutoField(primary_key=True)
	stock = models.ForeignKey(Currentstock,blank=False,null=False)
	user = models.ForeignKey(User,null=False,blank=False,default=1)
	wastage = models.FloatField(blank=False,null=False,default=0)
	timeOfCreate = models.DateField(default=timezone.now,null=True,blank=True)
	comment = models.TextField(blank=True,null=True)
	def __unicode__(self):
		return str(self.stock)
	class Meta:	
		ordering = ['-timeOfCreate']
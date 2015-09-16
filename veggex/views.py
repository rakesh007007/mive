from django.shortcuts import render
from django.shortcuts import render
import veggex.views
from veggex.serializers import *
from django.core import serializers as CoreSez

from django.template.response import TemplateResponse
from django.template import Context, loader
from django.http import HttpResponse
from django.contrib import sessions
from rest_framework import viewsets
#from buyold.quickstart import *
from django.middleware import csrf
from veggex.models import *
from mive.settings import *
from django.contrib.sessions.backends.db import SessionStore
from django.shortcuts import redirect
import json
import logging
from django.core.files.storage import default_storage
logger = logging.getLogger(__name__)
from django.core.files.base import ContentFile
#token wala masala

from rest_framework.authtoken.models import Token
from rest_framework.exceptions import ParseError
from rest_framework import status
 
from django.contrib.auth.models import make_password,check_password
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from veggex.serializers import ProductsByCategorySerializer
from rest_framework import generics

class ProductSearchDescriptionList(generics.ListAPIView):
	serializer_class = ProductsByCategorySerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			stext = self.kwargs['pid']
			return Product.objects.filter(description__icontains = stext).filter(status=1)
		except:
			print 'error in ProductsBySearchcategory'
class ProductSearchTitleList(generics.ListAPIView):
	serializer_class = ProductsByCategorySerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			stext = self.kwargs['pid']
			return Product.objects.filter(name__icontains = stext).filter(status=1)
		except:
			print 'error in ProductsSearchTitle'
class ProductsByCategoryList(generics.ListAPIView):
	serializer_class = ProductsByCategorySerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			pid = self.kwargs['pid']
			print 'yo'+pid
			pid= (int)(pid)
			category = Category.objects.get(category_id=pid)
			print category
			return Product.objects.filter(category=category).filter(status=1)
		except:
			print 'error in ProductsByCategoryList'
class ItemsOfCartList(generics.ListAPIView):
	serializer_class = ItemsOfCartSerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			cartId = self.kwargs['cartid']
			cartId= (int)(cartId)
			cart = Cart.objects.get(cart_id=cartId)
			return Cartitem.objects.filter(cart=cart)
		except:
			print 'error in ItemsOfCartList'
		#return Purchase.objects.filter(purchaser__username=username)
class OrdersOfUserList(generics.ListAPIView):
	serializer_class = OrdersOfUserSerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			userId = self.kwargs['userid']
			userId= (int)(userId)
			user = User.objects.get(user_id=userId)
			return Order.objects.filter(user=user)
		except:
			print 'Error in OrdersOfUserList'
		#return Purchase.objects.filter(purchaser__username=username)
class ItemsOfOrderList(generics.ListAPIView):
	serializer_class = ItemsOfOrderSerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			orderId = self.kwargs['orderid']
			orderId= (int)(orderId)
			order = Order.objects.get(order_id=orderId)
			return Orderitem.objects.filter(order=order)
		except:
			print 'error in ItemsOfOrderList'
		#return Purchase.objects.filter(purchaser__username=username)
class ApiSearchList(APIView):

	def get(self, request, format=None):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			searchtext = request.GET['searchtext']
			tex = str(searchtext)
			print tex
			resultCategory1 = Product.objects.filter(category__name__icontains = tex).filter(status=1).values_list()
			resultCategory = CoreSez.serialize("json",resultCategory1)
			resultName = Product.objects.filter(seller__nameOfSeller__icontains = tex).filter(status=1).values_list()
			resultName = CoreSez.serialize("json",resultName)
			resultSeller = Product.objects.filter(name__icontains = tex).filter(status=1).values_list()
			resultSeller = CoreSez.serialize("json",resultSeller)
			resultOrigin = Product.objects.filter(origin__icontains = tex).filter(status=1).values_list()
			resultOrigin = CoreSez.serialize("json",resultOrigin)
			resultDescription = Product.objects.filter(description__icontains=tex).filter(status=1).values_list()
			resultDescription = CoreSez.serialize("json",resultDescription)
			struct = json.loads(resultDescription)
			resultDescription = json.dumps(struct)
			return Response({"resultCategory":resultCategory,"resultName":resultName,"resultSeller":resultSeller,"resultOrigin":resultOrigin,"resultDescription":resultDescription})
		except Exception, e:
			print 'error in ItemsOfOrderList'
			return Response(e)
		#return Purchase.objects.filter(purchaser__username=username)
class CustomCategoryProductsList(generics.ListAPIView):
	serializer_class = CustomCategoryProductsSerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			userId = self.kwargs['userid']
			userId= (int)(userId)
			user = User.objects.get(user_id=userId)
			return CustomCategoryProducts.objects.filter(user=user)
		except:
			print 'error in CustomCategoryProductsList'
		#.raw('select * from veggex_customcategoryproducts natural join veggex_customcategoryproducts_product natural join veggex_product')
		#return Purchase.objects.filter(purchaser__username=username)
class TestView(APIView):
	"""
	"""
 
	def get(self, request, format=None):
		return Response({'detail': "GET Response"})
 
	def post(self, request, format=None):
		try:
			data = request.data
		except ParseError as error:
			return Response(
				'Invalid JSON - {0}'.format(error.detail),
				status=status.HTTP_400_BAD_REQUEST
			)
		if "user" not in data or "password" not in data:
			return Response(
				'Wrong credentials',
				status=status.HTTP_401_UNAUTHORIZED
			)
		user = request.data['user']
		user = str(user)
		password=request.data['password']
		password = str(password)
		print(user=='admin')
		print(password=='givememyfuckingtoken')
		if user=="admin" and password=="givememyfuckingtoken":
			user = authUser.objects.first()
			token = Token.objects.get_or_create(user=user)
			return Response({'detail': 'enjoy!!', 'token': token[0].key})
		else:
			return Response('fuck off you cant get token')

 
		if not user:
			return Response(
				'No default user, please create one',
				status=status.HTTP_404_NOT_FOUND
			)
 
# Create your views here.
#test 3 is for custom category thing
class Test3View(APIView):
	def post(self, request, format=None):
		try:
			pid = request.POST['uid']
			user=User.objects.get(user_id=pid);
			import json
			a=CustomCategoryProducts.objects.get(user=user)
			t= a.product.all()
			print t
			data = CoreSez.serialize("json", [a,])
			print data
			return Response(data)
		except:
			return Response({"status":"error"})
		
		#return Response(data)
class ApiAddToCart(APIView):
	def post(self, request, format=None):
		try:
			data=request.data
			cartId=data['cartId']
			userId=data['userId']
			userId=int(userId)
			cartId=int(cartId)
			items=data['items']
			user=User.objects.get(user_id=userId)
			for i in range(0,len(items)):
				qty=items[str(i+1)]['qty']
				qty = int(qty)
				productId=items[str(i+1)]['productId']
				cart = user.cart
				product = Product.objects.get(product_id=productId)
				check = Cartitem.objects.filter(cart=cart).filter(product=product)
				print 'debug'
				print check
				if(len(check)>0):
					previtem = Cartitem.objects.get(cartitem_id=check[0].cartitem_id)
					print previtem
					print previtem.qtyInUnits
					previtem.qtyInUnits = previtem.qtyInUnits+int(qty)
					cart.cartTotal = cart.cartTotal+int(qty)*int(product.pricePerUnit)
					previtem.save()
					cart.save()
				else:
					cartitem=Cartitem()
					cartitem.cart=cart
					cartitem.qtyInUnits = qty
					totalprice=qty*product.pricePerUnit
					cartitem.product=product
					cart.cartTotal = cart.cartTotal+totalprice
					cartitem.save()
					cart.save()
			return Response({"status":"success"})
		except Exception,e:
			return Response({"status":e})
class ApiUpdateCart(APIView):
	def post(self, request, format=None):
		try:
			data=request.data
			cartId=data['cartId']
			userId=data['userId']
			userId=int(userId)
			cartId=int(cartId)
			items=data['items']
			user=User.objects.get(user_id=userId)
			cart=Cart.objects.get(cart_id=cartId)
			for i in range(0,len(items)):
				qty=items[str(i+1)]['qty']
				qty = int(qty)
				itemId=items[str(i+1)]['itemId']
				if(qty==0):
					acitem=Accartitem()
					acitem_before=Cartitem.objects.get(cartitem_id=itemId)
					acitem.cart=cart
					acitem.resason="deleted from cart"
					acitem.qtyInUnits=acitem_before.qtyInUnits
					acitem.product=acitem_before.product
					cart.cartTotal = cart.cartTotal-acitem_before.qtyInUnits*acitem_before*pricePerUnit
					acitem.save()
					cart.save()
					Cartitem.objects.get(cartitem_id=itemId).delete()
				else:
					item = Cartitem.objects.get(cartitem_id=itemId)
					oldqty =item.qtyInUnits 
					item.qtyInUnits = qty
					cart.cartTotal = cart.cartTotal+qty*item.product.pricePerUnit - oldqty*item.product.pricePerUnit
					item.save()
					cart.save()
			return Response([{"status":"success"}])
		except Exception,e:
			return Response(e)
class ApiMakeOrder(APIView):
	def post(self, request, format=None):
		try:
			data=request.data
			cartId=data['cartId']
			userId=data['userId']
			userId=int(userId)
			cartId=int(cartId)
			deliveryTime = data['deliveryTime']
			user =User.objects.get(user_id=userId)
			payment_mode = 'COD'
			cart =user.cart
			items = Cartitem.objects.filter(cart = cart)
			total=getTotal(items)
			if(len(items)<1):
				print 'no items'
				return Response(['no items to make order'])
			else:
				order = Order()
				order.user = user
				order.payment_mode = payment_mode
				order.subtotal=total
				order.status = 'PLACED'
				order.deliveryTime=deliveryTime
				order.save()
				order_id =order.order_id 
				for itemn in items:
					rak = Orderitem()
					rak.product = itemn.product
					rak.unit=itemn.product.unit
					rak.qtyInUnits = itemn.qtyInUnits
					rak.priceType = itemn.product.priceType
					rak.priceAtThatTime = itemn.product.pricePerUnit
					rak.order = order
					rak.save()
				Cartitem.objects.filter(cart=cart).delete()
				return Response({"status":"success","orderId":order_id})
		except Exception,e:
			return Response([{"status":"error"}])
class UserLoginView(APIView):
	def get(self,request,format=None):
		return Response({'detail': "Post request on this url for user authentication check with mobile and password in body"})
	def post(self, request, format=None):
		try:
			data = request.data
		except ParseError as error:
			return Response("invalid json")
		mobile = request.data['mobile']
		print(mobile)
		print 'yo request coming'
		try:
			password = request.data['password']
			#u= User.objects.filter(mobileNo=mobile).filter(password=password)
			u= User.objects.filter(mobileNo=mobile)
			if(check_password(password,u[0].password)):
				userselized = str(u[0])
				return Response({'result': "true",'user':u[0].user_id})
			else:
				return Response({'result': "false"})
		except:
			return Response({'result': "false"})

		if "mobile" not in data or "password" not in data:
			return Response('Wrong credentials',status=status.HTTP_401_UNAUTHORIZED)
class Test2View(APIView):
	def post(self,request,format=None):
		data =request.data
		print data
		print 'ding'
		print len(data['items'])
		print data['items'][str(2)]
		return HttpResponse('[{"user":"name"}]', content_type='application/json')
		#return Response(data)

class Listproducts(APIView):
	"""
	View to list all users in the system.

	* Requires token authentication.
	* Only admin users are able to access this view.
	"""
	#authentication_classes = (authentication.TokenAuthentication,)
	#permission_classes = (permissions.IsAdminUser,)

	def get(self, request, format=None):
		"""
		Return a list of all users.
		"""
		usernames = [product.name for product in Category.objects.all()]
		return Response(usernames)
class AddressViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Address.objects.all()
	serializer_class = AddressSerializer
class UserViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = User.objects.all()
	serializer_class = UserSerializer
class CategoryViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Category.objects.all()
	serializer_class = CategorySerializer
class UserViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = User.objects.all()
	serializer_class = UserSerializer
class CartViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Cart.objects.all()
	serializer_class = CartSerializer
class CartitemViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Cartitem.objects.all()
	serializer_class = CartitemSerializer
class OrderViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Order.objects.all()
	serializer_class = OrderSerializer
class OrderitemViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Orderitem.objects.all()
	serializer_class = OrderitemSerializer
class ProductViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Product.objects.filter(status=1)
	serializer_class = ProductSerializer
class SellerViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Seller.objects.all()
	serializer_class = SellerSerializer
def get_or_create_csrf_token(request):

	token = request.META.get('CSRF_COOKIE', None)
	if token is None:
		token = csrf._get_new_csrf_key()
		request.META['CSRF_COOKIE'] = token
	request.META['CSRF_COOKIE_USED'] = True
	return token
def landing(request):
			return TemplateResponse(request, 'html/index.html',{'csrf_token':get_or_create_csrf_token(request)})
def getTotal(cartitems):
	total=0
	for itemm in cartitems:
		total = total+itemm.product.pricePerUnit*itemm.qtyInUnits
	return total
def contact(request):
	try:
		name=request.POST['name']
		email=request.POST['email']
		message=request.POST['message']
		mobile = request.POST['mobile']
		con = Contact()
		con.name=name
		con.email =email
		con.mobile=mobile
		con.message=message
		con.save()
		return HttpResponse('Thank You Will get back to you')
	except Exception,e:
		 return HttpResponse(e+"ting")
def career(request):
	try:
		firstname = request.POST['firstname']
		lastname = request.POST['lastname']
		email = request.POST['email']
		coverletter = request.POST['coverletter']
		subject = request.POST['subject']
		resume=request.FILES['resume']
		ting =Career()
		ting.firstname =firstname
		ting.lastname = lastname
		ting.email = email
		ting.coverletter = coverletter
		ting.subject = subject
		ting.resume=resume
		ting.save()
		return HttpResponse('Thank You for applyig to us!! Will get back to you Asap')
	except Exception,e:
		return HttpResponse('Error Processing your request looks like you have provided incorrect inputs')
def shophome(request):
	return TemplateResponse(request, 'new/index.html',{'csrf_token':get_or_create_csrf_token(request)})
def login(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'new/index.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		return redirect('/main')
def docs(request):
	if ('loggedin' not in request.session):
		return redirect('https://github.com/rakesh007007/mive/blob/master/veggex/templates/new/docs.txt')
	else:
		return redirect('https://github.com/rakesh007007/mive/blob/master/veggex/templates/new/docs.txt')

def orderDetail(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		miveuserId = request.session['miveuser']
		miveuser = User.objects.get(user_id=int(miveuserId))
		cart = miveuser.cart
		cartItems = Cartitem.objects.filter(cart=cart)
		totalItems = len(cartItems)
		categories = Category.objects.all()
		user =miveuser
		order_id = request.GET['orderId']
		order = Order.objects.get(order_id=order_id)
		orderItems = Orderitem.objects.filter(order=order)
		return TemplateResponse(request, 'new/orderDetail.html',{'categories':categories,'orderItems':orderItems,'cartItems':cartItems,'totalItems':totalItems,'cart':cart,'order':order,'miveuser':miveuser,'csrf_token':get_or_create_csrf_token(request)})
def ajaxorderDetail(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		order_id = request.POST['order_id']
		order = Order.objects.get(order_id=order_id)
		orderitems = Orderitem.objects.filter(order=order)
		return TemplateResponse(request, 'orderDetail.html',{'orderitems':orderitems,'order':order,'csrf_token':get_or_create_csrf_token(request)})
def tryy(request):
	return TemplateResponse(request, 'webuild/index.html',{'csrf_token':get_or_create_csrf_token(request)})
def subscribe(request):
	email =request.POST['email']
	subscribe=Subscribe()
	subscribe.email = email
	subscribe.save()
	return HttpResponse('Thank you!will get back to you')
def checklogin(request):
	if ('loggedin' not in request.session):
		return False
	else:
		return True
def search(request):
	tex = request.GET['searchtext']
	print tex;
	resultName = Product.objects.filter(name__icontains = tex).filter(status=1)
	resultNameValues = Product.objects.filter(status=1).filter(name__icontains = tex).values('product_id') 
	resultDescription = Product.objects.filter(status=1).filter(description__icontains=tex).exclude(product_id__in=resultNameValues)
	if len(resultName)==0 and len(resultDescription)==0:
		results=0
	else:
		results=1
	if(checklogin(request)==False):
		miveuser='none'
		cart='none'
		customproducts='none'
		cartItems=[]
		totalItems=0
		categories = Category.objects.all()
		return TemplateResponse(request, 'new/search.html',{'resultName':resultName,'resultDescription':resultDescription,'results':results,'cartItems':cartItems,'totalItems':totalItems,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
	else:
		miveuserId = request.session['miveuser']
		miveuser = User.objects.get(user_id=int(miveuserId))
		cart = miveuser.cart
		cartItems = Cartitem.objects.filter(cart=cart)
		totalItems = len(cartItems)
		customproducts='none'
		categories = Category.objects.all()
		return TemplateResponse(request, 'new/search.html',{'resultName':resultName,'resultDescription':resultDescription,'results':results,'cartItems':cartItems,'totalItems':totalItems,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
	return TemplateResponse(request, 'searchResults.html',{'resultCategory':resultCategory,'resultSeller':resultSeller,'resultOrigin':resultOrigin,'resultName':resultName,'resultDescription':resultDescription,'csrf_token':get_or_create_csrf_token(request)})
def searchForm(request):
	return TemplateResponse(request, 'search.html',{'csrf_token':get_or_create_csrf_token(request)})
def logPost(request):
	mobile=request.POST['mobile']
	password = request.POST['password']
	u = User.objects.filter(mobileNo=mobile)
	#uu=Cart.objects.raw('select * from `veggex_cart` natural join `veggex_user` where mobileNo='+str(mobile))
	if(check_password(password,u[0].password)):
		request.session['loggedin']=True
		request.session['mobile']=mobile
		request.session['miveuser']=u[0].user_id
		miveuser = u[0]
		strraw={"mobile":mobile,"password":password}
		#return HttpResponse(str(strraw))
		return redirect('/main')
	else:
		return HttpResponse('Invalid Login credentials')
def ajaxlogPost(request):
	mobile=request.POST['mobile']
	password = request.POST['password']
	u = User.objects.filter(mobileNo=mobile)
	#uu=Cart.objects.raw('select * from `veggex_cart` natural join `veggex_user` where mobileNo='+str(mobile))
	if(check_password(password,u[0].password)):
		request.session['loggedin']=True
		request.session['mobile']=mobile
		request.session['miveuser']=u[0].user_id
		miveuser = u[0]
		cart = miveuser.cart
		cartItems = Cartitem.objects.filter(cart=cart)
		totalItems = len(cartItems)
		customproducts='none'
		allProducts = Product.objects.filter(status=1)
		vegetableProducts = Product.objects.filter(category_id=1).filter(status=1)
		fruitproducts = Product.objects.filter(category_id=2).filter(status=1)
		products = Product.objects.filter(status=1)
		categories = Category.objects.all()
		return TemplateResponse(request, 'new/ajax/shophome.html',{'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
	else:
		miveuser='none'
		cart='none'
		customproducts='none'
		cartItems=[]
		totalItems=0
		categories = Category.objects.all()
		products = Product.objects.filter(status=1)
		strraw={"mobile":mobile,"password":password}
		return HttpResponse(str(strraw))
		#return TemplateResponse(request, 'new/ajax/shophome.html',{'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
def logout(request):
	 if('loggedin' in request.session):
		 del request.session['loggedin']
	 if('mobile' in request.session):
		del request.session['mobile'] 
	 return redirect('/main')
def account(request):
	if(checklogin(request)==False):
		return redirect('/main')
	mobile =request.session['mobile']
	miveuser = User.objects.get(mobileNo=mobile)
	cart = miveuser.cart
	cartItems = Cartitem.objects.filter(cart=cart)
	totalItems = len(cartItems)
	categories = Category.objects.all()
	return TemplateResponse(request, 'new/profile.html',{'cartItems':cartItems,'totalItems':totalItems,'categories':categories,'cart':cart,'miveuser':miveuser,'csrf_token':get_or_create_csrf_token(request)})
def desktophomereload(request):
	limit = request.GET['limit']
	low = int(limit)
	high = int(limit)+8
	products =Product.objects.filter(status=1)[low:high]
	return TemplateResponse(request, 'new/desktophomereload.html',{'products':products,'csrf_token':get_or_create_csrf_token(request)})
def mobilehomereload(request):
	limit = request.GET['limit']
	low = int(limit)
	high = int(limit)+8
	products =Product.objects.filter(status=1)[low:high]
	return TemplateResponse(request, 'new/mobilehomereload.html',{'products':products,'csrf_token':get_or_create_csrf_token(request)})
def desktopcategoryreload(request):
	limit = request.GET['limit']
	low = int(limit)
	high = int(limit)+8
	categoryId=request.GET['categoryId']
	categoryId = int(categoryId)
	category = Category.objects.get(category_id=categoryId)
	products = Product.objects.filter(category=category).filter(status=1)[low:high]
	return TemplateResponse(request, 'new/desktophomereload.html',{'products':products,'csrf_token':get_or_create_csrf_token(request)})
def mobilecategoryreload(request):
	limit = request.GET['limit']
	low = int(limit)
	high = int(limit)+8
	categoryId=request.GET['categoryId']
	categoryId = int(categoryId)
	category = Category.objects.get(category_id=categoryId)
	products = Product.objects.filter(category=category).filter(status=1)[low:high]
	return TemplateResponse(request, 'new/mobilehomereload.html',{'products':products,'csrf_token':get_or_create_csrf_token(request)})
def main(request):
	if(checklogin(request)==False):
		miveuser='none'
		cart='none'
		customproducts='none'
		cartItems=[]
		totalItems=0
		categories = Category.objects.all()
		products = Product.objects.filter(status=1)[:8]
		totalProducts = Product.objects.filter(status=1).count()
		return TemplateResponse(request, 'new/shophome.html',{'totalProducts':totalProducts,'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
	else:
		miveuserId = request.session['miveuser']
		miveuser = User.objects.get(user_id=int(miveuserId))
		cart = miveuser.cart
		cartItems = Cartitem.objects.filter(cart=cart)
		totalItems = len(cartItems)
		customproducts='none'
		allProducts = Product.objects.filter(status=1)[:8]
		vegetableProducts = Product.objects.filter(category_id=1).filter(status=1)
		fruitproducts = Product.objects.filter(category_id=2).filter(status=1)
		products = Product.objects.filter(status=1)[:8]
		totalProducts = Product.objects.filter(status=1).count()
		categories = Category.objects.all()
		return TemplateResponse(request, 'new/shophome.html',{'totalProducts':totalProducts,'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
def productdetail(request):
	productId = request.GET['productId']
	product = Product.objects.get(product_id=productId)
	return TemplateResponse(request, 'new/product.html',{'product':product,'csrf_token':get_or_create_csrf_token(request)})
def get_or_create_cart(user):
	cart = Cart.objects.filter(user=user)
	if(len(cart)==1):
		return cart[0]
	else:
		cart = Cart()
		cart.user=user
		cart.save()
		return cart
def categoryView(request):
	categoryId=request.GET['categoryId']
	categoryId = int(categoryId)
	category = Category.objects.get(category_id=categoryId)
	products = Product.objects.filter(category=category).filter(status=1)[:8]
	totalProducts = Product.objects.filter(category=category).filter(status=1).count()
	print('hola apache rakesh')
	if(checklogin(request)==False):
		miveuser='none'
		cart='none'
		customproducts='none'
		cartItems=[]
		totalItems=0
		categories = Category.objects.all()
		return TemplateResponse(request, 'new/category.html',{'totalProducts':totalProducts,'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
	else:
		miveuserId = request.session['miveuser']
		miveuser = User.objects.get(user_id=int(miveuserId))
		cart = miveuser.cart
		cartItems = Cartitem.objects.filter(cart=cart)
		totalItems = len(cartItems)
		customproducts='none'
		allProducts = Product.objects.filter(status=1)
		vegetableProducts = Product.objects.filter(category_id=1).filter(status=1)
		fruitproducts = Product.objects.filter(category_id=2).filter(status=1)
		categories = Category.objects.all()
		return TemplateResponse(request, 'new/category.html',{'totalProducts':totalProducts,'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
def addtocart(request):
	if(checklogin(request)==False):
		return redirect('/login')
	productId = request.POST['productId']
	productId = (int)(productId)
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	product  = Product.objects.get(product_id=productId)
	qty = request.POST['qty']
	cart = user.cart
	price = product.pricePerUnit
	check = Cartitem.objects.filter(cart=cart).filter(product=product)
	if(len(check)>0):
		previtem = Cartitem.objects.get(cartitem_id=check[0].cartitem_id)
		previtem.qtyInUnits = previtem.qtyInUnits+int(qty)
		cart.cartTotal = cart.cartTotal+int(qty)*int(price)
		previtem.save()
		cart.save()
	else:
		cartitem=Cartitem()
		cartitem.cart=cart
		cartitem.qtyInUnits = qty
		cartitem.product=product
		cart.cartTotal = cart.cartTotal+int(qty)*int(price)
		cart.save()
		cartitem.save()
	return redirect('/cart')
def ajaxaddtocart(request):
	if(checklogin(request)==False):
		return redirect('/login')
	productId = request.POST['productId']
	productId = (int)(productId)
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	product  = Product.objects.get(product_id=productId)
	qty = request.POST['qty']
	cart = user.cart
	price = product.pricePerUnit
	check = Cartitem.objects.filter(cart=cart).filter(product=product)
	if(len(check)>0):
		previtem = Cartitem.objects.get(cartitem_id=check[0].cartitem_id)
		previtem.qtyInUnits = previtem.qtyInUnits+int(qty)
		cart.cartTotal = cart.cartTotal+int(qty)*int(price)
		previtem.save()
		cart.save()
	else:
		cartitem=Cartitem()
		cartitem.cart=cart
		cartitem.qtyInUnits = qty
		cartitem.product=product
		cart.cartTotal = cart.cartTotal+int(qty)*int(price)
		cart.save()
		cartitem.save()
	miveuser = user
	cartItems = Cartitem.objects.filter(cart=cart)
	totalItems = len(cartItems)
	customproducts='none'
	allProducts = Product.objects.filter(status=1)
	products = Product.objects.filter(status=1)
	categories = Category.objects.all()
	return TemplateResponse(request, 'new/ajax/shophome.html',{'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
def removeItemPost(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.POST['item_id']
	itemId = int(itemId)
	item = Cartitem.objects.get(cartitem_id=itemId)
	cart = item.cart
	cart.cartTotal = cart.cartTotal-item.product.pricePerUnit*item.qtyInUnits
	cart.save()
	item.delete()
	return redirect('/cart')
def ajaxremoveItemPost(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.POST['item_id']
	itemId = int(itemId)
	item = Cartitem.objects.get(cartitem_id=itemId)
	cart = item.cart
	cart.cartTotal = cart.cartTotal-item.product.pricePerUnit*item.qtyInUnits
	cart.save()
	item.delete()
	miveuserId = request.session['miveuser']
	miveuser = User.objects.get(user_id=int(miveuserId))
	cart = miveuser.cart
	cartItems = Cartitem.objects.filter(cart=cart)
	totalItems = len(cartItems)
	customproducts='none'
	allProducts = Product.objects.filter(status=1)
	products = Product.objects.filter(status=1)
	categories = Category.objects.all()
	return TemplateResponse(request, 'new/ajax/shophome.html',{'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
def orderStep1(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		
		return TemplateResponse(request, 'orderstep1.html',{'csrf_token':get_or_create_csrf_token(request)})
def seeOrder(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		miveuserId = request.session['miveuser']
		miveuser = User.objects.get(user_id=int(miveuserId))
		cart = miveuser.cart
		cartItems = Cartitem.objects.filter(cart=cart)
		totalItems = len(cartItems)
		categories = Category.objects.all()
		mobile = request.session['mobile']
		user =miveuser
		orders = Order.objects.filter(user=user)
		return TemplateResponse(request, 'new/order.html',{'cartItems':cartItems,'totalItems':totalItems,'cart':cart,'orders':orders,'miveuser':miveuser,'categories':categories,'csrf_token':get_or_create_csrf_token(request)})
def makeOrder(request):
	if ('loggedin' not in request.session):
		return 'not logged in' 
	else:
		print 'yoo'
		mobile = request.session['mobile']
		user =User.objects.filter(mobileNo=mobile)[0]
		payment_mode = 'COD'
		cart =user.cart
		items = Cartitem.objects.filter(cart = cart)
		total=cart.cartTotal
		if(len(items)<1):
			print 'no items'
			return HttpResponse('no items to make order')
		else:
			order = Order()
			order.user = user
			order.payment_mode = payment_mode
			order.subtotal=total
			order.status = 'PLACED'
			order.save()
			order_id =order.order_id 
			for itemn in items:
				rak = Orderitem()
				rak.product = itemn.product
				rak.unit=itemn.product.unit
				rak.qtyInUnits = itemn.qtyInUnits
				miveuser=user
				rak.priceType = itemn.product.priceType
				rak.priceAtThatTime = itemn.product.pricePerUnit
				rak.order = order
				rak.save()
				#fullMsgSender(userId,'Purchase','you have just orderds this shit')
			Cartitem.objects.filter(cart = cart).delete()
			cart.cartTotal=0
			cart.save()
			items = Orderitem.objects.filter(order=order)
			cartItems=Cartitem.objects.filter(cart=cart)
			totalItems=len(cartItems)
			shippingCost=0
			categories = Category.objects.all()
			return TemplateResponse(request, 'new/makeorderreload.html',{'order_id':order_id,'totalItems':totalItems,'miveuser':miveuser,'cart':cart,'shippingCost':shippingCost,'cartItems':cartItems,'categories':categories,'csrf_token':get_or_create_csrf_token(request)})
def cart(request):
	if(checklogin(request)==False):
		return redirect('/main')
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	miveuser=user
	cart=user.cart
	cartItems=Cartitem.objects.filter(cart=cart)
	totalItems=len(cartItems)
	shippingCost=0
	categories = Category.objects.all()
	return TemplateResponse(request, 'new/cart.html',{'totalItems':totalItems,'miveuser':miveuser,'cart':cart,'shippingCost':shippingCost,'cartItems':cartItems,'categories':categories,'csrf_token':get_or_create_csrf_token(request)})



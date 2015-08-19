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

class ProductsByCategoryList(generics.ListAPIView):
    serializer_class = ProductsByCategorySerializer

    def get_queryset(self):
        """
        This view should return a list of all the purchases for
        the user as determined by the username portion of the URL.
        """
        pid = self.kwargs['pid']
        print 'yo'+pid
        pid= (int)(pid)
        category = Category.objects.get(category_id=pid)
        print category
        return Product.objects.filter(category=category)
        #return Purchase.objects.filter(purchaser__username=username)
class ItemsOfCartList(generics.ListAPIView):
    serializer_class = ItemsOfCartSerializer

    def get_queryset(self):
        """
        This view should return a list of all the purchases for
        the user as determined by the username portion of the URL.
        """
        cartId = self.kwargs['cartid']
        cartId= (int)(cartId)
        cart = Cart.objects.get(cart_id=cartId)
        return Cartitem.objects.filter(cart=cart)
        #return Purchase.objects.filter(purchaser__username=username)
class OrdersOfUserList(generics.ListAPIView):
    serializer_class = OrdersOfUserSerializer

    def get_queryset(self):
        """
        This view should return a list of all the purchases for
        the user as determined by the username portion of the URL.
        """
        userId = self.kwargs['userid']
        userId= (int)(userId)
        user = User.objects.get(user_id=userId)
        return Order.objects.filter(user=user)
        #return Purchase.objects.filter(purchaser__username=username)
class ItemsOfOrderList(generics.ListAPIView):
    serializer_class = ItemsOfOrderSerializer

    def get_queryset(self):
        """
        This view should return a list of all the purchases for
        the user as determined by the username portion of the URL.
        """
        orderId = self.kwargs['orderid']
        orderId= (int)(orderId)
        order = Order.objects.get(order_id=orderId)
        return Orderitem.objects.filter(order=order)
        #return Purchase.objects.filter(purchaser__username=username)
class CustomCategoryProductsList(generics.ListAPIView):
    serializer_class = CustomCategoryProductsSerializer

    def get_queryset(self):
        """
        This view should return a list of all the purchases for
        the user as determined by the username portion of the URL.
        """
        userId = self.kwargs['userid']
        userId= (int)(userId)
        user = User.objects.get(user_id=userId)
        return CustomCategoryProducts.objects.filter(user=user)
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
		pid = request.POST['uid']
		user=User.objects.get(user_id=pid);
		import json
		a=CustomCategoryProducts.objects.get(user=user)
		t= a.product.all()
		print t
		data = CoreSez.serialize("json", [a,])
		print data
		return Response(data)
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
				product = Product.objects.get(product_id=productId)
				cart = user.cart
				cartitem=Cartitem()
				cartitem.cart=cart
				cartitem.qtyInUnits = qty
				cartitem.product=product
				cartitem.save()
			return Response([{"status":"success"}])
		except:
			return Response([{"status":"error"}])
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
					acitem.save()
					Cartitem.objects.get(cartitem_id=itemId).delete()
				else:
					item = Cartitem.objects.get(cartitem_id=itemId)
					item.qtyInUnits = qty
					item.save()
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
				return Response([{"status":"success","orderId":order_id}])
		except Exception,e:
			return Response(e)
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
    queryset = Product.objects.all()
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
def getTotal(cartitems):
    total=0
    for itemm in cartitems:
        total = total+itemm.product.pricePerUnit*itemm.qtyInUnits
    return total

def login(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		return redirect('/main')
def orderDetail(request):
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
def logPost(request):
	mobile = request.POST['mobile']
	password = request.POST['password']
	print make_password(password)
	u= User.objects.filter(mobileNo=mobile)
	if(check_password(password,u[0].password)):
		request.session['loggedin']=True
		request.session['mobile'] = mobile
		return redirect('/main')
	else:
		return redirect('/login')
def logout(request):
	 if('loggedin' in request.session):
	 	 del request.session['loggedin']
	 if('mobile' in request.session):
	 	del request.session['mobile'] 
	 return TemplateResponse(request, 'logout.html',{'csrf_token':get_or_create_csrf_token(request)})
def account(request):
	if(checklogin(request)==False):
		return redirect('/login')
	mobile =request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	return TemplateResponse(request, 'account.html',{'user':user,'csrf_token':get_or_create_csrf_token(request)})
def main(request):
	if(checklogin(request)==False):
		return redirect('/login')
	categories =Category.objects.all()
	return TemplateResponse(request, 'main.html',{'categories':categories,'csrf_token':get_or_create_csrf_token(request)})
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
	if(checklogin(request)==False):
		return redirect('/login')
	categoryId=request.GET['categoryId']
	category = Category.objects.get(category_id=categoryId)
	products = Product.objects.filter(category=category)
	return TemplateResponse(request, 'categoryView.html',{'products':products,'csrf_token':get_or_create_csrf_token(request)})
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
	cartitem=Cartitem()
	cartitem.cart=cart
	cartitem.qtyInUnits = qty
	cartitem.product=product
	cartitem.save()
	return redirect('/cart')
def removeItemPost(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.POST['item_id']
	Cartitem.objects.filter(cartitem_id=itemId).delete()
	return redirect('/cart')
def orderStep1(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		
		return TemplateResponse(request, 'orderstep1.html',{'csrf_token':get_or_create_csrf_token(request)})
def seeOrder(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		mobile = request.session['mobile']
		user =User.objects.filter(mobileNo=mobile)[0]
		orders = Order.objects.filter(user=user)
		return TemplateResponse(request, 'order.html',{'orders':orders,'csrf_token':get_or_create_csrf_token(request)})
def makeOrder(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		print 'yoo'
		mobile = request.session['mobile']
		user =User.objects.filter(mobileNo=mobile)[0]
		payment_mode = 'COD'
		cart =get_or_create_cart(user)
		items = Cartitem.objects.filter(cart = cart)
		total=getTotal(items)
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
				rak.priceType = itemn.product.priceType
				rak.priceAtThatTime = itemn.product.pricePerUnit
				rak.order = order
				rak.save()
				#fullMsgSender(userId,'Purchase','you have just orderds this shit')
			Cartitem.objects.filter(cart = cart).delete()
			return redirect('/seeOrder')
def cart(request):
	if(checklogin(request)==False):
		return redirect('/login')
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	cart = get_or_create_cart(user)
	cartitems = Cartitem.objects.filter(cart=cart)
	shippingCost=0
	if(len(cartitems)>0):
		noitem=0
	else:
		noitem=1
	carttotal=getTotal(cartitems)
	return TemplateResponse(request, 'cart.html',{'noitem':noitem,'carttotal':carttotal,'shippingCost':shippingCost,'cartitems':cartitems,'cart':cart,'csrf_token':get_or_create_csrf_token(request)})



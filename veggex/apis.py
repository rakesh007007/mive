from base import *
class ProductSearchDescriptionList(generics.ListAPIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	serializer_class = ProductsByCategorySerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			stext = self.kwargs['pid']
			resultNameValues = Product.objects.filter(name__icontains = stext).filter(status=1).values('product_id')
			return Product.objects.filter(description__icontains = stext).filter(status=1).exclude(product_id__in=resultNameValues)
		except:
			print 'error in ProductsBySearchcategory'
class ProductSearchTitleList(generics.ListAPIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
					cart.cartTotal = cart.cartTotal-acitem_before.qtyInUnits*acitem_before.product.pricePerUnit
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	def post(self, request, format=None):
		try:
			data=request.data
			cartId=data['cartId']
			userId=data['userId']
			userId=int(userId)
			cartId=int(cartId)
			deliveryTime = data['deliveryTime']
			orderMsg = data['orderMsg']
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
				order.orderMsg=orderMsg
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
			return Response([{"status":e])
class UserLoginView(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
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
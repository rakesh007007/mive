from base import *
from rest_framework.parsers import *
def getTotal(cartitems):
	total=0
	for itemm in cartitems:
		total = total+itemm.product.pricePerUnit*itemm.qtyInUnits
	return total
class StockList(generics.ListAPIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	serializer_class = StockSerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			userId = self.kwargs['pid']
			resultStocks = Currentstock.objects.filter(user__user_id =int(userId) )
			return resultStocks
		except:
			print 'error in StockList'
class ProductSearchDescriptionList(generics.ListAPIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	serializer_class = ProductSerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			stext = self.kwargs['pid']
			userId = self.kwargs['userId']
			user = User.objects.get(user_id=userId)
			allvendors = user.categories.all()
			pds= []
			for i in allvendors:
				allpds = i.products.all()
				for pd in allpds:
					pds.append(pd.product_id)
			resultNameValues = Product.rak.filter(name__icontains = stext).filter(status=1).values('product_id')
			return Product.rak.filter(description__icontains = stext).filter(product_id__in=pds).exclude(product_id__in=resultNameValues)
		except:
			print 'error in ProductsBySearchcategory'
class ProductSearchTitleList(generics.ListAPIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	serializer_class = ProductSerializer

	def get_queryset(self):
		"""
		This view should return a list of all the purchases for
		the user as determined by the username portion of the URL.
		"""
		try:
			stext = self.kwargs['pid']
			userId = self.kwargs['userId']
			user = User.objects.get(user_id=userId)
			allvendors = user.categories.all()
			pds= []
			for i in allvendors:
				allpds = i.products.all()
				for pd in allpds:
					pds.append(pd.product_id)
			return Product.rak.filter(name__icontains = stext).filter(product_id__in=pds)
		except:
			print 'error in ProductsSearchTitle'
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
class ApiAddToWastage(APIView):
	@transaction.atomic
	def post(self, request, format=None):
		try:
			data = request.data
			userId = int(data['userId'])
			stockId= int(data['stockId'])
			miveuser = User.objects.get(user_id = userId)
			stock = Currentstock.objects.get(currentstock_id = stockId)
			remainingstock = stock.remainingstock
			stock.remainingstock=0
			stock.save()
			stcons = Stockwastage()
			stcons.stock = stock
			stcons.wastage = remainingstock
			stcons.user = miveuser
			stcons.save()
			return Response({"result":"success"})
		except Exception,e:
			Response({"result":"error"})
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
class ApiAddToConsumption(APIView):
	@transaction.atomic
	def post(self, request, format=None):
		try:
			data = request.data
			stockId = data['stockId']
			cons = int(data['qty'])
			userId = data['userId']
			miveuser = User.objects.get(user_id = int(userId))
			stock = Currentstock.objects.get(currentstock_id=stockId)
			stcons = Stockconsumption()
			stcons.stock = stock
			stcons.user=miveuser
			if stock.remainingstock>cons and cons>0:
				stock.remainingstock = stock.remainingstock-cons
			else:
				stock.remainingstock = 0
				cons=0
			stock.save()
			stcons.consumption = cons
			stcons.save()
			return Response({"result":"success"})
		except Exception,e:
			return Response({"result":"error"})
class ApiAddToCart(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	@transaction.atomic
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
				priceperunit = product.pricePerUnit
				check = Cartitem.objects.filter(cart=cart).filter(product=product)
				if(len(check)>0):
					previtem = Cartitem.objects.get(cartitem_id=check[0].cartitem_id)
					print previtem
					print previtem.qtyInUnits
					previtem.qtyInUnits = previtem.qtyInUnits+int(qty)
					cart.cartTotal = cart.cartTotal+int(qty)*int(priceperunit)
					previtem.save()
					cart.save()
				else:
					cartitem=Cartitem()
					cartitem.cart=cart
					cartitem.qtyInUnits = qty
					totalprice=qty*priceperunit
					cartitem.product=product
					cart.cartTotal = cart.cartTotal+totalprice
					cartitem.save()
					cart.save()
			return Response({"status":"success"})
		except Exception,e:
			return Response({"status":e})
class ApiAddToDummyCart(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	@transaction.atomic
	def post(self, request, format=None):
		try:
			data=request.data
			dummycartId=data['dummycartId']
			userId=data['userId']
			userId=int(userId)
			dummycartId=int(dummycartId)
			items=data['items']
			user=User.objects.get(user_id=userId)
			for i in range(0,len(items)):
				qty=items[str(i+1)]['qty']
				priceperunit=items[str(i+1)]['pricePerUnit']
				qty = int(qty)
				priceperunit = int(priceperunit)
				productId=items[str(i+1)]['productId']
				dummycart = user.dummycart
				product = Product.rak.get(product_id=productId)
				check = Dummycartitem.objects.filter(dummycart=dummycart).filter(product=product).filter(pricePerUnit=priceperunit)
				if(len(check)>0):
					previtem = Dummycartitem.objects.get(dummycartitem_id=check[0].dummycartitem_id)
					previtem.qtyInUnits = previtem.qtyInUnits+int(qty)
					dummycart.dummycartTotal = dummycart.dummycartTotal+int(qty)*int(priceperunit)
					previtem.save()
					dummycart.save()
				else:
					dummycartitem=Dummycartitem()
					dummycartitem.dummycart=dummycart
					dummycartitem.qtyInUnits = qty
					dummycartitem.pricePerUnit = priceperunit
					totalprice=qty*priceperunit
					dummycartitem.product=product
					dummycart.dummycartTotal = dummycart.dummycartTotal+totalprice
					dummycartitem.save()
					dummycart.save()
			return Response({"status":"success"})
		except Exception,e:
			return Response({"status":e,"type":"error"})
class ApiUpdateCart(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	@transaction.atomic
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
					cart.cartTotal = cart.cartTotal-acitem_before.qtyInUnits*acitem_before.pricePerUnit
					acitem.save()
					cart.save()
					Cartitem.objects.get(cartitem_id=itemId).delete()
				else:
					item = Cartitem.objects.get(cartitem_id=itemId)
					oldqty =item.qtyInUnits 
					item.qtyInUnits = qty
					cart.cartTotal = cart.cartTotal+qty*item.pricePerUnit - oldqty*item.pricePerUnit
					item.save()
					cart.save()
			return Response([{"status":"success"}])
		except Exception,e:
			return Response(e)
class ApiUpdateDummyCart(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	@transaction.atomic
	def post(self, request, format=None):
		try:
			data=request.data
			dummycartId=data['dummycartId']
			userId=data['userId']
			userId=int(userId)
			dummycartId=int(dummycartId)
			items=data['items']
			user=User.objects.get(user_id=userId)
			dummycart=Dummycart.objects.get(dummycart_id=dummycartId)
			for i in range(0,len(items)):
				qty=items[str(i+1)]['qty']
				qty = int(qty)
				pricePerUnit = items[str(i+1)]['pricePerUnit']
				pricePerUnit = int(pricePerUnit)
				itemId=items[str(i+1)]['itemId']
				if(qty==0):
					acitem_before=Dummycartitem.objects.get(dummycartitem_id=itemId)
					dummycart.dummycartTotal = dummycart.dummycartTotal-acitem_before.qtyInUnits*acitem_before.pricePerUnit+qty*pricePerUnit
					cart.save()
					Dummycartitem.objects.get(dummycartitem_id=itemId).delete()
				else:
					item = Dummycartitem.objects.get(dummycartitem_id=itemId)
					oldqty =item.qtyInUnits 
					item.qtyInUnits = qty
					dummycart.dummycartTotal = dummycart.dummycartTotal+qty*pricePerUnit - oldqty*item.pricePerUnit
					item.pricePerUnit = pricePerUnit
					item.save()
					dummycart.save()
			return Response([{"status":"success"}])
		except Exception,e:
			return Response(e)
class ApiSeeOrder(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	@transaction.atomic
	def post(self,request,format=None):
		userId = request.data['userId']
		miveuser=User.objects.get(user_id = int(userId))
		localtz = pytz.timezone('Asia/Kolkata')
		aaj = date.today()
		days =request.data['days']
		sellers = request.data['sellers']
		d=[]
		for js in sellers:
			d.append(int(js['sellerId']))
		sellers=d
		payment=request.data['payment']
		sortby = request.data['sortby']
		beforedays = date.today() - timedelta(days=int(days))
		timeaaj = datetime.combine(aaj, datetime.max.time()).replace(tzinfo=localtz)
		timebeforedays = datetime.combine(beforedays, datetime.max.time()).replace(tzinfo=localtz)
		if payment=='all':
			orders = Order.objects.filter(seller__seller_id__in=sellers).filter(user=miveuser).filter(deliveryTime__gt=timebeforedays)
		else:
			orders = Order.objects.filter(user=miveuser).filter(seller__seller_id__in=sellers).filter(payment=payment).filter(deliveryTime__gt=timebeforedays)
		if (sortby=='date'):
			orders=orders.order_by('-deliveryTime')
		elif (sortby=='subtotal'):
			orders=orders.order_by('-subtotal')
		elif (sortby=='status'):
			orders=orders.order_by('-status')
		else:
			orders=orders.order_by('-seller__nameOfSeller')
		print orders
		l=[]
		for p in orders:
			l.append(OrderSerializer(p,context={'request': request}).data)
		orders = l
		return HttpResponse(JSONRenderer().render(orders),content_type='application/json')
class ApiSeePrices(APIView):
	@transaction.atomic
	def post(self,request,format=None):
		localtz = pytz.timezone('Asia/Kolkata')
		userId = request.data['userId']
		miveuser = User.objects.get(user_id=userId)
		aaj = date.today()
		days =request.data['days']
		sortby = request.data['sortby']
		beforedays = date.today() - timedelta(days=int(days))
		timeaaj = datetime.combine(aaj, datetime.max.time()).replace(tzinfo=localtz)
		timebeforedays = datetime.combine(beforedays, datetime.max.time()).replace(tzinfo=localtz)
		orders = Order.objects.filter(user=miveuser).filter(timeOfCreate__lte=timeaaj ).filter(timeOfCreate__gt=timebeforedays).order_by('-timeOfCreate')
		orderids = orders.values('order_id')
		print orderids
		uniqueitems = []
		times =[]
		products = []
		orderItems= Orderitem.objects.filter(order_id__in=orderids).order_by('order__timeOfCreate')
		i=0
		j=0
		for ite in orderItems:
			if ite.product in products:
				index = products.index(ite.product)
				if ite.order.timeOfCreate>times[index]:
					times[index]=ite.order.timeOfCreate
					currentprice = ite.pricePerUnit
					nextitem = Orderitem.objects.filter(order__user=miveuser).filter(product=ite.product).filter(order__timeOfCreate__gte=timebeforedays).order_by('order__timeOfCreate')[:1]
					previtem = Orderitem.objects.filter(order__user=miveuser).filter(product=ite.product).filter(order__timeOfCreate__lte=timebeforedays).order_by('-order__timeOfCreate')[:1]
					if len(nextitem)!=0 and len(previtem)!=0 and nextitem[0].order.timeOfCreate-timebeforedays>timebeforedays-previtem[0].order.timeOfCreate:
						closestorderitem = previtem[0]
					else:
						closestorderitem = nextitem[0]
					lastprice = closestorderitem.pricePerUnit 
					increase = currentprice-lastprice
					sign=increase*100/lastprice
					impact = increase*ite.qtyInUnits
					ite = OrderitemSerializer(ite,context={'request': request})
					bucket= {'pd':ite.data,'currentprice':currentprice,'lastprice':lastprice,'sign':sign,'impact':impact}
					uniqueitems[index]=bucket
			else:
				products.append(ite.product)
				times.append(ite.order.timeOfCreate)
				currentprice = ite.pricePerUnit
				nextitem = Orderitem.objects.filter(order__user=miveuser).filter(product=ite.product).filter(order__timeOfCreate__gte=timebeforedays).order_by('order__timeOfCreate')[:1]
				previtem = Orderitem.objects.filter(order__user=miveuser).filter(product=ite.product).filter(order__timeOfCreate__lte=timebeforedays).order_by('-order__timeOfCreate')[:1]
				if len(nextitem)!=0 and len(previtem)!=0 and nextitem[0].order.timeOfCreate-timebeforedays>timebeforedays-previtem[0].order.timeOfCreate:
					closestorderitem = previtem[0]
				else:
					closestorderitem = nextitem[0]
				lastprice = closestorderitem.pricePerUnit 
				increase = currentprice-lastprice
				sign=increase*100/lastprice
				impact = increase*ite.qtyInUnits
				ite = OrderitemSerializer(ite,context={'request': request})
				bucket= {'pd':ite.data,'currentprice':currentprice,'lastprice':lastprice,'sign':sign,'impact':impact}
				uniqueitems.append(bucket)
		if (sortby=='impact'):
			uniqueitems = sorted(uniqueitems, key=lambda k: k['impact'])
		elif (sortby=='old'):
			uniqueitems = sorted(uniqueitems, key=lambda k: k['lastprice'])
		elif (sortby=='current'):
			uniqueitems = sorted(uniqueitems, key=lambda k: k['currentprice'],reverse=True)
		else:
			uniqueitems = sorted(uniqueitems, key=lambda k: k['sign'])
		return HttpResponse(JSONRenderer().render(uniqueitems),content_type='application/json')
class ApiSeeCart(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	def get(self,request,format=None):
		try:
			userId = request.GET['userId']
			miveuser=User.objects.get(user_id = userId)
			cart=miveuser.cart
			cartItems=Cartitem.objects.filter(cart=cart)
			totalItems=len(cartItems)
			shippingCost=0
			categoryvendor= miveuser.categories
			allProducts = []
			for cvend in categoryvendor.all():
				categoryvendor_id = cvend.categoryvendor_id
				seller = cvend.seller
				jsseller = SellerSerializer(seller,context={'request': request})
				itemscount = Cartitem.objects.filter(product__seller = seller).filter(cart=cart).count()
				if itemscount>0:
					items = Cartitem.objects.filter(product__seller = seller).filter(cart=cart)
					t =[]
					for p in items:
						jsitem = CartitemSerializer(p,context={'request': request}).data
						t.append(jsitem)
					jsitems =t
					pd = {'categoryvendor_id':categoryvendor_id,'seller':jsseller.data,'items':jsitems}
					allProducts.append(pd)
				else:
					pass
			return HttpResponse(JSONRenderer().render(allProducts),content_type='application/json')
		except Exception,e:
			return HttpResponse(e)
class ApiSeeDummyCart(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	def get(self,request,format=None):
		try:
			userId = request.GET['userId']
			miveuser=User.objects.get(user_id = userId)
			dummycart=miveuser.dummycart
			dummycartItems=Dummycartitem.objects.filter(dummycart=dummycart)
			totalItems=len(dummycartItems)
			shippingCost=0
			dummyvendor= miveuser.dummyvendors
			allProducts = []
			for cvend in dummyvendor.all():
				dummyvendor_id = cvend.dummyvendor_id
				seller = cvend.seller
				jsseller = SellerSerializer(seller,context={'request': request})
				itemscount = Dummycartitem.objects.filter(product__seller = seller).filter(dummycart=dummycart).count()
				if itemscount>0:
					items = Dummycartitem.objects.filter(product__seller = seller).filter(dummycart=dummycart)
					t =[]
					for p in items:
						jsitem = DummycartitemSerializer(p,context={'request': request}).data
						t.append(jsitem)
					jsitems =t
					pd = {'dummyvendor_id':dummyvendor_id,'seller':jsseller.data,'items':jsitems}
					allProducts.append(pd)
				else:
					pass
			return HttpResponse(JSONRenderer().render(allProducts),content_type='application/json')
		except Exception,e:
			return HttpResponse(e)
class ApiMakeOrder(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	@transaction.atomic
	def post(self, request, format=None):
		data=request.data
		cartId=data['cartId']
		userId=data['userId']
		sellerId = int(data['sellerId'])
		userId=int(userId)
		cartId=int(cartId)
		seller = Seller.rak.get(seller_id = sellerId)
		deliveryTime = data['deliveryTime']
		orderMsg = data['orderMsg']
		user =User.objects.get(user_id=userId)
		payment_mode = 'COD'
		cart =user.cart
		items = Cartitem.objects.filter(cart = cart).filter(product__seller = seller)
		total=cart.cartTotal
		if(len(items)<1):
			print 'no items'
			return Response(['no items to make order'])
		else:
			order = Order()
			order.user = user
			order.payment_mode = payment_mode
			order.subtotal=total
			order.seller = seller
			order.status = 'PLACED'
			order.deliveryTime=deliveryTime
			order.orderMsg=orderMsg
			order.save()
			miveuser.creditlimit=miveuser.creditlimit-total
			n = Notification()
			n.title='Order Placed'
			n.body='Your order has been placed succesfully with orderId:'+str(order_id)
			n.link = 'orderDetail?orderId='+str(order.order_id)
			n.save()
			miveuser.notifications.add(n)
			miveuser.save()
			order_id =order.order_id 
			su = 0
			for itemn in items:
				rak = Orderitem()
				rak.product = itemn.product
				su = su + itemn.pricePerUnit*itemn.qtyInUnits
				stock = Currentstock.objects.filter(product=itemn.product)
				if(len(stock)>0):
					currStock = stock[0]
					currStock.remainingstock= currStock.remainingstock+itemn.qtyInUnits
					currStock.save()
				else:
					currStock = Currentstock()
					currStock.product = itemn.product
					currStock.remainingstock=itemn.qtyInUnits
					currStock.save()
				rak.unit=itemn.product.unit
				rak.qtyInUnits = itemn.qtyInUnits
				rak.priceType = itemn.product.priceType
				rak.pricePerUnit = itemn.pricePerUnit
				rak.order = order
				itemn.delete()
				rak.save()
			cart.cartTotal = cart.cartTotal - su
			cart.save()
			return Response({"status":"success","orderId":order_id})
class ApiMakeOrderDummy(APIView):
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	parser_classes = (MultiPartParser,FormParser,)
	@transaction.atomic
	def post(self, request, format=None):
		data=request.data
		dummycartId=data['dummycartId']
		userId=data['userId']
		payment=data['payment']
		tt = data['total']
		sellerId = int(data['sellerId'])
		userId=int(userId)
		dummycartId=int(dummycartId)
		seller = Seller.rak.get(seller_id = sellerId)
		deliveryTime = data['deliveryTime']
		orderMsg = data['orderMsg']
		user =User.objects.get(user_id=userId)
		payment_mode = 'COD'
		dummycart =user.dummycart
		items = Dummycartitem.objects.filter(dummycart = dummycart).filter(product__seller = seller)
		if int(tt)!=0:
			total = int(tt)
		else:
			total=dummycart.dummycartTotal
		if(len(items)<1):
			print 'no items'
			return Response(['no items to make order'])
		else:
			order = Order()
			order.user = user
			order.payment_mode = payment_mode
			order.subtotal=total
			order.payment = payment
			order.seller = seller
			order.status = 'PLACED'
			order.deliveryTime=deliveryTime
			order.orderMsg=orderMsg
			order.save()
			n = Notification()
			n.title='Order Placed'
			n.body='Your order has been placed succesfully with orderId:'+str(order_id)
			n.link = 'orderDetail?orderId='+str(order.order_id)
			n.save()
			for afile in request.data['image']:
				print '>>>>>>>check'
				print afile
			 	d = Invoiceimage()
			 	d.image = afile
			 	d.save()
			 	order.invoices.add(d)
			 	order.save()
			order_id =order.order_id 
			su = 0
			for itemn in items:
				rak = Orderitem()
				rak.product = itemn.product
				su = su + itemn.pricePerUnit*itemn.qtyInUnits
				stock = Currentstock.objects.filter(product=itemn.product)
				if(len(stock)>0):
					currStock = stock[0]
					currStock.remainingstock= currStock.remainingstock+itemn.qtyInUnits
					currStock.save()
				else:
					currStock = Currentstock()
					currStock.product = itemn.product
					currStock.remainingstock=itemn.qtyInUnits
					currStock.save()
				rak.unit=itemn.product.unit
				rak.qtyInUnits = itemn.qtyInUnits
				rak.priceType = itemn.product.priceType
				rak.pricePerUnit = itemn.pricePerUnit
				rak.order = order
				rak.product.pricePerUnit=itemn.pricePerUnit
				rak.product.save()
				itemn.delete()
				rak.save()
			dummycart.dummycartTotal = dummycart.dummycartTotal - su
			dummycart.save()
			return Response({"status":"success","orderId":order_id})
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
class CategoryVendorViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = CategoryVendor.objects.all()
	serializer_class = CategoryVendorSerializer
class DummyVendorViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = DummyVendor.objects.all()
	serializer_class = DummyVendorSerializer
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
class InvocieimageViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Invoiceimage.objects.all()
	serializer_class = InvoiceimageSerializer
class CartViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Cart.objects.all()
	serializer_class = CartSerializer
class DummycartViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Dummycart.objects.all()
	serializer_class = DummycartSerializer
class CartitemViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Cartitem.objects.all()
	serializer_class = CartitemSerializer
class DummycartitemViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Dummycartitem.objects.all()
	serializer_class = DummycartitemSerializer
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
	queryset = Product.rak.filter(status=1)
	serializer_class = ProductSerializer
class SellerViewSet(viewsets.ModelViewSet):
	"""
	API endpoint that allows users to be viewed or edited.
	"""
	#authentication_classes = (TokenAuthentication,)
	#permission_classes = (IsAuthenticated,)
	queryset = Seller.rak.all()
	serializer_class = SellerSerializer
class RakeshViewSet(viewsets.ViewSet):
    def list(self, request):
        queryset = User.objects.all()
        serializer = UserSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = User.objects.all()
        user = get_object_or_404(queryset, pk=pk)
        serializer = UserSerializer(user)
        return Response(serializer.data)
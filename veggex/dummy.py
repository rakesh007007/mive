from base import *
from views import *
from django.views.decorators.csrf import csrf_exempt
def giveajaxdummycart(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	miveuser=basics['miveuser']
	dummycart=miveuser.dummycart
	cartItems=Dummycartitem.objects.filter(dummycart=dummycart)
	totalItems=len(cartItems)
	shippingCost=0
	dummyvendor= miveuser.dummyvendors
	allProducts = []
	for cvend in dummyvendor.all():
		dummyvendor_id = cvend.dummyvendor_id
		seller = cvend.seller
		print 'yochecker'
		print seller
		itemscount = Dummycartitem.objects.filter(product__seller = seller).filter(dummycart=dummycart).count()
		print itemscount
		if itemscount>0:
			items = Dummycartitem.objects.filter(product__seller = seller).filter(dummycart=dummycart)
			totalP = items.aggregate(total=Sum(F('pricePerUnit')*F('qtyInUnits')))
			total = totalP['total']
			pd = {'dummyvendor_id':dummyvendor_id,'items':items,'seller':seller,'total':total}
			allProducts.append(pd)
		else:
			pass
	return allProducts
def dummymain(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		orders = Order.objects.filter(user=miveuser)
		norders = orders.count()
		rorders = orders.aggregate(Sum('subtotal'))
		rorders =rorders['subtotal__sum']
		stockwastage = Stockwastage.objects.filter(user=miveuser)
		d= 0
		for p in stockwastage:
			d= d+ p.stock.product.pricePerUnit*p.wastage
		return TemplateResponse(request, 'adminr/dummy/index.html',{'wastage':d,'norders':norders,'rorders':rorders,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
def dummyproductfilter(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		miveuser=basics['miveuser']
		categoryfilter = request.POST['categoryfilter']
		dummyvendorid=request.POST['dummyvendorid']
		dummyVendor = DummyVendor.objects.get(dummyvendor_id=dummyvendorid)
		if int(categoryfilter)==0:
			products = dummyVendor.products.all()
			return TemplateResponse(request,'adminr/dummy/productfilter.html',{'products':products})
		else:
			category = Category.objects.get(category_id=int(categoryfilter))
			products = dummyVendor.products.filter(category=category)
			return TemplateResponse(request,'adminr/dummy/productfilter.html',{'products':products})
def dummynormalproductfilter(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		miveuser=basics['miveuser']
		categoryfilter = request.POST['categoryfilter']
		if int(categoryfilter)==0:
			products = Product.objects.all()
			return TemplateResponse(request,'adminr/dummy/normalproductfilter.html',{'products':products})
		else:
			category = Category.objects.get(category_id=int(categoryfilter))
			products = Product.objects.filter(category=category)
			return TemplateResponse(request,'adminr/dummy/normalproductfilter.html',{'products':products})
def dummyVendorView(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		miveuser=basics['miveuser']
		dummyVendorId=request.GET['dummyVendorId']
		dummyVendorId = int(dummyVendorId)
		dummyVendor = DummyVendor.objects.get(dummyvendor_id=dummyVendorId)
		seller = dummyVendor.seller
		categories = Category.objects.all()
		products = dummyVendor.products
		return TemplateResponse(request,'adminr/dummy/dummyvendor.html',{'categories':categories,'dmv':dummyVendor,'basics':basics,'products':products,'seller':seller,'csrf_token':get_or_create_csrf_token(request)})
def dummyproductdetail(request):
	productId = request.GET['productId']
	product = Product.rak.get(product_id=productId)
	return TemplateResponse(request, 'adminr/dummy/product.html',{'product':product,'csrf_token':get_or_create_csrf_token(request)})
@csrf_exempt
@transaction.atomic
def ajaxdummycartupdate(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		dt = request.POST
		basics = basicinfo(request)
		itemdetails = json.loads(dt['dt'])
		miveuser = basics['miveuser']
		dummycart = miveuser.dummycart
		total=0.0
		for it in itemdetails:
			pdid = (it['dummyitemid'])
			qty = float(it['qty'])
			pricePerUnit = float(it['priceperunit'])
			if qty<=0 or pricePerUnit<=0:
				continue
			ct = Dummycartitem.objects.filter(dummycart=dummycart).filter(dummycartitem_id=pdid).count()
			if ct>0:
				oldit = Dummycartitem.objects.filter(dummycart=dummycart).filter(dummycartitem_id=pdid)[0]
				total = total+(qty-oldit.qtyInUnits)*oldit.pricePerUnit
				oldit.qtyInUnits = qty
				oldit.pricePerUnit=pricePerUnit
				oldit.save()
			else:
				continue
		dummycart.dummycartTotal = dummycart.dummycartTotal+total
		dummycart.save()
		allProducts = giveajaxdummycart(request)
		return TemplateResponse(request, 'adminr/dummy/dummycartreload.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
@csrf_exempt
@transaction.atomic
def newajaxaddtodummycart(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		dt = request.POST
		basics = basicinfo(request)
		productdetails = json.loads(dt['dt'])
		miveuser = basics['miveuser']
		dummycart = miveuser.dummycart
		total=0
		for it in productdetails:
			pdid = (it['productId'])
			qty = float(it['qty'])
			pricePerUnit = float(it['priceperunit'])
			if qty<=0 or pricePerUnit<0:
				continue
			pd = Product.objects.get(product_id=pdid)
			ct = Dummycartitem.objects.filter(dummycart=dummycart).filter(product=pd).filter(pricePerUnit=pricePerUnit).count()
			if ct>0:
				oldit = Dummycartitem.objects.filter(dummycart=dummycart).filter(product=pd).filter(pricePerUnit=pricePerUnit)[0]
				total = total+pricePerUnit*qty
				oldit.qtyInUnits = oldit.qtyInUnits+qty
				oldit.save()
			else:
				total = total+pricePerUnit*qty
				item = Dummycartitem()
				item.product = pd
				item.pricePerUnit = pricePerUnit
				item.qtyInUnits = qty
				item.dummycart = dummycart
				item.save()
		dummycart.dummycartTotal = dummycart.dummycartTotal+total
		dummycart.save()
		allProducts = giveajaxdummycart(request)
		return TemplateResponse(request, 'adminr/dummy/dummycartreload.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def dummyajaxaddtocart(request):
	if(checklogin(request)==False):
		return redirect('/login')
	productId = request.POST['productId']
	productId = (int)(productId)
	pricePerUnit = request.POST['pricePerUnit']
	pricePerUnit = float(pricePerUnit)
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	product  = Product.rak.get(product_id=productId)
	qty = float(request.POST['qty'])
	if(qty%1!=0 or qty<=0 or pricePerUnit<=0):
		return HttpResponse('error occured invalid qty or price',status=500)
	dummycart = user.dummycart
	price = product.pricePerUnit
	check = Dummycartitem.objects.filter(dummycart=dummycart).filter(product=product).filter(pricePerUnit=pricePerUnit)
	if(len(check)>0):
		previtem = Dummycartitem.objects.get(dummycartitem_id=check[0].dummycartitem_id)
		previtem.qtyInUnits = previtem.qtyInUnits+int(qty)
		dummycart.dummycartTotal = dummycart.dummycartTotal+int(qty)*int(pricePerUnit)
		previtem.save()
		dummycart.save()
	else:
		dummycartitem=Dummycartitem()
		dummycartitem.dummycart=dummycart
		dummycartitem.qtyInUnits = qty
		dummycartitem.pricePerUnit = pricePerUnit
		dummycartitem.product=product
		dummycart.dummycartTotal = dummycart.dummycartTotal+int(qty)*int(pricePerUnit)
		dummycartitem.save()
		dummycart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return TemplateResponse(request, 'adminr/dummy/dummycartreload.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
def dummycart(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	miveuser=basics['miveuser']
	dummycart=miveuser.dummycart
	cartItems=Dummycartitem.objects.filter(dummycart=dummycart)
	totalItems=len(cartItems)
	shippingCost=0
	dummyvendor= miveuser.dummyvendors
	allProducts = []
	for cvend in dummyvendor.all():
		dummyvendor_id = cvend.dummyvendor_id
		seller = cvend.seller
		print 'yochecker'
		print seller
		itemscount = Dummycartitem.objects.filter(product__seller = seller).filter(dummycart=dummycart).count()
		print itemscount
		if itemscount>0:
			items = Dummycartitem.objects.filter(product__seller = seller).filter(dummycart=dummycart)
			pd = {'dummyvendor_id':dummyvendor_id,'items':items,'seller':seller}
			allProducts.append(pd)
		else:
			pass
	print allProducts
	return TemplateResponse(request, 'adminr/dummy/cart.html',{'allProducts':allProducts,'shippingCost':shippingCost,'cartItems':cartItems,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def dummyremoveItemPost(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.GET['itemId']
	itemId = int(itemId)
	item = Dummycartitem.objects.get(dummycartitem_id=itemId)
	dummycart = item.dummycart
	dummycart.dummycartTotal = dummycart.dummycartTotal-item.pricePerUnit*item.qtyInUnits
	item.delete()
	dummycart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	allProducts = giveajaxdummycart(request)
	return TemplateResponse(request, 'adminr/dummy/dummycartreload.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def dummyeditqty(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.POST['itemid']
	itemId = float(itemId)
	newqty = request.POST['newqty']
	newqty = float(newqty)
	item = Dummycartitem.objects.get(dummycartitem_id=itemId)
	oldqty = item.qtyInUnits
	pricePerUnit = item.pricePerUnit
	dummycart=item.dummycart
	item.qtyInUnits = float(newqty)
	dummycart.dummycartTotal = dummycart.dummycartTotal-(oldqty-newqty)*item.pricePerUnit
	item.save()
	dummycart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return redirect('/data/cart')
@transaction.atomic
def dummyordercategory(request):	
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		miveuserId = request.session['miveuser']
		basics = basicinfo(request)
		user = basics['miveuser']
		miveuser=user
		dummyVendorId = request.POST['dummyvendorid']
		images=request.FILES.getlist('image')
		orderMsg = request.POST['orderMsg']
		deliveryTime = request.POST['deliveryTime']
		total = request.POST['total']
		payment_mode = 'COD'
		dummycart = miveuser.dummycart
		dummyvendor = DummyVendor.objects.get(dummyvendor_id = dummyVendorId)
		items = Dummycartitem.objects.filter(dummycart = dummycart).filter(product__seller=dummyvendor.seller)
		if len(items)<1 and str(total)=='' and len(images)==0 :
			return HttpResponse('provide subtotal or invoice atleast')
		totalprice=float(getTotal(items))
		order = Order()
		order.user = user
		order.seller = dummyvendor.seller
		order.payment_mode = payment_mode
		if str(total)!='' and 'invoiceonly' in request.POST:
			order.subtotal=float(total)
			order.status = 'PLACED'
			order.orderType='dummy'
			order.orderMsg = orderMsg
			order.deliveryTime = deliveryTime
			order.save()
			order_id = order.order_id
			for afile in request.FILES.getlist('image'):
				print '>>>>>>>check'
				print afile
			 	d = Invoiceimage()
			 	d.image = afile
			 	d.save()
			 	order.invoices.add(d)
			 	order.save()
		else:
			order.subtotal=totalprice
			order.status = 'PLACED'
			order.orderType='dummy'
			order.orderMsg = orderMsg
			order.deliveryTime = deliveryTime
			order.save()
			for afile in request.FILES.getlist('image'):
				print '>>>>>>>check'
				print afile
			 	d = Invoiceimage()
			 	d.image = afile
			 	d.save()
			 	order.invoices.add(d)
			 	order.save()
			order_id =order.order_id 
			for itemn in items:
				rak = Orderitem()
				rak.product = itemn.product
				stock = Currentstock.objects.filter(product=itemn.product).filter(user=user)
				currStock = Currentstock()
				currStock.product = itemn.product
				currStock.user = user
				currStock.remainingstock=itemn.qtyInUnits
				currStock.save()
				rak.unit=itemn.product.unit
				rak.qtyInUnits = itemn.qtyInUnits
				rak.pricePerUnit = itemn.pricePerUnit
				categories = miveuser.categories.values('seller__seller_id')
				rak.priceType = itemn.product.priceType
				rak.order = order
				rak.save()
				xsellerids=miveuser.categories.values_list('seller__seller_id',flat=True)
				if itemn.product.seller.seller_id not in xsellerids:
					itemn.product.pricePerUnit = itemn.pricePerUnit
					itemn.product.save()
				#fullMsgSender(userId,'Purchase','you have just orderds this shit')
				Dummycartitem.objects.filter(dummycart = dummycart).filter(product__seller=dummyvendor.seller).delete()
				dummycart.dummycartTotal=dummycart.dummycartTotal - totalprice
				miveuser.save()
				dummycart.save()
			n = Notification()
			n.title='Order Recieved'
			n.body='Your order has been recieved succesfully with orderId:'+str(order_id)
			n.link = 'orderDetail?orderId='+str(order_id)
			n.save()
			miveuser.notifications.add(n)
			miveuser.save()
		strr = '/main?notify=yes&description=Order has been added succesfully&title=OrderID:'+str(order_id)
		return redirect(strr)
@csrf_exempt
@transaction.atomic
def csrfreq(request):	

	miveuserId = request.POST['userId']
	user = User.objects.get(user_id=int(miveuserId))
	miveuser=user
	sellerId = request.POST['sellerId']
	images=request.FILES.getlist('image')
	dummycartId = request.POST['dummycartId']
	orderMsg = request.POST['orderMsg']
	total = request.POST['total']
	payment = request.POST['payment']
	deliveryTime = request.POST['deliveryTime']
	payment_mode = 'COD'
	dummycart = miveuser.dummycart
	dummyvendor = DummyVendor.objects.filter(user=miveuser).get(seller__seller_id=int(sellerId))
	items = Dummycartitem.objects.filter(dummycart = dummycart).filter(product__seller=dummyvendor.seller)
	if (invoiceonly in request.POST):
		totalprice = int(total)
		order = Order()
		order.user = user
		order.seller = dummyvendor.seller
		order.payment_mode = payment_mode
		order.subtotal=totalprice
		order.status = 'PLACED'
		order.orderType='dummy'
		order.orderMsg = orderMsg
		order.deliveryTime = deliveryTime
		order.save()
		for afile in request.FILES.getlist('image'):
			print '>>>>>>>check'
			print afile
		 	d = Invoiceimage()
		 	d.image = afile
		 	d.save()
		 	order.invoices.add(d)
		 	order.save()
		order_id = order.order_id
	else:
		totalprice=getTotal(items)
		order = Order()
		order.user = user
		order.seller = dummyvendor.seller
		order.payment_mode = payment_mode
		order.subtotal=totalprice
		order.status = 'PLACED'
		order.orderType='dummy'
		order.orderMsg = orderMsg
		order.deliveryTime = deliveryTime
		order.save()
		for afile in request.FILES.getlist('image'):
			print '>>>>>>>check'
			print afile
		 	d = Invoiceimage()
		 	d.image = afile
		 	d.save()
		 	order.invoices.add(d)
		 	order.save()
		order_id =order.order_id 
		for itemn in items:
			rak = Orderitem()
			rak.product = itemn.product
			stock = Currentstock.objects.filter(product=itemn.product).filter(user=user)
			if(len(stock)>0):
				currStock = stock[0]
				currStock.remainingstock= currStock.remainingstock+itemn.qtyInUnits
				currStock.save()
			else:
				currStock = Currentstock()
				currStock.product = itemn.product
				currStock.user = user
				currStock.remainingstock=itemn.qtyInUnits
				currStock.save()
			rak.unit=itemn.product.unit
			rak.qtyInUnits = itemn.qtyInUnits
			rak.pricePerUnit = itemn.pricePerUnit
			miveuser=user
			rak.priceType = itemn.product.priceType
			rak.order = order
			rak.save()
			#fullMsgSender(userId,'Purchase','you have just orderds this shit')
		Dummycartitem.objects.filter(dummycart = dummycart).filter(product__seller=dummyvendor.seller).delete()
		dummycart.dummycartTotal=dummycart.dummycartTotal - totalprice
		miveuser.save()
		dummycart.save()
	n = Notification()
	n.title='Order Recieved'
	n.body='Your order has been recieved succesfully with orderId:'+str(order_id)
	n.link = 'orderDetail?orderId='+str(order_id)
	n.save()
	miveuser.notifications.add(n)
	miveuser.save()
	strr = '/main?notify=yes&description=Order has been added succesfully&title=OrderID:'+str(order_id)
	return HttpResponse(str({"status":"success","orderId":str(order_id)}),content_type='application/json')
def dummyvendors(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		currentsellers = basics['dummyvendor'].values('seller_id')
		sellers = Seller.rak.exclude(seller_id__in=currentsellers)
		categories = Category.objects.all()
		return TemplateResponse(request,'adminr/dummy/vendors.html',{'basics':basics,'categories':categories,'sellers':sellers,'csrf_token':get_or_create_csrf_token(request)})
def dummyaddvendors(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		sellerId = request.GET['id']
		seller  = Seller.rak.get(seller_id = sellerId)
		products = Product.rak.filter(status =1).filter(seller= seller)
		return TemplateResponse(request,'adminr/dummy/addvendors.html',{'basics':basics,'products':products,'seller':seller})
def dummyuserproduct(request):
	productId = request.GET['productId']
	product = Product.rak.get(product_id=productId)
	seller = product.seller
	return TemplateResponse(request, 'adminr/dummy/userproduct.html',{'product':product,'seller':seller,'csrf_token':get_or_create_csrf_token(request)})
@csrf_exempt
def dummyajaxaddedreload(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		sellerId = request.POST['sellerId']
		seller = Seller.rak.get(seller_id=sellerId)
		miveuser = basics['miveuser']
		categ = DummyVendor.objects.filter(user=miveuser).filter(seller=sellerId)
		if(len(categ)>0):
			products = categ[0].products
			currentPds = products.all()
			t = []
			for iddd in currentPds:
				t.append(iddd.product_id)
		else:
			products = []
			t = []
		allProducts = Product.rak.filter(seller=seller).exclude(product_id__in=t)
		return {'allProducts':allProducts,'products':products,'categ':categ}
@transaction.atomic
@csrf_exempt
def newdummyajaxaddtouser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		dt = request.POST
		basics = basicinfo(request)
		productdetails = json.loads(dt['dt'])
		sellerId =int(dt['sellerId']) 
		miveuser = basics['miveuser']
		seller = Seller.objects.get(seller_id=sellerId)
		for pdd in productdetails:
			productId = pdd['productId']
			pricePerUnit = pdd['price']
			product = Product.rak.get(product_id=productId)
			xsellerids=miveuser.categories.values_list('seller__seller_id',flat=True)
			if product.seller_id not in xsellerids:
				product.pricePerUnit = pricePerUnit
				product.save()
			ccount = DummyVendor.objects.filter(seller=seller).filter(user=miveuser).count()
			print 'yoooo'
			print miveuser
			print >>sys.stderr, 'log msg'
			if(ccount>0):
				existing = DummyVendor.objects.filter(seller=seller).filter(user=miveuser)[0]
				existing.products.add(product)
				existing.save()
			else:
				neww = DummyVendor()
				neww.seller = seller
				neww.save()
				neww.products.add(product)
				neww.save()
				miveuser.dummyvendors.add(neww)
				miveuser.save()
		full=dummyajaxaddedreload(request)
		allProducts =full['allProducts']
		categ = full['categ']
		products = full['products']
		return TemplateResponse(request,'adminr/dummy/ajaxaddedproductreload.html',{'seller':seller,'dummyvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})

@transaction.atomic
def dummyajaxaddtouser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		productId = request.POST['productId']
		product = Product.rak.get(product_id=productId)
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		sellerId = request.POST['sellerId']
		seller = Seller.rak.get(seller_id = sellerId)
		ccount = DummyVendor.objects.filter(seller=seller).filter(user=miveuser).count()
		print 'yoooo'
		print miveuser
		print >>sys.stderr, 'log msg'
		if(ccount>0):
			existing = DummyVendor.objects.filter(seller=seller).filter(user=miveuser)[0]
			existing.products.add(product)
			existing.save()
		else:
			neww = DummyVendor()
			neww.seller = seller
			neww.save()
			neww.products.add(product)
			neww.save()
			miveuser.dummyvendors.add(neww)
			miveuser.save()
	full=dummyajaxaddedreload(request)
	allProducts =full['allProducts']
	categ = full['categ']
	products = full['products']
	return TemplateResponse(request,'adminr/dummy/ajaxaddedproductreload.html',{'dummyvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def dummyconfigvendorlist(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		currentsellers = basics['dummyvendor'].values('seller_id')
		print currentsellers
		sellers = Seller.rak.exclude(seller_id__in=currentsellers)
		return TemplateResponse(request,'adminr/data/configvendorlist.html',{'basics':basics,'sellers':sellers,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def dummyconfigvendor(request):
	if(checklogin(request)==False):
		return redirect('/login')
		basics = basicinfo(request)
		sellerId = request.GET['id']
		seller = Seller.rak.get(seller_id=sellerId)
		miveuser = basics['miveuser']
		categ = CategoryVendor.objects.filter(user=miveuser).filter(seller=sellerId)
	else:
		basics = basicinfo(request)
		sellerId = request.GET['id']
		seller = Seller.rak.get(seller_id=sellerId)
		miveuser = basics['miveuser']
		categ = DummyVendor.objects.filter(user=miveuser).filter(seller=sellerId)
		if(len(categ)>0):
			products = categ[0].products
			currentPds = products.all()
			t = []
			for iddd in currentPds:
				t.append(iddd.product_id)
		else:
			products = []
			t = []
		allProducts = Product.rak.filter(seller=seller).exclude(product_id__in=t)
		return TemplateResponse(request,'adminr/dummy/configvendor.html',{'dummyvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'seller':seller,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def dummyajaxremovefromuser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		productId = request.POST['productId']
		dummyvendorId = request.POST['dummyvendorId']
		product = Product.rak.get(product_id = productId)
		categ = DummyVendor.objects.get(dummyvendor_id = dummyvendorId)
		categ.products.remove(product)
		categ.save()
	full=dummyajaxaddedreload(request)
	allProducts =full['allProducts']
	products = full['products']
	categ = full['categ']
	basics= basicinfo(request)
	return TemplateResponse(request,'adminr/dummy/ajaxrestproductreload.html',{'dummyvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def dummydelvendoruser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		id = request.GET['id']
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		DummyVendor.objects.get(dummyvendor_id=id).delete()
		return redirect('/data/vendors')
@transaction.atomic
def dummynewvendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	name =request.POST['name']
	mobile =request.POST['mobile']
	print request.POST
	if request.POST['email']=='':
		email=''
	else:
		email =request.POST['email']
	if request.POST['area']=='':
		area=''
	else:
		area =request.POST['area']
	if request.POST['city']=='':
		city=''
	else:
		city =request.POST['city']
	if request.POST['state']=='':
		state=''
	else:
		state =request.POST['state']
	if request.POST['pincode']=='':
		pincode=1
	else:
		pincode =int(request.POST['pincode'])
	seller = Seller()
	seller.nameOfSeller=name
	seller.mailId = email
	seller.mobileNo=mobile
	ad =Address()
	ad.area=area
	ad.city =city
	ad.state = state
	ad.pincode = pincode
	ad.save()
	seller.address = ad
	seller.save()
	dmv= DummyVendor()
	dmv.seller = seller
	dmv.save()
	miveuser.dummyvendors.add(dmv)
	miveuser.save()
	sellerids= Seller.objects.filter(directory=True).values('seller_id')
	products = Product.rak.filter(seller__seller_id__in=sellerids)
	categories = Category.objects.all()
	return TemplateResponse(request,'adminr/dummy/newvendor.html',{'categories':categories,'seller':seller,'basics':basics,'products':products,'new':1})
@transaction.atomic
def sellerpdreference(request):
	sellerId = request.GET['sellerId']
	basics = basicinfo(request)
	seller = Seller.objects.get(seller_id=sellerId)
	miveuser = basics['miveuser']
	dummyvendor = DummyVendor.objects.filter(seller=seller).filter(user=miveuser)
	alpds = dummyvendor[0].products.values_list('product_id',flat=True)
	sellerids= Seller.objects.filter(directory=True).values('seller_id')
	slpds = Product.objects.filter(seller=seller).values_list('name')
	products = Product.rak.filter(seller__seller_id__in=sellerids).exclude(name__in=slpds).exclude(seller=seller)
	categories = Category.objects.all()
	return TemplateResponse(request,'adminr/dummy/newvendor.html',{'categories':categories,'seller':seller,'basics':basics,'products':products,'new':0})
def dummynewprodnewvendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	if request.POST['price']=='':
		price = 0
	else:
		price =request.POST['price']
	categ = request.POST['category']
	category = Category.objects.get(category_id=int(categ))
	sellerId =request.POST['sellerid']
	seller = Seller.objects.get(seller_id=sellerId)
	name= request.POST['name']
	description = request.POST['description']
	unit = request.POST['unit']
	product = Product()
	product.seller = seller
	product.pricePerUnit = int(price)
	product.name = name
	product.description = description
	product.unit = unit
	product.category = category
	product.priceType = "custom rates"
	product.satus = 1
	product.save()
	miveuser = basics['miveuser']
	ccount = DummyVendor.objects.filter(seller=seller).filter(user=miveuser).count()
	if(ccount>0):
		existing = DummyVendor.objects.filter(seller=seller).filter(user=miveuser)[0]
		existing.products.add(product)
		existing.save()
		miveuser.save()
	else:
		neww = DummyVendor()
		neww.seller = seller
		neww.save()
		neww.products.add(product)
		neww.save()
		miveuser.dummyvendors.add(neww)
		miveuser.save()
	return HttpResponse('yomoso2')
@csrf_exempt
def newdummyprodnewvendor(request):
	basics = basicinfo(request)
	dt = request.POST
	basics = basicinfo(request)
	productdetails = json.loads(dt['dt'])
	sellerId =int(dt['sellerId']) 
	miveuser = basics['miveuser']
	seller = Seller.objects.get(seller_id=sellerId)
	for pdd in productdetails:
		pdid = int(pdd['productId'])
		pricePerUnit = (pdd['price'])
		baseproduct = Product.rak.get(product_id=pdid)
		product = Product()
		product.seller = seller
		product.pricePerUnit = int(pricePerUnit)
		product.name = baseproduct.name
		product.description = baseproduct.description
		product.unit = baseproduct.unit
		product.priceType = baseproduct.priceType
		product.coverphoto = baseproduct.coverphoto
		product.category = baseproduct.category
		product.origin = baseproduct.origin
		product.maxAvailableUnits = baseproduct.maxAvailableUnits
		product.qualityRemarks = baseproduct.qualityRemarks
		product.grade = baseproduct.grade
		product.satus = 1
		product.save()
		miveuser = basics['miveuser']
		ccount = DummyVendor.objects.filter(seller=seller).filter(user=miveuser).count()
		if(ccount>0):
			existing = DummyVendor.objects.filter(seller=seller).filter(user=miveuser)[0]
			existing.products.add(product)
			existing.save()
		else:
			neww = DummyVendor()
			neww.seller = seller
			neww.save()
			neww.products.add(product)
			neww.save()
			miveuser.dummyvendors.add(neww)
			miveuser.save()
	full=dummyajaxaddedreload(request)
	allProducts =full['allProducts']
	categ = full['categ']
	products = full['products']
	return TemplateResponse(request,'adminr/dummy/ajaxaddedproductreload.html',{'dummyvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def dummyprodnewvendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	price =request.POST['price']
	productId =request.POST['productid']
	sellerId =request.POST['sellerid']
	baseproduct = Product.rak.get(product_id=productId)
	seller = Seller.objects.get(seller_id=sellerId)
	product = Product()
	product.seller = seller
	product.pricePerUnit = int(price)
	product.name = baseproduct.name
	product.description = baseproduct.description
	product.unit = baseproduct.unit
	product.priceType = baseproduct.priceType
	product.coverphoto = baseproduct.coverphoto
	product.category = baseproduct.category
	product.origin = baseproduct.origin
	product.maxAvailableUnits = baseproduct.maxAvailableUnits
	product.qualityRemarks = baseproduct.qualityRemarks
	product.grade = baseproduct.grade
	product.satus = 1
	product.save()
	miveuser = basics['miveuser']
	ccount = DummyVendor.objects.filter(seller=seller).filter(user=miveuser).count()
	if(ccount>0):
		existing = DummyVendor.objects.filter(seller=seller).filter(user=miveuser)[0]
		existing.products.add(product)
		existing.save()
	else:
		neww = DummyVendor()
		neww.seller = seller
		neww.save()
		neww.products.add(product)
		neww.save()
		miveuser.dummyvendors.add(neww)
		miveuser.save()
	return HttpResponse('yomoso')
def payment(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	dummyvendors = miveuser.dummyvendors
	sellerids =dummyvendors.values_list('seller__seller_id',flat=True)
	alll=[]
	for t in sellerids:
		seller = Seller.objects.get(seller_id=t)
		orders = Order.objects.filter(user=miveuser).filter(payment='unpaid').filter(seller=t)
		subt = orders.aggregate(subtotal = Sum('subtotal'))
		due = dummyvendors.filter(seller=seller)[0].due
		total = subt['subtotal']
		if orders.count()==0:
			total=0.0
		r ={}
		r['seller']=seller
		r['total']=total
		r['due']=due
		alll.append(r)
	return TemplateResponse(request,'adminr/dummy/payment.html',{'list':alll,'basics':basics})
def makepayment(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	sellerId = int(request.POST['sellerid'])
	amount = float(request.POST['amount'])
	dummyvendor = miveuser.dummyvendors.filter(seller__seller_id=sellerId)[0]
	dummyvendor.due=amount
	dummyvendor.save()
	return redirect('/payment?notify=yes&type=notice&title=Payment&description=Your due has been added succesfully')
from base import *
from views import *
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
		products = dummyVendor.products
		return TemplateResponse(request,'adminr/dummy/dummyvendor.html',{'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
def dummyproductdetail(request):
	productId = request.GET['productId']
	product = Product.rak.get(product_id=productId)
	return TemplateResponse(request, 'adminr/dummy/product.html',{'product':product,'csrf_token':get_or_create_csrf_token(request)})
def dummyajaxaddtocart(request):
	if(checklogin(request)==False):
		return redirect('/login')
	productId = request.POST['productId']
	productId = (int)(productId)
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	product  = Product.rak.get(product_id=productId)
	qty = int(request.POST['qty'])
	if(qty%1!=0 or qty<=0):
		return HttpResponse('error occured',status=500)
	dummycart = user.dummycart
	price = product.pricePerUnit
	check = Dummycartitem.objects.filter(dummycart=dummycart).filter(product=product)
	if(len(check)>0):
		previtem = Dummycartitem.objects.get(dummycartitem_id=check[0].dummycartitem_id)
		previtem.qtyInUnits = previtem.qtyInUnits+int(qty)
		dummycart.dummycartTotal = dummycart.dummycartTotal+int(qty)*int(price)
		previtem.save()
		dummycart.save()
	else:
		dummycartitem=Dummycartitem()
		dummycartitem.dummycart=dummycart
		dummycartitem.qtyInUnits = qty
		dummycartitem.product=product
		dummycart.dummycartTotal = dummycart.dummycartTotal+int(qty)*int(price)
		dummycartitem.save()
		dummycart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return TemplateResponse(request, 'adminr/dummy/ajaxcart.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
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
def dummyremoveItemPost(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.GET['itemId']
	itemId = int(itemId)
	item = Dummycartitem.objects.get(dummycartitem_id=itemId)
	dummycart = item.dummycart
	dummycart.dummycartTotal = dummycart.dummycartTotal-item.product.pricePerUnit*item.qtyInUnits
	item.delete()
	dummycart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return redirect('/data/cart')
def dummyeditqty(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.POST['itemid']
	itemId = int(itemId)
	newqty = request.POST['newqty']
	newqty = int(newqty)
	item = Dummycartitem.objects.get(dummycartitem_id=itemId)
	oldqty = item.qtyInUnits
	dummycart=item.dummycart
	item.qtyInUnits = int(newqty)
	dummycart.dummycartTotal = dummycart.dummycartTotal-(oldqty-newqty)*item.product.pricePerUnit
	item.save()
	dummycart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return redirect('/data/cart')
def dummyordercategory(request):	
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		miveuserId = request.session['miveuser']
		basics = basicinfo(request)
		user = basics['miveuser']
		miveuser=user
		dummyVendorId = request.GET['dummyvendorid']
		orderMsg = request.GET['orderMsg']
		deliveryTime = request.GET['deliveryTime']
		payment_mode = 'COD'
		dummycart = miveuser.dummycart
		dummyvendor = DummyVendor.objects.get(dummyvendor_id = dummyVendorId)
		items = Dummycartitem.objects.filter(dummycart = dummycart).filter(product__seller=dummyvendor.seller)
		totalprice=getTotal(items)
		if(len(items)<1):
			print 'no items'
			return HttpResponse('no items to make order')
		else:
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
				miveuser=user
				rak.priceType = itemn.product.priceType
				rak.priceAtThatTime = itemn.product.pricePerUnit
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
	return redirect(strr)
def dummyvendors(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		currentsellers = basics['dummyvendor'].values('seller_id')
		sellers = Seller.rak.exclude(seller_id__in=currentsellers)
		return TemplateResponse(request,'adminr/dummy/vendors.html',{'basics':basics,'sellers':sellers,'csrf_token':get_or_create_csrf_token(request)})
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
def dummyconfigvendorlist(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		currentsellers = basics['dummyvendor'].values('seller_id')
		print currentsellers
		sellers = Seller.rak.exclude(seller_id__in=currentsellers)
		return TemplateResponse(request,'adminr/data/configvendorlist.html',{'basics':basics,'sellers':sellers,'csrf_token':get_or_create_csrf_token(request)})
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
		return TemplateResponse(request,'adminr/dummy/configvendor.html',{'dummyvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
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
	return TemplateResponse(request,'adminr/dummy/ajaxrestproductreload.html',{'categoryvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
def dummydelvendoruser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		id = request.GET['id']
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		DummyVendor.objects.get(dummyvendor_id=id).delete()
		return redirect('/data/vendors')
def dummynewvendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	name =request.POST['name']
	mobile =request.POST['mobile']
	email =request.POST['email']
	area =request.POST['area']
	city =request.POST['city']
	state =request.POST['state']
	pincode = request.POST['pincode']
	ctext =request.POST['ctext']
	seller = Seller()
	seller.nameOfSeller=name
	seller.mailId = email
	seller.mobileNo=mobile
	seller.categories =ctext
	ad =Address()
	ad.area=area
	ad.city =city
	ad.state = state
	ad.pincode = pincode
	ad.save()
	seller.address = ad
	seller.save()
	products = Product.rak.all()
	return TemplateResponse(request,'adminr/dummy/newvendor.html',{'seller':seller,'basics':basics,'products':products})
def dummynewprodnewvendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	price =request.POST['price']
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
	product.priceType = "custom rates"
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
	return HttpResponse('yomoso2')
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
def giveajaxdummycart(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	miveuser=basics['miveuser']
	dummycart=miveuser.dummycart
	dummycartItems=Dummycartitem.objects.filter(dummycart=dummycart)
	totalItems=len(cartItems)
	shippingCost=0
	categoryvendor= miveuser.categories
	allProducts = []
	for cvend in categoryvendor.all():
		categoryvendor_id = cvend.categoryvendor_id
		seller = cvend.seller
		itemscount = Cartitem.objects.filter(product__seller = seller).filter(cart=cart).count()
		if itemscount>0:
			items = Cartitem.objects.filter(product__seller = seller).filter(cart=cart)
			pd = {'categoryvendor_id':categoryvendor_id,'items':items,'seller':seller}
			allProducts.append(pd)
		else:
			pass
	return allProducts
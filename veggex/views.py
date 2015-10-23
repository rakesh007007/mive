from base import *
from veggex.serializers import *
def giveajaxcart(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	miveuser=basics['miveuser']
	cart=miveuser.cart
	cartItems=Cartitem.objects.filter(cart=cart)
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
def basicinfo(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		miveuserId = request.session['miveuser']
		miveuser = User.objects.get(user_id=int(miveuserId))
		cart = miveuser.cart
		cartItems = Cartitem.objects.filter(cart=cart)
		totalItems = len(cartItems)
		categoryvendor= miveuser.categories.filter(seller__status=1)
		shippingCost=0
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
		print allProducts
		final = {'miveuser':miveuser,'totalItems':totalItems,'categoryvendor':categoryvendor,'allProducts':allProducts}
		return final
def get_or_create_csrf_token(request):

	token = request.META.get('CSRF_COOKIE', None)
	if token is None:
		token = csrf._get_new_csrf_key()
		request.META['CSRF_COOKIE'] = token
	request.META['CSRF_COOKIE_USED'] = True
	return token
def home(request):
	return TemplateResponse(request,'new/index.html',{'csrf_token':get_or_create_csrf_token(request)})
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
def login(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'adminr/login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		return redirect('/main?notify=yes&title=success&title=Logged In')
def docs(request):
	if ('loggedin' not in request.session):
		return redirect('/login')
	else:
		return redirect('https://github.com/rakesh007007/mive/blob/master/veggex/templates/adminr/docs/v1.txt')
def docsv2(request):
	if ('loggedin' not in request.session):
		return redirect('/login')
	else:
		return redirect('https://github.com/rakesh007007/mive/blob/master/veggex/templates/adminr/docs/v2.txt')

def orderDetail(request):
	if ('loggedin' not in request.session):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		cart = miveuser.cart
		order_id = request.GET['orderId']
		order = Order.objects.filter(user=miveuser).get(order_id=order_id)
		orderItems = Orderitem.objects.filter(order=order)
		return TemplateResponse(request, 'adminr/orderdetail.html',{'basics':basics,'orderItems':orderItems,'order':order})
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
	try:
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
			return redirect('/main?notify=yes&type=success&title=Logged In&description=You have been logged in')
		else:
			return redirect('/main?notify=yes&type=error&title=LogIn&description=Login has been failed please try with proper credentials')
	except:
		return redirect('/main?notify=yes&type=notice&title=LogIn&description=Looks like you are not registered please contact info@mive.in')
def logout(request):
	 if('loggedin' in request.session):
		 del request.session['loggedin']
	 if('mobile' in request.session):
		del request.session['mobile'] 
	 return redirect('/main?notify=yes&type=notice&title=Logged Out&description=You have been logged out')
def main(request):
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
		return TemplateResponse(request, 'adminr/index.html',{'wastage':d,'norders':norders,'rorders':rorders,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
def productdetail(request):
	productId = request.GET['productId']
	product = Product.rak.get(product_id=productId)
	return TemplateResponse(request, 'adminr/product.html',{'product':product,'csrf_token':get_or_create_csrf_token(request)})
def userproduct(request):
	productId = request.GET['productId']
	product = Product.rak.get(product_id=productId)
	seller = product.seller
	return TemplateResponse(request, 'adminr/userproduct.html',{'product':product,'seller':seller,'csrf_token':get_or_create_csrf_token(request)})
def get_or_create_cart(user):
	cart = Cart.objects.filter(user=user)
	if(len(cart)==1):
		return cart[0]
	else:
		cart = Cart()
		cart.user=user
		cart.save()
		return cart
def categoryVendorView(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		miveuser=basics['miveuser']
		categoryVendorId=request.GET['categoryVendorId']
		categoryVendorId = int(categoryVendorId)
		categoryVendor = CategoryVendor.objects.get(categoryvendor_id=categoryVendorId)
		seller = categoryVendor.seller
		products = categoryVendor.products
		return TemplateResponse(request,'adminr/categoryvendor.html',{'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
def ajaxrestreload(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		sellerId = request.GET['id']
		seller = Seller.rak.get(seller_id=sellerId)
		miveuser = basics['miveuser']
		categ = CategoryVendor.objects.filter(user=miveuser).filter(seller=sellerId)
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
		return TemplateResponse(request,'adminr/ajaxrestproductreload.html',{'categoryvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
def ajaxaddedreload(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		sellerId = request.POST['sellerId']
		seller = Seller.rak.get(seller_id=sellerId)
		miveuser = basics['miveuser']
		categ = CategoryVendor.objects.filter(user=miveuser).filter(seller=sellerId)
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
def configvendor(request):
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
		categ = CategoryVendor.objects.filter(user=miveuser).filter(seller=sellerId)
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
		return TemplateResponse(request,'adminr/configvendor.html',{'categoryvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})

def addvendors(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		sellerId = request.GET['id']
		seller  = Seller.rak.get(seller_id = sellerId)
		products = Product.rak.filter(status =1).filter(seller= seller)
		return TemplateResponse(request,'adminr/addvendors.html',{'basics':basics,'products':products,'seller':seller})
def configvendorlist(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		currentsellers = basics['categoryvendor'].values('seller_id')
		print currentsellers
		sellers = Seller.rak.exclude(seller_id__in=currentsellers)
		return TemplateResponse(request,'adminr/configvendorlist.html',{'basics':basics,'sellers':sellers,'csrf_token':get_or_create_csrf_token(request)})
def vendors(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		currentsellers = basics['categoryvendor'].values('seller_id')
		print currentsellers
		sellers = Seller.rak.exclude(seller_id__in=currentsellers)
		return TemplateResponse(request,'adminr/vendors.html',{'basics':basics,'sellers':sellers,'csrf_token':get_or_create_csrf_token(request)})
def addtocart(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=You are not logged in please logIn')
	productId = request.POST['productId']
	productId = (int)(productId)
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	product  = Product.rak.get(product_id=productId)
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
def delvendoruser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		id = request.GET['id']
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		CategoryVendor.objects.get(categoryvendor_id=id).delete()
		return redirect('/vendors')

def ajaxremovefromuser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		productId = request.POST['productId']
		categoryvendorId = request.POST['categoryvendorId']
		product = Product.rak.get(product_id = productId)
		categ = CategoryVendor.objects.get(categoryvendor_id = categoryvendorId)
		categ.products.remove(product)
		categ.save()
	full=ajaxaddedreload(request)
	allProducts =full['allProducts']
	products = full['products']
	categ = full['categ']
	basics= basicinfo(request)
	return TemplateResponse(request,'adminr/ajaxrestproductreload.html',{'categoryvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})


def ajaxaddtouser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		productId = request.POST['productId']
		product = Product.rak.get(product_id=productId)
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		sellerId = request.POST['sellerId']
		seller = Seller.rak.get(seller_id = sellerId)
		ccount = CategoryVendor.objects.filter(seller=seller).filter(user=miveuser).count()
		print 'yoooo'
		print miveuser
		print >>sys.stderr, 'log msg'
		if(ccount>0):
			existing = CategoryVendor.objects.filter(seller=seller).filter(user=miveuser)[0]
			existing.products.add(product)
			existing.save()
		else:
			neww = CategoryVendor()
			neww.seller = seller
			neww.save()
			neww.products.add(product)
			neww.save()
			miveuser.categories.add(neww)
			miveuser.save()
	full=ajaxaddedreload(request)
	allProducts =full['allProducts']
	categ = full['categ']
	products = full['products']
	return TemplateResponse(request,'adminr/ajaxaddedproductreload.html',{'categoryvendor':categ[0],'allProducts':allProducts,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
def ajaxaddtocart(request):
	if(checklogin(request)==False):
		return redirect('/login')
	productId = request.POST['productId']
	productId = (int)(productId)
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	product  = Product.rak.get(product_id=productId)
	qty = int(request.POST['qty'])
	if(qty%1!=0 or qty<0):
		return HttpResponse('error occured',status=500)
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
		cartitem.save()
		cart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return TemplateResponse(request, 'adminr/ajaxcart.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
def removeItemPost(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.GET['itemId']
	itemId = int(itemId)
	item = Cartitem.objects.get(cartitem_id=itemId)
	cart = item.cart
	cart.cartTotal = cart.cartTotal-item.product.pricePerUnit*item.qtyInUnits
	item.delete()
	cart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return TemplateResponse(request, 'adminr/ajaxcart.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})

def editqty(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.POST['itemid']
	itemId = int(itemId)
	newqty = request.POST['newqty']
	newqty = int(newqty)
	item = Cartitem.objects.get(cartitem_id=itemId)
	oldqty = item.qtyInUnits
	cart=item.cart
	item.qtyInUnits = int(newqty)
	cart.cartTotal = cart.cartTotal-(oldqty-newqty)*item.product.pricePerUnit
	item.save()
	cart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return TemplateResponse(request, 'adminr/ajaxcart.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})

def ajaxremoveItemPost(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.POST['item_id']
	itemId = int(itemId)
	item = Cartitem.objects.get(cartitem_id=itemId)
	cart = item.cart
	cart.cartTotal = cart.cartTotal-item.product.pricePerUnit*item.qtyInUnits
	item.delete()
	cart.save()
	miveuserId = request.session['miveuser']
	miveuser = User.objects.get(user_id=int(miveuserId))
	cart = miveuser.cart
	cartItems = Cartitem.objects.filter(cart=cart)
	totalItems = len(cartItems)
	customproducts='none'
	allProducts = Product.rak.filter(status=1)
	products = Product.rak.filter(status=1)
	categories = Category.objects.all()
	return TemplateResponse(request, 'new/ajax/shophome.html',{'cartItems':cartItems,'totalItems':totalItems,'products':products,'categories':categories,'miveuser':miveuser,'cart':cart,'customproducts':customproducts,'csrf_token':get_or_create_csrf_token(request)})
def ordercategory(request):	
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		miveuserId = request.session['miveuser']
		user = User.objects.get(user_id=int(miveuserId))
		miveuser=user
		cartId = request.GET['cartid']
		categoryVendorId = request.GET['categoryvendorid']
		orderMsg = request.GET['orderMsg']
		deliveryTime = request.GET['deliveryTime']
		payment_mode = 'COD'
		cart =Cart.objects.get(cart_id = cartId)
		categoryvendor = CategoryVendor.objects.get(categoryvendor_id = categoryVendorId)
		items = Cartitem.objects.filter(cart = cart).filter(product__seller=categoryvendor.seller)
		totalprice=getTotal(items)
		if(len(items)<1):
			print 'no items'
			return HttpResponse('no items to make order')
		else:
			order = Order()
			order.user = user
			order.seller = categoryvendor.seller
			order.payment_mode = payment_mode
			order.subtotal=totalprice
			order.status = 'PLACED'
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
			Cartitem.objects.filter(cart = cart).filter(product__seller=categoryvendor.seller).delete()
			cart.cartTotal=cart.cartTotal - totalprice
			miveuser.creditlimit = miveuser.creditlimit - totalprice
			miveuser.save()
			cart.save()
	n = Notification()
	n.title='Order Placed'
	n.body='Your order has been placed succesfully with orderId:'+str(order_id)
	n.link = '#'
	n.save()
	miveuser.notifications.add(n)
	miveuser.save()
	strr = '/main?notify=yes&description=Order has been placed succesfully&title=OrderID:'+str(order_id)
	return redirect(strr)
def resetstock(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		stockId = int(request.GET['stockId'])
		stock = Currentstock.objects.filter(user=miveuser).get(currentstock_id = stockId)
		remainingstock = stock.remainingstock
		stock.remainingstock=0
		stock.save()
		stcons = Stockwastage()
		stcons.stock = stock
		stcons.wastage = remainingstock
		stcons.user = miveuser
		stcons.save()
		stocks = Currentstock.objects.filter(user=miveuser)
		basics =basicinfo(request)
		return TemplateResponse(request, 'adminr/ajaxstocks.html',{'basics':basics,'stocks':stocks,'csrf_token':get_or_create_csrf_token(request)})
def ajaxstock(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		basics = basicinfo(request)
		miveuser = basics['miveuser'] 
		stockId = int(request.POST['stockid'])
		cons = float(request.POST['newqty'])
		stock = Currentstock.objects.filter(user=miveuser).get(currentstock_id = stockId)
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
		stocks = Currentstock.objects.filter(user=miveuser)
		basics =basicinfo(request)
		return TemplateResponse(request, 'adminr/ajaxstocks.html',{'basics':basics,'stocks':stocks,'csrf_token':get_or_create_csrf_token(request)})
def stock(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		stocks = Currentstock.objects.filter(user=miveuser)
		basics =basicinfo(request)
		return TemplateResponse(request, 'adminr/stocks.html',{'basics':basics,'stocks':stocks,'csrf_token':get_or_create_csrf_token(request)})

def seeOrder(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		miveuserId = request.session['miveuser']
		miveuser = User.objects.get(user_id=int(miveuserId))
		cart = miveuser.cart
		cartItems = Cartitem.objects.filter(cart=cart)
		totalItems = len(cartItems)
		categories = Category.objects.all()
		mobile = request.session['mobile']
		user =miveuser
		basics = basicinfo(request)
		orders = Order.objects.filter(user=user)
		return TemplateResponse(request, 'adminr/seeorders.html',{'basics':basics,'cartItems':cartItems,'totalItems':totalItems,'cart':cart,'orders':orders,'miveuser':miveuser,'categories':categories,'csrf_token':get_or_create_csrf_token(request)})
def statsproduct(request):
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	if request.GET['id']==0:
		productId = int(request.GET['id'])
		product = Product.rak.get(product_id = productId)
		orderItems = Orderitem.objects.filter(product=product).filter(order__user=miveuser)
	else:
		orderItems = Orderitem.objects.filter(order__user=miveuser)
	items, products = [], []
	allItems = Orderitem.objects.filter(order__user=miveuser)
	for item in allItems:
		if item.product not in products:
			products.append(item.product)
			items.append(item)
	allItems = items
	return TemplateResponse(request,'adminr/statsproduct.html',{'basics':basics,'allItems':allItems,'basic':basics,'orderItems':orderItems})
def statswastage(request):
	basics= basicinfo(request)
	miveuser = basics['miveuser']
	stockId = int(request.GET['id'])
	if int(stockId)==0:
		stocks = Currentstock.objects.filter(user=miveuser)
		stcss = Stockwastage.objects.filter(stock__in=stocks)
	else:
		stock = Currentstock.objects.get(currentstock_id = stockId)
		stcss = Stockwastage.objects.filter(stock=stock)
	t = Stockwastage.objects.all()
	l =[]
	pd = []
	for pp in t:
		if pp.stock.product not in pd:
			pd.append(pp.stock.product)
			l.append(pp.stock)
	stocks = l
	return TemplateResponse(request,'adminr/statswastage.html',{'basics':basics,'wastage':stcss,'stocks':stocks})
def statsconsumption(request):
	basics= basicinfo(request)
	miveuser = basics['miveuser']
	stockId = int(request.GET['id'])
	if int(stockId)==0:
		stocks = Currentstock.objects.filter(user=miveuser)
		stcss = Stockconsumption.objects.filter(stock__in=stocks)
	else:
		stock = Currentstock.objects.get(currentstock_id = stockId)
		stcss = Stockconsumption.objects.filter(stock=stock)
	t = Stockconsumption.objects.all()
	l =[]
	pd =[]
	for pp in t:
		if pp.stock.product not in pd:
			pd.append(pp.stock.product)
			l.append(pp.stock)
	stocks = l
	return TemplateResponse(request,'adminr/statsstock.html',{'basics':basics,'consumption':stcss,'stocks':stocks})
def statsseller(request):
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	if request.GET['id']==0:
		sellerId = int(request.GET['id'])
		seller = Seller.rak.get(seller_id = sellerId)
		orders = Order.objects.filter(seller=seller).filter(user=miveuser).order_by('-timeOfCreate')
	else:
		orders = Order.objects.filter(user=miveuser).order_by('-timeOfCreate')
		seller=[]
	ods = orders.values('order_id')
	ototal = orders.aggregate(Sum('subtotal')) 
	overalltotal = ototal['subtotal__sum']
	allOrdersitems = Orderitem.objects.filter(order_id__in=ods)
	products = []
	statsProduct=[]
	for ord in allOrdersitems:
		if ord.product in products:
			index = products.index(ord.product)
			oldst = statsProduct[index]
			oldst['total'] = oldst['total']+ord.product.pricePerUnit*ord.qtyInUnits
		else:
			st = {}
			products.append(ord.product)
			st['product'] = ord.product
			st['total']=ord.product.pricePerUnit*ord.qtyInUnits
			statsProduct.append(st)
	print products
	print orders
	return TemplateResponse(request, 'adminr/statsseller.html',{'basics':basics,'orders':orders,'statsproduct':statsProduct,'overalltotal':overalltotal,'seller':seller,'csrf_token':get_or_create_csrf_token(request)})
def ajax0datefilter(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue') 
	else:
		if request.POST['date']:
			ping = request.POST['date']
			pin = ping.split(' - ')
			st = pin[0]
			fi = pin[1]
			st = st.replace('/','-')
			fi = fi.replace('/','-')
		else:
			st ='01-01-2010'
			fi = '01-01-3010'
		startdate =datetime.strptime(str(st),"%m-%d-%Y").date()
		enddate = datetime.strptime(str(fi),"%m-%d-%Y").date()
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		allOrders = Order.objects.filter(user=miveuser)
		sellers = []
		statsSeller=[]
		apporders = []
		for ort in allOrders:
			if(startdate<=ort.deliveryTime and ort.deliveryTime<=enddate and ort not in apporders):
				apporders.append(ort)
			else:
				pass
		for ord in apporders:
			if ord.seller in sellers:
				index = sellers.index(ord.seller)
				oldst = statsSeller[index]
				oldst['total'] = oldst['total']+ord.subtotal
			else:
				st = {}
				sellers.append(ord.seller)
				st['seller'] = ord.seller
				st['total']=ord.subtotal
				statsSeller.append(st)
		allOrdersitems = Orderitem.objects.filter(order__user=miveuser)
		products = []
		statsProduct=[]
		for ord in allOrdersitems:
			if ord.order in apporders:
				if ord.product in products :
					index = products.index(ord.product)
					oldst = statsProduct[index]
					oldst['total'] = oldst['total']+ord.product.pricePerUnit*ord.qtyInUnits
				else:
					st = {}
					products.append(ord.product)
					st['product'] = ord.product
					st['total']=ord.product.pricePerUnit*ord.qtyInUnits
					statsProduct.append(st)
			else:
				pass
		return TemplateResponse(request, 'adminr/ajaxstatsorder.html',{'basics':basics,'statsproduct':statsProduct,'statsseller':statsSeller,'csrf_token':get_or_create_csrf_token(request)})
def ajaxconsumptionfilter(request):
	stock = request.POST['stockId']
	if request.POST['date']:
		ping = request.POST['date']
		pin = ping.split(' - ')
		st = pin[0]
		fi = pin[1]
		st = st.replace('/','-')
		fi = fi.replace('/','-')
	else:
		st ='01-01-2010'
		fi = '01-01-3010'
	startdate =datetime.strptime(str(st),"%m-%d-%Y").date()
	enddate = datetime.strptime(str(fi),"%m-%d-%Y").date()
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	if stock==0:
		stock = Currentstock.objects.filter(user=miveuser)[0]
	else:
		stock = Currentstock.objects.get(currentstock_id = stock)
	consumptions = Stockconsumption.objects.filter(stock=stock)
	t =[]
	for it in consumptions:
		if startdate <= it.timeOfCreate and it.timeOfCreate <= enddate:
			t.append(it)
			print 'yoooot'
			print t
		else:
			pass
	return TemplateResponse(request,'adminr/ajaxstatsconsumption.html',{'basic':basics,'consumption':t})

def ajaxwastagefilter(request):
	stock = request.POST['stockId']
	if request.POST['date']:
		ping = request.POST['date']
		pin = ping.split(' - ')
		st = pin[0]
		fi = pin[1]
		st = st.replace('/','-')
		fi = fi.replace('/','-')
	else:
		st ='01-01-2010'
		fi = '01-01-3010'
	startdate =datetime.strptime(str(st),"%m-%d-%Y").date()
	enddate = datetime.strptime(str(fi),"%m-%d-%Y").date()
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	if stock==0:
		stock = Currentstock.objects.filter(user=miveuser)[0]
	else:
		stock = Currentstock.objects.get(currentstock_id = stock)
	consumptions = Stockwastage.objects.filter(stock=stock)
	t =[]
	for it in consumptions:
		if startdate <= it.timeOfCreate and it.timeOfCreate <= enddate:
			t.append(it)
			print 'yoooot'
			print t
		else:
			pass
	return TemplateResponse(request,'adminr/ajaxstatswastage.html',{'basic':basics,'wastage':t})
def ajaxproductfilter(request):
	productName = request.POST['product']
	if request.POST['date']:
		ping = request.POST['date']
		pin = ping.split(' - ')
		st = pin[0]
		fi = pin[1]
		st = st.replace('/','-')
		fi = fi.replace('/','-')
	else:
		st ='01-01-2010'
		fi = '01-01-3010'
	startdate =datetime.strptime(str(st),"%m-%d-%Y").date()
	enddate = datetime.strptime(str(fi),"%m-%d-%Y").date()
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	product = Product.rak.get(name = productName)
	orderItems = Orderitem.objects.filter(product=product).filter(order__user=miveuser)
	t =[]
	for it in orderItems:
		if startdate <= it.order.deliveryTime and it.order.deliveryTime <= enddate:
			t.append(it)
		else:
			pass
	allItems = Orderitem.objects.filter(order__user=miveuser)
	return TemplateResponse(request,'adminr/ajaxstatsproduct.html',{'allItems':allItems,'basic':basics,'orderItems':t})
def ajaxdatefilter(request):
	sellerName= request.POST['seller']
	print 'yolo'
	print request.POST
	if request.POST['date']:
		ping = request.POST['date']
		pin = ping.split(' - ')
		st = pin[0]
		fi = pin[1]
		st = st.replace('/','-')
		fi = fi.replace('/','-')
	else:
		st ='01-01-2010'
		fi = '01-01-3010'
	startdate =datetime.strptime(str(st),"%m-%d-%Y").date()
	enddate = datetime.strptime(str(fi),"%m-%d-%Y").date()
	basics = basicinfo(request)
	miveuser = basics['miveuser']
	seller = Seller.rak.get(nameOfSeller = sellerName)
	orders = Order.objects.filter(seller=seller).filter(user=miveuser)
	apporders = []
	for ort in orders:
		if(startdate<=ort.deliveryTime and ort.deliveryTime<=enddate and ort not in apporders):
			print startdate
			print enddate
			print ort.timeOfCreate.replace(tzinfo=None)
			apporders.append(ort)
		else:
			pass
	ods = orders.values('order_id')
	ototal = orders.aggregate(Sum('subtotal')) 
	overalltotal = ototal['subtotal__sum']
	allOrdersitems = Orderitem.objects.filter(order_id__in=ods)
	products = []
	statsProduct=[]
	print 'testin starts from here'
	for ord in allOrdersitems:
		if(startdate<=ord.order.deliveryTime and ord.order.deliveryTime<=enddate):
			if ord.product in products:
				index = products.index(ord.product)
				oldst = statsProduct[index]
				oldst['total'] = oldst['total']+ord.product.pricePerUnit*ord.qtyInUnits
			else:
				st = {}
				products.append(ord.product)
				st['product'] = ord.product
				st['total']=ord.product.pricePerUnit*ord.qtyInUnits
				statsProduct.append(st)
		else:
			pass
	print statsProduct
	return TemplateResponse(request, 'adminr/ajaxstatsseller.html',{'basics':basics,'orders':apporders,'statsproduct':statsProduct,'overalltotal':overalltotal,'csrf_token':get_or_create_csrf_token(request)})

def statsorder(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue') 
	else:
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		allOrders = Order.objects.filter(user=miveuser)
		sellers = []
		statsSeller=[]
		for ord in allOrders:
			if ord.seller in sellers:
				index = sellers.index(ord.seller)
				oldst = statsSeller[index]
				oldst['total'] = oldst['total']+ord.subtotal
			else:
				st = {}
				sellers.append(ord.seller)
				st['seller'] = ord.seller
				st['total']=ord.subtotal
				statsSeller.append(st)
		allOrdersitems = Orderitem.objects.filter(order__user=miveuser)
		products = []
		statsProduct=[]
		for ord in allOrdersitems:
			if ord.product in products:
				index = products.index(ord.product)
				oldst = statsProduct[index]
				oldst['total'] = oldst['total']+ord.product.pricePerUnit*ord.qtyInUnits
			else:
				st = {}
				products.append(ord.product)
				st['product'] = ord.product
				st['total']=ord.product.pricePerUnit*ord.qtyInUnits
				statsProduct.append(st)
		return TemplateResponse(request, 'adminr/statsorder.html',{'basics':basics,'statsproduct':statsProduct,'statsseller':statsSeller,'csrf_token':get_or_create_csrf_token(request)})
def statsorderitem(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue') 
	else:
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		allOrdersitems = Orderitem.objects.filter(order__user=miveuser)
		products = []
		stats=[]
		for ord in allOrdersitems:
			if ord.product in products:
				index = products.index(ord.product)
				oldst = stats[index]
				oldst['total'] = oldst['total']+ord.product.pricePerUnit*ord.qtyInUnits
			else:
				st = {}
				products.append(ord.product)
				st['product'] = ord.product
				st['total']=ord.product.pricePerUnit*ord.qtyInUnits
				stats.append(st)
		print stats
		return TemplateResponse(request, 'adminr/statsorder.html',{'basics':basics,'stats':stats,'csrf_token':get_or_create_csrf_token(request)})
def cart(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	miveuser=basics['miveuser']
	cart=miveuser.cart
	cartItems=Cartitem.objects.filter(cart=cart)
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
	print allProducts
	return TemplateResponse(request, 'adminr/cart.html',{'allProducts':allProducts,'shippingCost':shippingCost,'cartItems':cartItems,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
def ajaxcart(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return TemplateResponse(request, 'adminr/ajaxcart.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
def newvendor(request):
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
	return TemplateResponse(request,'adminr/newvendor.html',{'seller':seller,'basics':basics,'products':products})
def prodnewvendor(request):
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
	ccount = CategoryVendor.objects.filter(seller=seller).filter(user=miveuser).count()
	if(ccount>0):
		existing = CategoryVendor.objects.filter(seller=seller).filter(user=miveuser)[0]
		existing.products.add(product)
		existing.save()
	else:
		neww = CategoryVendor()
		neww.seller = seller
		neww.save()
		neww.products.add(product)
		neww.save()
		miveuser.categories.add(neww)
		miveuser.save()
	return HttpResponse('yomoso')
def newprodnewvendor(request):
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
	ccount = CategoryVendor.objects.filter(seller=seller).filter(user=miveuser).count()
	if(ccount>0):
		existing = CategoryVendor.objects.filter(seller=seller).filter(user=miveuser)[0]
		existing.products.add(product)
		existing.save()
	else:
		neww = CategoryVendor()
		neww.seller = seller
		neww.save()
		neww.products.add(product)
		neww.save()
		miveuser.categories.add(neww)
		miveuser.save()
	return HttpResponse('yomoso2')
def userprofile(request):
	basics = basicinfo(request)
	return TemplateResponse(request,'adminr/profile.html',{'basics':basics})
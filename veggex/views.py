from base import *
from veggex.serializers import *
from django.views.decorators.csrf import csrf_exempt
import csv
def temp(request):
	pds = Product.objects.all()
	for pd in pds:
		t = pd.coverphoto
		pd.coverphoto2 = t
		pd.save()
	return HttpResponse('yo')
def giveajaxdummycart(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	miveuserId = request.session['miveuser']
	miveuser = User.objects.get(user_id=int(miveuserId))
	dummycart=miveuser.dummycart
	dummycartItems=Dummycartitem.objects.filter(dummycart=dummycart)
	totalItems=len(dummycartItems)
	shippingCost=0
	dummyvendor= miveuser.dummyvendors
	allProducts = []
	for cvend in dummyvendor.all():
		dummyvendor_id = cvend.dummyvendor_id
		seller = cvend.seller
		itemscount = Dummycartitem.objects.filter(product__seller = seller).filter(dummycart=dummycart).count()
		if itemscount>0:
			items = Dummycartitem.objects.filter(product__seller = seller).filter(dummycart=dummycart)
			totalP = items.aggregate(total=Sum(F('pricePerUnit')*F('qtyInUnits')))
			total = totalP['total']
			pd = {'dummyvendor_id':dummyvendor_id,'items':items,'seller':seller,'total':total}
			allProducts.append(pd)
		else:
			pass
	return allProducts
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
		dummyvendor= miveuser.dummyvendors.filter(seller__status=1)
		shippingCost=0
		notifications = Notification.unseen.filter(user__user_id=int(miveuserId))
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
		dummycart = giveajaxdummycart(request)
		final = {'dummycart':dummycart,'miveuser':miveuser,'totalItems':totalItems,'categoryvendor':categoryvendor,'allProducts':allProducts,'notifications':notifications,'dummyvendor':dummyvendor}
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
		total = total+itemm.pricePerUnit*itemm.qtyInUnits
	return total
def tryy(request):
	print 'hii'
	print request.META['TZ']
	return TemplateResponse(request,'tryform.html')
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
@csrf_exempt
def career(request):
	try:
		firstname = 'file upload for shubham'
		lastname = 'yo'
		email = 'ting'
		coverletter = 'tolo'
		subject = 'hola'
		resume=request.FILES['image']
		ting =Career()
		ting.firstname =firstname
		ting.lastname = lastname
		ting.email = email
		ting.coverletter = coverletter
		ting.subject = subject
		ting.resume=resume
		ting.save()
		return HttpResponse(str({"status":"success"}),content_type='application/json')
	except Exception,e:
		return HttpResponse('Error Processing your request looks like you have provided incorrect inputs')
def login(request):
	if ('loggedin' not in request.session):
		return TemplateResponse(request, 'adminr/login.html',{'csrf_token':get_or_create_csrf_token(request)})
	else:
		return redirect('/new?notify=yes&title=success&title=Logged In')
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
			return redirect('/new?notify=yes&type=success&title=Logged in&description=You have been succesfully logged in.')
		else:
			return redirect('/login?notify=yes&type=error&title=LogIn&description=Login has been failed please try with proper credentials')
	except:
		return redirect('/login?notify=yes&type=notice&title=Login failed&description=Looks like you are not registered please contact info@mive.in')
def logout(request):
	 if('loggedin' in request.session):
		 del request.session['loggedin']
	 if('mobile' in request.session):
		del request.session['mobile'] 
	 return redirect('/new?notify=yes&type=notice&title=Logged Out&description=You have been logged out')
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
		return TemplateResponse(request, 'adminr/launch/index.html',{'wastage':d,'norders':norders,'rorders':rorders,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
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
def productfilter(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		miveuser=basics['miveuser']
		categoryfilter = request.POST['categoryfilter']
		categoryvendorid=request.POST['categoryvendorid']
		categoryVendor = CategoryVendor.objects.get(categoryvendor_id=categoryvendorid)
		if int(categoryfilter)==0:
			products = categoryVendor.products.all()
			return TemplateResponse(request,'adminr/productfilter.html',{'products':products})
		else:
			category = Category.objects.get(category_id=int(categoryfilter))
			products = categoryVendor.products.filter(category=category)
			return TemplateResponse(request,'adminr/productfilter.html',{'products':products})
def categoryVendorView(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		miveuser=basics['miveuser']
		categoryVendorId=request.GET['categoryVendorId']
		if int(categoryVendorId)==0:
			categoryVendor = CategoryVendor.objects.filter(user=miveuser).get(seller__nameOfSeller='Mive')
		else:
			categoryVendorId = int(categoryVendorId)
			categoryVendor = CategoryVendor.objects.get(categoryvendor_id=categoryVendorId)
		seller = categoryVendor.seller
		products = categoryVendor.products
		categories = Category.objects.all()
		return TemplateResponse(request,'adminr/categoryvendor.html',{'categoryvendor':categoryVendor,'categories':categories,'basics':basics,'products':products,'csrf_token':get_or_create_csrf_token(request)})
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
@transaction.atomic
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
@transaction.atomic
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
def nRouter(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		mivuser = basics['miveuser']
		nid = request.GET['nId']
		url = request.GET['url']
		notif = Notification.unseen.get(notification_id=int(nid))
		notif.seen=1
		notif.save()
		return redirect(url)
def delvendoruser(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		id = request.GET['id']
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		CategoryVendor.objects.get(categoryvendor_id=id).delete()
		return redirect('/vendors')

@transaction.atomic
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


@transaction.atomic
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
@csrf_exempt
@transaction.atomic
def newajaxaddtocart(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		dt = request.POST
		basics = basicinfo(request)
		productdetails = json.loads(dt['dt'])
		miveuser = basics['miveuser']
		cart = miveuser.cart
		total=0
		for it in productdetails:
			pdid = (it['productId'])
			qty = int(it['qty'])
			if qty<=0:
				continue
			pd = Product.objects.get(product_id=pdid)
			ct = Cartitem.objects.filter(cart=cart).filter(product=pd).filter(pricePerUnit=pd.pricePerUnit).count()
			if ct>0:
				oldit = Cartitem.objects.filter(cart=cart).filter(product=pd).filter(pricePerUnit=pd.pricePerUnit)[0]
				total = total+pd.pricePerUnit*qty
				oldit.qtyInUnits = oldit.qtyInUnits+qty
				oldit.save()
			else:
				total = total+pd.pricePerUnit*qty
				item = Cartitem()
				item.product = pd
				item.pricePerUnit = pd.pricePerUnit
				item.qtyInUnits = qty
				item.cart = cart
				item.save()
		cart.cartTotal = cart.cartTotal+total
		cart.save()
		allProducts = giveajaxcart(request)
		return TemplateResponse(request, 'adminr/ajaxcart.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
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
		return HttpResponse('error occured invalid quantity',status=500,content_type='application/json')
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
		cartitem.pricePerUnit = price
		cart.cartTotal = cart.cartTotal+int(qty)*int(price)
		cartitem.save()
		cart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return TemplateResponse(request, 'adminr/ajaxcart.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
def ajaxaddtocart2(request):
	if(checklogin(request)==False):
		return redirect('/login')
	productId = request.POST['productId']
	productId = (int)(productId)
	mobile=request.session['mobile']
	user = User.objects.get(mobileNo=mobile)
	product  = Product.rak.get(product_id=productId)
	qty = int(request.POST['qty'])
	if(qty%1!=0 or qty<0):
		return HttpResponse('error occured invalid quantity',status=500)
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
		cartitem.pricePerUnit = price
		cart.cartTotal = cart.cartTotal+int(qty)*int(price)
		cartitem.save()
		cart.save()
	basics = basicinfo(request)
	allProducts = giveajaxcart(request)
	return TemplateResponse(request, 'adminr/ajaxcart.html',{'allProducts':allProducts,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
@transaction.atomic
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

@transaction.atomic
def editqty(request):
	if(checklogin(request)==False):
		return redirect('/login')
	itemId = request.POST['itemid']
	itemId = int(itemId)
	newqty = request.POST['newqty']
	newqty = int(newqty)
	if (newqty<=0):
		raise ValueError('invalid quantity')
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

@transaction.atomic
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
@transaction.atomic
def ordercategory(request):	
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		try:
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
				return HttpResponse('no items to make order',status=500)
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
					rak.pricePerUnit = itemn.product.pricePerUnit
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
				n.link = 'orderDetail?orderId='+str(order_id)
				n.save()
				miveuser.notifications.add(n)
				miveuser.save()
				n2 = Sellernotification()
				n2.title ='Order recieved'
				n2.body = 'Congratulations you have recieved a new order orderId'+str(order_id)
				n2.link = 'seller/orderDetail?orderId='+str(order_id)
				n2.save()
				miveseller= categoryvendor.seller
				miveseller.notifications.add(n2)
				miveseller.save()
				strr = '/main?notify=yes&description=Order has been placed succesfully&title=OrderID:'+str(order_id)
				return redirect(strr)
		except Exception,e:
			return HttpResponse('error ocurre',status=500)
@transaction.atomic
def resetstock(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		try:
			basics = basicinfo(request)
			miveuser = basics['miveuser']
			stockId = int(request.GET['stockId'])
			stock = Currentstock.objects.filter(user=miveuser).get(currentstock_id = stockId)
			remainingstock = stock.remainingstock
			if remainingstock!=0:
				stock.remainingstock=0
				stock.save()
				stcons = Stockwastage()
				stcons.stock = stock
				stcons.wastage = remainingstock
				stcons.user = miveuser
				stcons.save()
				stocks = Currentstock.objects.filter(user=miveuser)
				stocks=sorted(stocks, key=operator.attrgetter('remainingstock'),reverse=True)
				basics =basicinfo(request)
				return TemplateResponse(request, 'adminr/ajaxstocks.html',{'basics':basics,'stocks':stocks,'csrf_token':get_or_create_csrf_token(request)})
			else:
				raise ValueError('A very specific bad thing happened')
		except Exception,e:
			return HttpResponse(e,status=500)
@transaction.atomic
def ajaxstock(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		try:
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
				raise ValueError('Invalid entry')
			stock.save()
			stcons.consumption = cons
			stcons.save()
			stocks = Currentstock.objects.filter(user=miveuser)
			stocks=sorted(stocks, key=operator.attrgetter('remainingstock'),reverse=True)
			basics =basicinfo(request)
			return TemplateResponse(request, 'adminr/ajaxstocks.html',{'basics':basics,'stocks':stocks,'csrf_token':get_or_create_csrf_token(request)})
		except Exception,e:
			return HttpResponse(e,status=500)
def stock(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		basics = basicinfo(request)
		miveuser = basics['miveuser']
		stocks = Currentstock.objects.filter(user=miveuser)
		stocks=sorted(stocks, key=operator.attrgetter('remainingstock'),reverse=True)
		basics =basicinfo(request)
		return TemplateResponse(request, 'adminr/stocks.html',{'basics':basics,'stocks':stocks,'csrf_token':get_or_create_csrf_token(request)})

def seeOrder(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		miveuserId = request.session['miveuser']
		miveuser = User.objects.get(user_id=int(miveuserId))
		localtz = pytz.timezone('Asia/Kolkata')
		aaj = date.today()
		days =60
		beforedays = date.today() - timedelta(days=int(days))
		timeaaj = datetime.combine(aaj, datetime.max.time()).replace(tzinfo=localtz)
		timebeforedays = datetime.combine(beforedays, datetime.max.time()).replace(tzinfo=localtz)
		user =miveuser
		basics = basicinfo(request)
		orders = Order.objects.order_by('-deliveryTime','-timeOfCreate').filter(user=miveuser).filter(deliveryTime__gt=timebeforedays)
		total = orders.aggregate(total=Sum('subtotal'))
		total = total['total']
		sellers=Seller.objects.filter(seller_id__in=orders.values('seller'))
		return TemplateResponse(request, 'adminr/seeorders.html',{'basics':basics,'total':total,'orders':orders,'miveuser':miveuser,'sellers':sellers,'csrf_token':get_or_create_csrf_token(request)})
def orderfilter(request):
	if ('loggedin' not in request.session):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		try:
			print 'yoooooooooooooo'
			print request.POST
			print (request.POST['sellers'])
			basics = basicinfo(request)
			miveuser = basics['miveuser']
			localtz = pytz.timezone('Asia/Kolkata')
			aaj = date.today()
			days =request.POST['date']
			print 'yoooooooo'
			print days
			print 'payment'
			if 'sellers' in request.POST:
				sellers = request.POST.getlist('sellers')
				if len(sellers)==0:
					return HttpResponse('no sellers selected')
			else:
				sellers=[]

			payment=request.POST['rak']
			print payment
			print 'end'
			sortby = request.POST['sortby']
			basics= basicinfo(request)
			beforedays = date.today() - timedelta(days=int(days))
			timeaaj = datetime.combine(aaj, datetime.max.time()).replace(tzinfo=None)
			timebeforedays = datetime.combine(beforedays, datetime.max.time()).replace(tzinfo=None)
			if payment=='all':
				orders = Order.objects.filter(seller__seller_id__in=sellers).filter(user=miveuser).filter(deliveryTime__gt=timebeforedays).order_by('-deliveryTime','-timeOfCreate')
			else:
				orders = Order.objects.filter(seller__seller_id__in=sellers).filter(payment=payment).filter(user=miveuser).filter(deliveryTime__gt=timebeforedays).order_by('-deliveryTime','-timeOfCreate')
			print 'yahoo'
			print orders
			print len(orders)
			total = orders.aggregate(total=Sum('subtotal'))
			total = total['total']
			return TemplateResponse(request,'adminr/orderfilter.html',{'basics':basics,'total':total,'orders':orders})
		except Exception,e:
			return HttpResponse(e,status=500)
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
@transaction.atomic
def newvendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	try:
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
	except Exception,e:
		return HttpResponse(e,status=500)
@transaction.atomic
def prodnewvendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	try:
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
	except Exception,e:
		return HttpResponse('Error occure',status=500)
@transaction.atomic
def newprodnewvendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	try:
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
	except Exception,e:
		return HttpResponse(e,status=500)
def userprofile(request):
	basics = basicinfo(request)
	return TemplateResponse(request,'adminr/profile.html',{'basics':basics})
def invoice(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	try:
		basics = basicinfo(request)
		orderId = int(request.GET['orderId'])
		order= Order.objects.get(order_id=orderId)
		orderItems = Orderitem.objects.filter(order=order)
		invoices = order.invoices
		return TemplateResponse(request,'adminr/invoice.html',{'orderItems':orderItems,'basics':basics,'invoices':invoices,'order':order})
	except Exception,e:
		return HttpResponse(e,status=500)
def invoiceforprint(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	try:
		basics = basicinfo(request)
		orderId = int(request.GET['orderId'])
		order= Order.objects.get(order_id=orderId)
		orderItems = Orderitem.objects.filter(order=order)
		invoices = order.invoices
		return TemplateResponse(request,'adminr/invoiceforprint.html',{'orderItems':orderItems,'basics':basics,'invoices':invoices,'order':order})
	except Exception,e:
		return HttpResponse(e,status=500)
def makepaid(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	try:
		basics = basicinfo(request)
		orderId = int(request.GET['orderId'])
		miveuser = basics['miveuser']
		order= Order.objects.filter(user=miveuser).get(order_id=orderId)
		order.payment='paid'
		order.save()
		orderItems = Orderitem.objects.filter(order=order)
		invoices = order.invoices
		return TemplateResponse(request,'adminr/invoice.html',{'orderItems':orderItems,'basics':basics,'invoices':invoices,'order':order})
	except Exception,e:
		return HttpResponse(e,status=500)
def editorder(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	try:
		basics= basicinfo(request)
		miveuser = basics['miveuser']
		msg = request.POST['orderMsg']
		files = request.FILES.getlist('image')
		if 'flag' in request.POST:
			flag = request.POST['flag']
		else:
			flag=''
		if 'unflag' in request.POST:
			unflag = request.POST['unflag']
		else:
			unflag=''
		if 'paid' in request.POST:
			paid = request.POST['paid']
		else:
			paid=''
		orderId = request.POST['orderid']
		orderId = int(orderId)
		order = Order.objects.get(order_id=orderId)
		if msg!='':
			order.orderMsg = msg
		if flag=='on':
			order.flag=True
		if unflag=='on':
			order.flag=False
		if paid =='on':
		    order.payment = 'paid'
		if len(files)!=0:
			for afile in files:
			 	d = Invoiceimage()
			 	d.image = afile
			 	d.save()
			 	order.invoices.add(d)
			 	order.save()
		order.save()	
		strr = '/main?notify=yes&description=Order has been updated succesfully&title=OrderID: '+str(orderId)
		return redirect(strr)
	except Exception,e:
		return HttpResponse(e)
def new(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	try:
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
		return TemplateResponse(request, 'adminr/launch/index.html',{'wastage':d,'norders':norders,'rorders':rorders,'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
	except Exception,e:
		print 'hi'
def export(request):
	books = Order.objects.all()
	response = HttpResponse(books , content_type='application/vnd.ms-excel;charset=utf-8')
	response['Content-Disposition'] = 'attachment; filename="books.xls"'
	writer = csv.writer(response)
	writer.writerow(['Book', 'Author'])
	for book in books:
		writer.writerow([book.seller.nameOfSeller, book.subtotal])
	return response
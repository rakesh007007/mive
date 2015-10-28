from base import *
from views import *
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
			oldst['total'] = oldst['total']+ord.pricePerUnit*ord.qtyInUnits
		else:
			st = {}
			products.append(ord.product)
			st['product'] = ord.product
			st['total']=ord.pricePerUnit*ord.qtyInUnits
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
					oldst['total'] = oldst['total']+ord.pricePerUnit*ord.qtyInUnits
				else:
					st = {}
					products.append(ord.product)
					st['product'] = ord.product
					st['total']=ord.pricePerUnit*ord.qtyInUnits
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
	product = Product.rak.get(product_id = productName)
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
				oldst['total'] = oldst['total']+ord.pricePerUnit*ord.qtyInUnits
			else:
				st = {}
				products.append(ord.product)
				st['product'] = ord.product
				st['total']=ord.pricePerUnit*ord.qtyInUnits
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
				oldst['total'] = oldst['total']+ord.pricePerUnit*ord.qtyInUnits
			else:
				st = {}
				products.append(ord.product)
				st['product'] = ord.product
				st['total']=ord.pricePerUnit*ord.qtyInUnits
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
				oldst['total'] = oldst['total']+ord.pricePerUnit*ord.qtyInUnits
			else:
				st = {}
				products.append(ord.product)
				st['product'] = ord.product
				st['total']=ord.pricePerUnit*ord.qtyInUnits
				stats.append(st)
		print stats
		return TemplateResponse(request, 'adminr/statsorder.html',{'basics':basics,'stats':stats,'csrf_token':get_or_create_csrf_token(request)})
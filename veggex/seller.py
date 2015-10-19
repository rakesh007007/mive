from base import *
def checklogin(request):
	if ('sellerloggedin' not in request.session):
		return False
	else:
		return True
def get_or_create_csrf_token(request):
	token = request.META.get('CSRF_COOKIE', None)
	if token is None:
		token = csrf._get_new_csrf_key()
		request.META['CSRF_COOKIE'] = token
	request.META['CSRF_COOKIE_USED'] = True
	return token
def basicinfo(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		mivesellerId = request.session['mivesellerId']
		miveseller = Seller.rak.get(seller_id=int(mivesellerId))
		orders =  Order.objects.filter(seller=miveseller)
		return {'orders':orders,'miveseller':miveseller}
def sel(request):
	return TemplateResponse(request,'adminr/seller/login.html')
def main(request):
	if(checklogin(request)==False):
		return redirect('seller/login')
	else:
		basics = basicinfo(request)
		return TemplateResponse(request, 'adminr/seller/index.html',{'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
def logPost(request):
	try:
		mobile=request.POST['mobile']
		password = request.POST['password']
		u = Seller.rak.filter(mobileNo=mobile)
		print mobile
		print password
		print u
		print check_password(password,u[0].password)
		#uu=Cart.objects.raw('select * from `veggex_cart` natural join `veggex_user` where mobileNo='+str(mobile))
		if(check_password(password,u[0].password)):
			request.session['sellerloggedin']=True
			request.session['mobile']=mobile
			request.session['mivesellerId']=u[0].seller_id
			miveuser = u[0]
			strraw={"mobile":mobile,"password":password}
			#return HttpResponse(str(strraw))
			return redirect('/seller/main?notify=yes&type=success&title=Logged In&description=You have been logged in')
		else:
			return redirect('/seller/login?notify=yes&type=error&title=LogIn&description=Login has been failed please try with proper credentials')
	except Exception,e:
		return redirect('/seller/login?notify=yes&type=notice&title=LogIn&description=Looks like you are not registered please contact info@mive.in')
def orderDetail(request):
	if(checklogin(request)==False):
		return redirect('/seller/login?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		basics = basicinfo(request)
		miveseller = basics['miveseller']
		order_id = request.GET['orderId']
		order = Order.objects.filter(seller=miveseller).get(order_id=order_id)
		orderItems = Orderitem.objects.filter(order=order)
		return TemplateResponse(request, 'adminr/seller/orderdetail.html',{'basics':basics,'orderItems':orderItems,'order':order})

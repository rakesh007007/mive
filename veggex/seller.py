from base import *
def checklogin(request):
	if ('sellerloggedin' not in request.session):
		return False
	else:
		return True
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
def sel(request):
	return TemplateResponse(request,'adminr/seller/login.html')
def main(request):
	if(checklogin(request)==False):
		return redirect('/login')
	else:
		basics = basicinfo(request)
		return TemplateResponse(request, 'adminr/index.html',{'basics':basics,'csrf_token':get_or_create_csrf_token(request)})
def logPost(request):
	try:
		mobile=request.POST['mobile']
		password = request.POST['password']
		u = Seller.rak.filter(mobileNo=mobile)
		#uu=Cart.objects.raw('select * from `veggex_cart` natural join `veggex_user` where mobileNo='+str(mobile))
		if(check_password(password,u[0].password)):
			request.session['sellerloggedin']=True
			request.session['mobile']=mobile
			request.session['miveuser']=u[0].user_id
			miveuser = u[0]
			strraw={"mobile":mobile,"password":password}
			#return HttpResponse(str(strraw))
			return redirect('/seller/main?notify=yes&type=success&title=Logged In&description=You have been logged in')
		else:
			return redirect('/seller/login?notify=yes&type=error&title=LogIn&description=Login has been failed please try with proper credentials')
	except:
		return redirect('/seller/login?notify=yes&type=notice&title=LogIn&description=Looks like you are not registered please contact info@mive.in')

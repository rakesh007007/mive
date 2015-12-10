from base import *
from views import *
from django.views.decorators.csrf import csrf_exempt

def vendor(request):
	if(checklogin(request)==False):
		return redirect('/main?notify=yes&type=notice&title=Log In&description=Please login to continue')
	else:
		basics = basicinfo(request)
		miveuser=basics['miveuser']
		sellerId = int(request.POST['sellerId'])
		stext = str(request.POST['stext'])
		dummyvendor = miveuser.dummyvendors.filter(seller__seller_id=sellerId)[0]
		allpds = dummyvendor.products
		pds = allpds.filter(Q(name__icontains = stext)|Q(description__icontains = stext))
		return TemplateResponse(request,'adminr/dummy/vendorproductsearch.html',{'basics':basics,'products':pds})
from django.conf.urls import include, url
from django.contrib import admin
from rest_framework import routers
from veggex import views
from veggex import apis
from veggex import stats
from veggex import seller
from veggex import dummy
from veggex import search
from django.contrib.staticfiles.urls import *
from mive.settings import *
router = routers.DefaultRouter()
router.register(r'address', apis.AddressViewSet)
router.register(r'category', apis.CategoryViewSet)
router.register(r'product', apis.ProductViewSet)
router.register(r'user', apis.UserViewSet)
router.register(r'cart', apis.CartViewSet)
router.register(r'dummycart', apis.DummycartViewSet)
router.register(r'cartitem', apis.CartitemViewSet)
router.register(r'dummycartitem', apis.DummycartitemViewSet)
router.register(r'order', apis.OrderViewSet)
router.register(r'orderitem', apis.OrderitemViewSet)
router.register(r'seller', apis.SellerViewSet)
router.register(r'categoryvendor', apis.CategoryVendorViewSet)
router.register(r'dummyvendor', apis.DummyVendorViewSet)
router.register(r'invoices', apis.InvocieimageViewSet)
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/login', apis.UserLoginView.as_view(), name='login-view'),
    #url(r'^api/custom/product/', views.UserLoginView.as_view(), name='login-view'),
    url(r'^api/', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^login', views.login),
    url(r'^subscribe', views.subscribe),
    url(r'^tryy', views.tryy),
    url(r'^temp', views.temp),
    url(r'^csrfreq', dummy.csrfreq),
    url(r'^docs/v1', views.docs),
    url(r'^docs/v2', views.docsv2),
     url(r'^export', views.export),
    url(r'^index.html/', dummy.dummymain),
    url(r'^data/index.html/', dummy.dummymain),
    url(r'^data/main/', dummy.dummymain),
    url(r'^payment/', dummy.payment),
    url(r'^data/change/payment/', dummy.makepayment),
    url(r'^logPost', views.logPost),
    url(r'^new/data/prod-newvendor', dummy.newdummyprodnewvendor),
    url(r'^editqty', views.editqty),
    url(r'^product/filter', views.productfilter),
    url(r'^data/product/filter', dummy.dummyproductfilter),
    url(r'^data/normalproduct/filter', dummy.dummynormalproductfilter),
    url(r'^data/editqty', dummy.dummyeditqty),
    url(r'^logout', views.logout),
    url(r'^main', views.main),
    url(r'^categoryvendor', views.categoryVendorView),
    url(r'^data/categoryvendor', dummy.dummyVendorView),
    url(r'^addtocart', views.addtocart),
    url(r'^ajaxaddtocart', views.ajaxaddtocart),
    url(r'^new/ajaxaddtocart', views.newajaxaddtocart),
    url(r'^ajaxdummycartupdate', dummy.ajaxdummycartupdate),
    url(r'^new/ajaxaddtodummycart', dummy.newajaxaddtodummycart),
    url(r'^data/ajaxaddtocart', dummy.dummyajaxaddtocart),
    url(r'^addvendors', views.addvendors),
    url(r'^data/addvendors', dummy.dummyaddvendors),
    url(r'^configvendor0', views.configvendorlist),
    url(r'^data/configvendor0', dummy.dummyconfigvendorlist),
    url(r'^configvendor', views.configvendor),
    url(r'^data/vendor/pdreference', dummy.sellerpdreference),
    url(r'^data/configvendor', dummy.dummyconfigvendor),
    url(r'^vendors', views.vendors),
    url(r'^data/vendors', dummy.dummyvendors),
    url(r'^stock', views.stock),
    url(r'^notification/router', views.nRouter),
    url(r'^resetstock', views.resetstock),
    url(r'^ajaxstock', views.ajaxstock),
    url(r'^stats/prices', stats.pricefluct),
    url(r'^stats/orderitem', stats.statsorderitem),
    url(r'^stats/ajaxfilter', stats.ajaxdatefilter),
    url(r'^filter/seeorder', views.orderfilter),
    url(r'^stats/filter/prices', stats.filterforprices),
    url(r'^stats/ajax0filter', stats.ajax0datefilter),
    url(r'^stats/ajaxproductfilter', stats.ajaxproductfilter),
    url(r'^stats/ajaxconsumptionfilter', stats.ajaxconsumptionfilter),
    url(r'^stats/ajaxwastagefilter', stats.ajaxwastagefilter),
    url(r'^stats/order', stats.statsorder),
    url(r'^stats/seller', stats.statsseller),
    url(r'^stats/product', stats.statsproduct),
    url(r'^stats/consumption', stats.statsconsumption),
    url(r'^stats/wastage', stats.statswastage),
    url(r'^userproduct', views.userproduct),
    url(r'^data/userproduct', dummy.dummyuserproduct),
    url(r'^userprofile', views.userprofile),
    url(r'^ajaxaddtouser', views.ajaxaddtouser),
    url(r'^data/ajaxaddtouser', dummy.dummyajaxaddtouser),
    url(r'^new/data/ajaxaddtouser', dummy.newdummyajaxaddtouser),
    url(r'^ajaxremovefromuser', views.ajaxremovefromuser),
    url(r'^data/ajaxremovefromuser', dummy.dummyajaxremovefromuser),
    url(r'^ajaxaddedreload', views.ajaxaddedreload),
    url(r'^ajaxrestreload', views.ajaxrestreload),
    url(r'^delvendoruser', views.delvendoruser),
    url(r'^data/delvendoruser', dummy.dummydelvendoruser),
    url(r'^ajaxcart', views.ajaxcart),
    url(r'^cart', views.cart),
    url(r'^data/cart', dummy.dummycart),
    url(r'^orderDetail', views.orderDetail),
    url(r'^editorder', views.editorder),
    url(r'^removeItemPost', views.removeItemPost),
    url(r'^data/removeItemPost', dummy.dummyremoveItemPost),
    url(r'^ajaxremoveItemPost', views.ajaxremoveItemPost),
    url(r'^ordercategory', views.ordercategory),
    url(r'^data/ordercategory', dummy.dummyordercategory),
    url(r'^seeOrder', views.seeOrder),
    url(r'^product', views.productdetail),
    url(r'^data/product', dummy.dummyproductdetail),
    url(r'^career', views.career),
    url(r'^new', views.new),
    url(r'^contact', views.contact),
    url(r'^$', views.home),
    url(r'^newvendor', views.newvendor),
    url(r'^data/newvendor', dummy.dummynewvendor),
    url(r'^prod-newvendor', views.prodnewvendor),
    url(r'^data/prod-newvendor', dummy.dummyprodnewvendor),
    url(r'^newproductnewvendor', views.newprodnewvendor),
    url(r'^data/newproductnewvendor', dummy.dummynewprodnewvendor),
    url(r'^invoice', views.invoice),
    url(r'^makepaid', views.makepaid),
    url(r'^search/dummyvendor', search.vendor),
    url(r'^seller/login', seller.sel),
    url(r'^seller/logPost', seller.logPost),
    url(r'^seller/main', seller.main),
    url(r'^seller/products', seller.products),
    url(r'^seller/orderDetail', seller.orderDetail),
    url('^api/user/orders/(?P<userid>.+)/$', apis.OrdersOfUserList.as_view()),
    url('^api/order/items/(?P<orderid>.+)/$', apis.ItemsOfOrderList.as_view()),
    url('^api/user/customcategory/(?P<userid>.+)/$', apis.CustomCategoryProductsList.as_view()),
    url('^api/search/title/(?P<pid>.+)/(?P<userId>.+)/$', apis.ProductSearchTitleList.as_view()),
    url('^api/search/description/(?P<pid>.+)/(?P<userId>.+)/$', apis.ProductSearchDescriptionList.as_view()),
    url('^api/stock/(?P<pid>.+)/$', apis.StockList.as_view()),
    url('^api/cart/cartitems/(?P<cartid>.+)/$', apis.ItemsOfCartList.as_view()),
    url('^api/addtoconsumption/$', apis.ApiAddToConsumption.as_view()),
    url('^api/addtowastage/$', apis.ApiAddToWastage.as_view()),
    url('^api/addtocart/$', apis.ApiAddToCart.as_view()),
    url('^api/addtodummycart/$', apis.ApiAddToDummyCart.as_view()),
    url('^api/seecart/$', apis.ApiSeeCart.as_view()),
    url('^api/prices/$', apis.ApiSeePrices.as_view()),
    url('^api/seeorders/$', apis.ApiSeeOrder.as_view()),
    url('^api/seedummycart/$', apis.ApiSeeDummyCart.as_view()),
    url('^api/updatecart/$', apis.ApiUpdateCart.as_view()),
    url('^api/makeorder/$', apis.ApiMakeOrder.as_view()),
    url('^api/makeorderdummy/$', apis.ApiMakeOrderDummy.as_view()),
    url('^api/temp/makeorderdummy/$', dummy.csrfreq),
    url('^api/temp/editorderdummy/$', dummy.editcsrfreq),




]
urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
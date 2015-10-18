from django.conf.urls import include, url
from django.contrib import admin
from rest_framework import routers
from veggex import views
from veggex import apis
from django.contrib.staticfiles.urls import *
from mive.settings import *
router = routers.DefaultRouter()
router.register(r'address', apis.AddressViewSet)
router.register(r'category', apis.CategoryViewSet)
router.register(r'product', apis.ProductViewSet)
router.register(r'user', apis.UserViewSet)
router.register(r'cart', apis.CartViewSet)
router.register(r'cartitem', apis.CartitemViewSet)
router.register(r'order', apis.OrderViewSet)
router.register(r'orderitem', apis.OrderitemViewSet)
router.register(r'seller', apis.SellerViewSet)
router.register(r'categoryvendor', apis.CategoryVendorViewSet)
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^authtoken/', apis.TestView.as_view(), name='auth-view'),
    url(r'^api/login', apis.UserLoginView.as_view(), name='login-view'),
    #url(r'^api/custom/product/', views.UserLoginView.as_view(), name='login-view'),
    url(r'^api/', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^login', views.login),
    url('^api/test2/', apis.Test2View.as_view()),
    url('^api/test3/', apis.Test3View.as_view(),name='rakesh'),
    url(r'^subscribe', views.subscribe),
    url(r'^index/', views.tryy),
    url(r'^docs/api', views.docs),
     url(r'^index.html/', views.main),
    url(r'^logPost', views.logPost),
    url(r'^editqty', views.editqty),
    url(r'^ajaxlogPost', views.ajaxlogPost),
    url(r'^logout', views.logout),
    url(r'^main', views.main),
    url(r'^desktophomereload', views.desktophomereload),
    url(r'^mobilehomereload', views.mobilehomereload),
    url(r'^categoryvendor', views.categoryVendorView),
    url(r'^category', views.categoryView),
    url(r'^desktopcategoryreload', views.desktopcategoryreload),
    url(r'^mobilecategoryreload', views.mobilecategoryreload),
    url(r'^addtocart', views.addtocart),
    url(r'^ajaxaddtocart', views.ajaxaddtocart),
    url(r'^landing', views.landing),
    url(r'^addvendors', views.addvendors),
     url(r'^configvendor0', views.configvendorlist),
    url(r'^configvendor', views.configvendor),
    url(r'^vendors', views.vendors),
    url(r'^stock', views.stock),
    url(r'^resetstock', views.resetstock),
    url(r'^ajaxstock', views.ajaxstock),
    url(r'^stats/orderitem', views.statsorderitem),
    url(r'^stats/ajaxfilter', views.ajaxdatefilter),
    url(r'^stats/ajax0filter', views.ajax0datefilter),
    url(r'^stats/ajaxproductfilter', views.ajaxproductfilter),
    url(r'^stats/order', views.statsorder),
    url(r'^stats/seller', views.statsseller),
    url(r'^stats/product', views.statsproduct),
    url(r'^userproduct', views.userproduct),
    url(r'^ajaxaddtouser', views.ajaxaddtouser),
    url(r'^ajaxremovefromuser', views.ajaxremovefromuser),
    url(r'^ajaxaddedreload', views.ajaxaddedreload),
    url(r'^ajaxrestreload', views.ajaxrestreload),
    url(r'^delvendoruser', views.delvendoruser),
    url(r'^ajaxcart', views.ajaxcart),
    url(r'^cart', views.cart),
    url(r'^orderDetail', views.orderDetail),
    url(r'^removeItemPost', views.removeItemPost),
    url(r'^ajaxremoveItemPost', views.ajaxremoveItemPost),
    url(r'^orderStep1', views.orderStep1),
    url(r'^ordercategory', views.ordercategory),
    url(r'^makeOrder', views.makeOrder),
    url(r'^seeOrder', views.seeOrder),
    url(r'^account', views.account),
    url(r'^searchForm', views.searchForm),
    url(r'^search', views.search),
    url(r'^product', views.productdetail),
    url(r'^home', views.shophome),
    url(r'^career', views.career),
    url(r'^contact', views.contact),
    url(r'^$', views.shophome),
    url(r'^newvendor', views.newvendor),
    url(r'^prod-newvendor', views.prodnewvendor),
    url(r'^newproductnewvendor', views.newprodnewvendor),
    url('^api/product/category/(?P<pid>.+)/$', apis.ProductsByCategoryList.as_view()),
    url('^api/cart/cartitems/(?P<cartid>.+)/$', apis.ItemsOfCartList.as_view()),
    url('^api/user/orders/(?P<userid>.+)/$', apis.OrdersOfUserList.as_view()),
    url('^api/order/items/(?P<orderid>.+)/$', apis.ItemsOfOrderList.as_view()),
    url('^api/user/customcategory/(?P<userid>.+)/$', apis.CustomCategoryProductsList.as_view()),
    url('^api/search/title/(?P<pid>.+)/$', apis.ProductSearchTitleList.as_view()),
    url('^api/search/description/(?P<pid>.+)/$', apis.ProductSearchDescriptionList.as_view()),
    url('^api/search/$', apis.ApiSearchList.as_view()),
    url('^api/addtocart/$', apis.ApiAddToCart.as_view()),
    url('^api/seecart/$', apis.ApiSeeCart.as_view()),
    url('^api/updatecart/$', apis.ApiUpdateCart.as_view()),
    url('^api/makeorder/$', apis.ApiMakeOrder.as_view()),
    url('^trycart/$', views.trycart),




]
urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
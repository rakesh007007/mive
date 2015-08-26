from django.conf.urls import include, url
from django.contrib import admin
from rest_framework import routers
from veggex import views
from django.contrib.staticfiles.urls import *
from mive.settings import *
router = routers.DefaultRouter()
router.register(r'address', views.AddressViewSet)
router.register(r'category', views.CategoryViewSet)
router.register(r'product', views.ProductViewSet)
router.register(r'user', views.UserViewSet)
router.register(r'cart', views.CartViewSet)
router.register(r'cartitem', views.CartitemViewSet)
router.register(r'order', views.OrderViewSet)
router.register(r'orderitem', views.OrderitemViewSet)
router.register(r'seller', views.SellerViewSet)
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^authtoken/', views.TestView.as_view(), name='auth-view'),
    url(r'^api/login', views.UserLoginView.as_view(), name='login-view'),
    #url(r'^api/custom/product/', views.UserLoginView.as_view(), name='login-view'),
    url(r'^api/', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^login', views.login),
    url('^api/test2/', views.Test2View.as_view()),
    url('^api/test3/', views.Test3View.as_view(),name='rakesh'),
    url(r'^subscribe', views.subscribe),
    url(r'^index/', views.tryy),
     url(r'^index.html/', views.main),
    url(r'^logPost', views.logPost),
    url(r'^ajaxlogPost', views.ajaxlogPost),
    url(r'^logout', views.logout),
    url(r'^main', views.main),
    url(r'^category', views.categoryView),
    url(r'^addtocart', views.addtocart),
    url(r'^ajaxaddtocart', views.ajaxaddtocart),
    url(r'^landing', views.landing),
    url(r'^cart', views.cart),
    url(r'^orderDetail', views.orderDetail),
    url(r'^removeItemPost', views.removeItemPost),
    url(r'^ajaxremoveItemPost', views.ajaxremoveItemPost),
    url(r'^orderStep1', views.orderStep1),
    url(r'^makeOrder', views.makeOrder),
    url(r'^seeOrder', views.seeOrder),
    url(r'^account', views.account),
    url(r'^searchForm', views.searchForm),
    url(r'^search', views.search),
    url(r'^product', views.productdetail),
    url(r'^shop', views.shophome),
    url(r'^$', views.tryy),
    url('^api/product/category/(?P<pid>.+)/$', views.ProductsByCategoryList.as_view()),
    url('^api/cart/cartitems/(?P<cartid>.+)/$', views.ItemsOfCartList.as_view()),
    url('^api/user/orders/(?P<userid>.+)/$', views.OrdersOfUserList.as_view()),
    url('^api/order/items/(?P<orderid>.+)/$', views.ItemsOfOrderList.as_view()),
    url('^api/user/customcategory/(?P<userid>.+)/$', views.CustomCategoryProductsList.as_view()),
    url('^api/search/$', views.ApiSearchList.as_view()),
    url('^api/addtocart/$', views.ApiAddToCart.as_view()),
    url('^api/updatecart/$', views.ApiUpdateCart.as_view()),
    url('^api/makeorder/$', views.ApiMakeOrder.as_view()),




]
urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
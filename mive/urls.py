from django.conf.urls import include, url
from django.contrib import admin
from rest_framework import routers
from veggex import views
from django.contrib.staticfiles.urls import *
from mive.settings import *
router = routers.DefaultRouter()
router.register(r'api/address', views.AddressViewSet)
router.register(r'api/category', views.CategoryViewSet)
router.register(r'api/product', views.ProductViewSet)
router.register(r'api/user', views.UserViewSet)
router.register(r'api/cart', views.CartViewSet)
router.register(r'api/cartitem', views.CartitemViewSet)
router.register(r'api/order', views.OrderViewSet)
router.register(r'api/orderditem', views.OrderitemViewSet)
router.register(r'api/seller', views.SellerViewSet)
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^authtoken/', views.TestView.as_view(), name='auth-view'),
    url(r'^api/login', views.UserLoginView.as_view(), name='login-view'),
    url(r'^try', views.tryy),
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^login', views.login),
    url(r'^logPost', views.logPost),
    url(r'^logout', views.logout),
    url(r'^main', views.main),
    url(r'^categoryView', views.categoryView),
    url(r'^addtocart', views.addtocart),
    url(r'^cart', views.cart),
    url(r'^orderDetail', views.orderDetail),
    url(r'^removeItemPost', views.removeItemPost),
    url(r'^orderStep1', views.orderStep1),
    url(r'^makeOrder', views.makeOrder),
    url(r'^seeOrder', views.seeOrder),
    url(r'^account', views.account),


]
#urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
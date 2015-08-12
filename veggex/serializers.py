from django.contrib.auth.models import User, Group
from rest_framework import serializers
from veggex.models import *


class AddressSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Address


class CategorySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Category
        fields = ('category_id', 'name', 'description',
                  'coverphotourl')
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('user_id', 'nameOfInstitution', 'nameOfOwner',
                  'institutionType', 'mailId', 'mobileNo', 'address', 'profilePhoto','gpsLocation','profilephotourl')
class CartSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Cart
class ProductSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Product
        fields = ('product_id', 'name', 'description',
                  'category', 'popularityIndex', 'unit', 'priceType', 'pricePerUnit','origin','maxAvailableUnits','qualityRemarks','isPerishable','seller','coverphotourl','origin')
class CartitemSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Cartitem
class OrderSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Order
class OrderitemSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Orderitem
class SellerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model =Seller
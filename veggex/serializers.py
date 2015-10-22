from django.contrib.auth.models import User, Group
from rest_framework import serializers
from veggex.models import *


class SellerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Seller
        fields = ('seller_id','nameOfSeller','mailId','mobileNo')
class AddressSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Address
        fields = ('address_id','area','city','state','pincode')
class OrdersOfUserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Order
        fields=('order_id','user','deliveryTime','timeOfCreate','timeOfUpdate','payment_mode','subtotal','status')
class ItemsOfOrderSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Orderitem
        fields = ('orderitem_id','order','unit','qtyInUnits','priceType','priceAtThatTime','product')
class CategorySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Category
        fields = ('category_id', 'name', 'description',
                  'coverphotourl')
class CartSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Cart
        fields = ('cart_id','timeOfCreate','timeOfUpdate','cartTotal')
class BaseProductSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Product
        fields = ('product_id', 'name', 'description','grade','related_products',
                  'popularityIndex', 'unit', 'priceType', 'pricePerUnit','origin','maxAvailableUnits','qualityRemarks','isPerishable','coverphotourl','origin')
class ProductSerializer(serializers.HyperlinkedModelSerializer):
    related_products = BaseProductSerializer(many=True)
    class Meta:
        model = Product
        fields = ('product_id', 'name', 'description','grade','related_products',
                  'popularityIndex', 'unit', 'priceType', 'pricePerUnit','origin','maxAvailableUnits','qualityRemarks','isPerishable','coverphotourl','origin')
class CategoryVendorSerializer(serializers.HyperlinkedModelSerializer):
    seller = SellerSerializer()
    products = ProductSerializer(many=True)
    class Meta:
        model = CategoryVendor
        fields = ('categoryvendor_id','seller','products')
class UserSerializer(serializers.HyperlinkedModelSerializer):
    cart = CartSerializer()
    categories = CategoryVendorSerializer(many=True)
    class Meta:
        model = User
        fields = ('user_id', 'nameOfInstitution', 'nameOfOwner',
                  'institutionType', 'mailId','cartId', 'mobileNo','cart', 'address', 'profilePhoto','gpsLocation','profilephotourl','categories','creditlimit')
class ProductsByCategorySerializer(serializers.HyperlinkedModelSerializer):
    related_products = ProductSerializer(many=True)
    class Meta:
        model = Product
        fields = ('product_id', 'name','grade','related_products','description',
                  'category', 'popularityIndex', 'unit', 'priceType', 'pricePerUnit','origin','maxAvailableUnits','qualityRemarks','isPerishable','coverphotourl','origin')
class CartitemSerializer(serializers.HyperlinkedModelSerializer):
    product = ProductSerializer()
    class Meta:
        model = Cartitem
        fields=('cartitem_id','cart','qtyInUnits','product')
class OrderSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Order
        fields=('order_id','user','deliveryTime','timeOfCreate','timeOfUpdate','payment_mode','subtotal','status')
class OrderitemSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Orderitem
        fields = ('orderitem_id','order','unit','qtyInUnits','priceType','priceAtThatTime','product')
class CustomCategoryProductsSerializer(serializers.HyperlinkedModelSerializer):
    product = ProductSerializer(many=True)
    class Meta:
        model = CustomCategoryProducts
        fields = ('product',)
class ItemsOfCartSerializer(serializers.HyperlinkedModelSerializer):
    #Important thing for serializing django foreign key objects
    # **Important**
    product = ProductSerializer()
    class Meta:
        model = Cartitem
        fields=('cartitem_id','cart','qtyInUnits','product')
class ItemsOfOrderSerializer(serializers.HyperlinkedModelSerializer):
    product = ProductSerializer()
    class Meta:
        model = Orderitem
        fields = ('orderitem_id','order','unit','qtyInUnits','priceType','priceAtThatTime','product')
class StockSerializer(serializers.HyperlinkedModelSerializer):
    product = ProductSerializer()
    class Meta:
        model = Currentstock
        fields = ('currentstock_id','remainingstock','product')
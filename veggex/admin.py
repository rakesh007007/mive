from django.contrib import admin
from veggex.models import *

# Register your models here.

admin.site.register(User)
admin.site.register(Address)
admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Cart)
admin.site.register(Cartitem)
admin.site.register(Order)
admin.site.register(Orderitem)
admin.site.register(Seller)
admin.site.register(Mandi)
admin.site.register(Subscribe)
admin.site.register(CustomCategoryProducts)
admin.site.register(Accartitem)



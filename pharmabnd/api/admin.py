from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import CustomUser,Medicine,Inventory,Orders

# Register your models here.
admin.site.register(CustomUser)
admin.site.register(Medicine)
admin.site.register(Inventory)
admin.site.register(Orders)

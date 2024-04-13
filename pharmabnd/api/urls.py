from django.contrib import admin
from django.urls import path,include
from .views import MedicineList,MedicineRetrieveView,InventoryView,AvailabilityView,OrdersList

urlpatterns = [
  
    path('medicinelist/', MedicineList.as_view(),name='index'),
     path('orders/', OrdersList.as_view(),name='index'),
    path('medicine/<pk>', MedicineRetrieveView.as_view(),name='medicine'),
    path('inventory/',InventoryView.as_view(),name="index"),
    
    path('checkmed/', AvailabilityView.as_view(),name='index'),

    path('auth/', include('dj_rest_auth.urls')),
     path('auth/registration/', include('dj_rest_auth.registration.urls'))

]

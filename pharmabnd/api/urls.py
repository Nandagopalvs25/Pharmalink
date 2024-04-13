from django.contrib import admin
from django.urls import path,include
from .views import MedicineList,MedicineRetrieveView

urlpatterns = [
  
    path('medicinelist/', MedicineList.as_view(),name='index'),
    path('medicine/<pk>', MedicineRetrieveView.as_view(),name='medicine'),
    path('auth/', include('dj_rest_auth.urls')),
     path('auth/registration/', include('dj_rest_auth.registration.urls'))

]

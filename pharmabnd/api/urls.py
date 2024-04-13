from django.contrib import admin
from django.urls import path,include
from .views import MedicineList

urlpatterns = [
  
    path('', MedicineList.as_view(),name='index'),
    path('auth/', include('dj_rest_auth.urls')),
     path('auth/registration/', include('dj_rest_auth.registration.urls'))

]

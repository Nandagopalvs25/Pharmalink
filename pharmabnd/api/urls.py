from django.contrib import admin
from django.urls import path,include
from .views import indexView

urlpatterns = [
  
    path('', indexView,name='index'),
    path('auth/', include('dj_rest_auth.urls')),

]

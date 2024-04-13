
from django.contrib import admin
from django.urls import path,include
from .views import indexview





urlpatterns = [
     path('/auth/', include('dj_rest_auth.urls')),
     path('index/',indexview,name="index" ),


]

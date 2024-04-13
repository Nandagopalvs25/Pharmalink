from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
from .serializers import MedicineSerializer,MedicineDetailSerializer
from .models import Medicine,Inventory
from rest_framework import generics
from rest_framework import filters






class MedicineList(generics.ListCreateAPIView):
    search_fields = ['name']
    filter_backends = (filters.SearchFilter,)
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer
   
class MedicineRetrieveView(generics.RetrieveAPIView):
    queryset=Medicine.objects.all()
    serializer_class=MedicineDetailSerializer


class Inventory(generics.CreateAPIView):
    queryset=Inventory.objects.all()
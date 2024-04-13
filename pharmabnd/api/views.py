from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
from .serializers import MedicineSerializer
from .models import Medicine
from rest_framework import generics





class MedicineList(generics.ListCreateAPIView):
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer
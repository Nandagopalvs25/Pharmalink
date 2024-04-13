import json
from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
from .serializers import MedicineSerializer,MedicineDetailSerializer,InventorySerializer
from .models import Medicine,Inventory
from rest_framework import generics
from rest_framework import filters
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework.views import APIView
from rest_framework import authentication, permissions
from rest_framework.response import Response








class MedicineList(generics.ListCreateAPIView):
    search_fields = ['name']
    filter_backends = (filters.SearchFilter,)
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer
   
class MedicineRetrieveView(generics.RetrieveAPIView):
    queryset=Medicine.objects.all()
    serializer_class=MedicineDetailSerializer


 
class InventoryView(APIView):
    @method_decorator(csrf_exempt)
    def post(self,request):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        inv_id = body['id']
        medicine_id=body["medicineid"]
        inv = Inventory.objects.get(user=request.user)
        inv.medicines.add( Medicine.objects.get(id=medicine_id))
        return HttpResponse("WOrks")
    
    def get(self,request):
        inv = Inventory.objects.get(user=request.user)
        serializer = InventorySerializer(inv)
        return Response(serializer.data)

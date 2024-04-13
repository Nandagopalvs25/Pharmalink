import json
from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
from .serializers import MedicineSerializer,MedicineDetailSerializer,InventorySerializer,PharmacySerializer
from .models import Medicine,Inventory
from rest_framework import generics
from rest_framework import filters
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework.views import APIView
from rest_framework import authentication, permissions,status
from rest_framework.response import Response
import requests








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

class AvailabilityView(APIView):
     @method_decorator(csrf_exempt)
     def post(self,request):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        med_id = body['med_id']
        invs= Inventory.objects.filter(medicines__id=med_id)
        if not invs:
             s=PharmacySerializer(data={'name': 'Medicine Not Available', 'distance': 'Come back Later'})
             s.is_valid(raise_exception=True)
             response_data=s.initial_data
             return Response(response_data, status=status.HTTP_200_OK)
           
        for i in invs:
            print(i.user.username)
       
        key='XdkvzAxANCyTYDfEmM1Zxz5vWOpQ8LpC5JRPQzI824gMrrrTJYyxzo2ALHPIpnr3'
        origin = '8.470367668729352, 76.97932663642356'

         
  
        dest={}
        for i in invs:
            dest.update({i.user.username:{'coords':i.user.latitude+','+i.user.longitude}})
        URL= "https://api.distancematrix.ai/maps/api/distancematrix/json?origins="+origin+"&destinations="
        for x in dest.keys():
          URL=URL+dest[x]['coords']+"|"
        URL=URL+"&key="+key
        r = requests.get(url = URL)
        data = r.json()
        
        data['rows'][0]['elements'].pop(1)
        i=0
        for x in dest.keys():
           dest[x].update({'dist':float(data['rows'][0]['elements'][i]['distance']['text'].split()[0])})
           i+=1
        res = sorted(dest.items(), key = lambda x: x[1]['dist'])
        ls=[]
        for x in res:
           dict={'name':x[0],'distance':x[1]['dist']}
           print(x[1])
           ls.append(dict)

        s=PharmacySerializer(data=ls,many=True)
        s.is_valid(raise_exception=True)
        response_data=s.initial_data
        return Response(response_data, status=status.HTTP_200_OK)


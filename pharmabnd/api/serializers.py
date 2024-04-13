
from .models import Medicine,Inventory
from rest_framework import serializers




class MedicineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medicine
        fields=['id','name','mrp']


class MedicineDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model=Medicine
        fields='__all__'


class InventorySerializer(serializers.ModelSerializer):
    class Meta:
        model=Inventory
        fields='__all__'
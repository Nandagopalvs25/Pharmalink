
from .models import Medicine,Inventory,Orders
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
        depth=2
        fields='__all__'


class AvailablePharm:
     def __init__(self, name,distance):
        self.name=name
        self.distance=distance


class PharmacySerializer(serializers.Serializer):
    name = serializers.CharField()
    distance = serializers.CharField(max_length=30)     


class OrderSerializer(serializers.Serializer):
           class Meta:
                model=Orders
                depth=2
                fields='__all__'
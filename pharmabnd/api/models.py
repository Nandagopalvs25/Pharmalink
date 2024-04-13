from django.db import models
from django.contrib.auth.models import AbstractUser


CHOICES = [
    ("USR", "User"),
    ("PHR", "Pharmacy")]


# Create your models here.
class CustomUser(AbstractUser):
    CHOICES = (
    ("USR", "User"),
    ("PHR", "Pharmacy"))
    usertype=models.CharField(max_length=10,choices=CHOICES)
    latitude= models.CharField(max_length=255,null=True,blank=True)
    longitude= models.CharField(max_length=255,null=True,blank=True)



  

class Medicine(models.Model):
    name=models.CharField(max_length=255)
    mrp=models.CharField(max_length=10)
    sp=models.CharField(max_length=10,null=True,blank=True)
    presc=models.BooleanField(default=False)
    manf=models.CharField(max_length=255)
    sidef=models.TextField()
    howtouse=models.TextField()
    description=models.TextField()
    therapyclass=models.CharField(max_length=255)

    def __str__(self):
        return self.name

class Inventory(models.Model):
     user = models.OneToOneField(CustomUser,on_delete=models.CASCADE,primary_key=True)
     medicines=models.ManyToManyField(Medicine,blank=True,null=True)

     def __str__(self):
        return self.user.username

class Orders(models.Model):
     user = models.OneToOneField(CustomUser,on_delete=models.CASCADE,primary_key=True)
     medicines=models.ManyToManyField(Medicine,blank=True,null=True)
     number_of_items = models.PositiveIntegerField(default=0)
     total = models.DecimalField(default=0.00, max_digits=5,decimal_places=2)
    

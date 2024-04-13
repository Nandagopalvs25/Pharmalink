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


class Inventory(models.Model):
     user = models.OneToOneField(CustomUser,on_delete=models.CASCADE,primary_key=True)

  

class Medicine(models.Model):
    inventory = models.ForeignKey(Inventory,related_name="inventory", on_delete=models.CASCADE,null=True)
    name=models.CharField(max_length=255)
    mrp=models.CharField(max_length=10)
    sp=models.CharField(max_length=10,null=True,blank=True)
    presc=models.BooleanField(default=False)
    manf=models.CharField(max_length=255)
    sidef=models.TextField()
    howtouse=models.TextField()
    description=models.TextField()
    therapyclass=models.CharField(max_length=255)


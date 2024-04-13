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
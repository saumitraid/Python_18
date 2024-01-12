from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class Patient(AbstractUser):
    mobile=models.CharField(max_length=12, verbose_name='Contact Number')
    age=models.CharField(max_length=3)
    gender=models.CharField(max_length=10)

class Doctor(models.Model):
    did=models.AutoField(primary_key=True)
    dname=models.CharField(max_length=200, verbose_name='Doctor Name')
    degree=models.CharField(max_length=255, verbose_name='Doctor Degree')
    specialization=models.CharField(max_length=255)
    contact=models.CharField(max_length=12, verbose_name='Contact Number')
    yoe=models.CharField(max_length=2, verbose_name='Year of Experience')

class Schedule(models.Model):
    sid=models.AutoField(primary_key=True)
    days=models.CharField(max_length=255, verbose_name='Available Days')
    time_slot=models.CharField(max_length=200, verbose_name='Available Time')
    doctor=models.ForeignKey(Doctor, on_delete=models.CASCADE, verbose_name='Doctor')

class Appointment(models.Model):
    appid=models.AutoField(primary_key=True)
    doctor=models.ForeignKey(Doctor, on_delete=models.CASCADE, verbose_name='Doctor')
    patient=models.ForeignKey(Patient, on_delete=models.CASCADE, related_name='Patient')
    appmadeon=models.DateField(auto_now_add=True, blank=False, verbose_name='Appointment Made Date')
    appdate=models.DateField(verbose_name='Appointment Date')
from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class Pataient(AbstractUser):
    mobile=models.CharField(max_length=15, verbose_name='Mobile Number')
    gender=models.CharField(max_length =6,verbose_name='Gender' )
    age=models.CharField(max_length=2,verbose_name='Age')

class Department(models.Model):
    deptid=models.AutoField(primary_key=True)
    image=models.ImageField(upload_to='dept_img/')
    deptname=models.CharField(max_length=255, verbose_name='Department Name')
    deptdesc=models.TextField(verbose_name='Department Description')

    def __str__(self):
        return self.deptname
class Doctor(models.Model):
    did=models.AutoField(primary_key=True)
    dname=models.CharField(max_length=150, verbose_name='Doctor Name')
    dqua=models.CharField(max_length=255, verbose_name='Doctor Qualification')
    aboutdoc=models.TextField(verbose_name='About Doctor')
    dspec=models.CharField(max_length=255, verbose_name='Doctor Specialization')
    dept=models.ForeignKey(Department, on_delete=models.CASCADE, verbose_name='Select Department')

    def __str__(self):
        return self.dname
class Schedule(models.Model):
    sid=models.AutoField(primary_key=True)
    days=models.CharField(max_length=200, verbose_name='Available Days')
    t_slot=models.CharField(max_length=200)
    doctor=models.ForeignKey(Doctor, on_delete=models.CASCADE, verbose_name='Select Doctor')
    noofpp=models.CharField(max_length=2,verbose_name='Number of Patients')

class Appointment(models.Model):
    appid=models.AutoField(primary_key=True)
    doctor=models.ForeignKey(Doctor, on_delete=models.CASCADE, verbose_name='Doctor')
    patient=models.ForeignKey(Pataient, on_delete=models.CASCADE, related_name='Patient')
    appmadeon=models.DateField(auto_now_add=True, blank=False, verbose_name='Appointment Made Date')
    appdate=models.DateField(verbose_name='Appointment Date')
from django.contrib.auth import authenticate, login, logout,update_session_auth_hash
from django.shortcuts import render, redirect
from . forms import PatientForm,SignInForm ,ChangeProfileFrm,ChngePassFrm
from django.contrib import messages
from .forms import AppointmentForm
from .models import Appointment ,Department, Doctor
from app1.models import Schedule
from datetime import date, timedelta
import datetime

# Create your views here.   
def home(request):
    return render(request, 'app1/index.html')

def about(request):
    return render(request, 'app1/about.html')

def contact(request):
    return render(request, 'app1/contact.html')

def services(request):
    return render(request, 'app1/service.html')

def team(request):
    allDoc=Doctor.objects.all()
    return render(request, 'app1/team.html', {'allDoc':allDoc})

def testimonial(request):
    return render(request, 'app1/testimonial.html')
def feature(request):
    return render(request, 'app1/feature.html')

def signup(request):
    form=PatientForm()
    if request.method=='POST':
        form=PatientForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                messages.success(request, 'Account created successfully')
            except Exception as e:
                messages.error(request, 'Account creation failed')
    else:
        form=PatientForm()
    return render(request, 'app1/signup.html', {'form':form})

def signin(request):
    if request.POST:
        frm=SignInForm(request=request, data=request.POST)
        if frm.is_valid():
            uname=frm.cleaned_data['username']
            upass=frm.cleaned_data['password']
            user=authenticate(username=uname, password=upass)
            if user is not None:
                login(request, user)
                return redirect('/profile/')
    else:
        frm=SignInForm()
    return render(request, 'app1/signin.html', {'form':frm})

def userLogout(request):
    logout(request)
    return redirect('/signin/')

def profile(request):
    if request.user.is_authenticated:
        alldept=Department.objects.all()
        return render(request, 'app1/profile.html', {'alldept':alldept})
    else:
        return redirect('/signin/')
    
def makeApp(request,did):
    if request.user.is_authenticated:
        if request.POST:
            schedule=Schedule.objects.get(doctor=did)
            sDays=schedule.days.split()
            appdate=datetime.datetime.strptime(request.POST.get('appdate'), "%Y-%m-%d").date()
            appSDay=appdate.strftime('%A')
            # print(appSDay)
            # print(sDays)
            frm=AppointmentForm(request.POST)
            if frm.is_valid():
                f=0
                for d in sDays:
                    if appSDay==d:
                        f=1
                if f==1:
                    instance=frm.save(False)
                    instance.doctor_id = did
                    instance.patient_id=request.user.id
                    instance.save()
                    messages.success(request, 'Your appointment has been made successfully')
                else:
                    messages.error(request, 'Doctor will not be available that day')
        else:
            frm=AppointmentForm()
        allDoc=Schedule.objects.raw("SELECT s.*, d.* FROM app1_schedule s INNER JOIN  app1_doctor d ON s.doctor_id=d.did WHERE d.did={}".format(did))
        return render(request, 'app1/makeapp.html', {'allDoc':allDoc, 'frm':frm})
    else:
        return redirect('/signin/')
    
def appointment(request):
    if request.user.is_authenticated:
        app1=Appointment.objects.raw("SELECT a.*, d.*, s.days, s.t_slot FROM app1_appointment a INNER JOIN app1_doctor d ON  a.doctor_id=d.did INNER JOIN app1_schedule s ON a.doctor_id=s.doctor_id WHERE a.patient_id={}".format(request.user.id))
        return render(request, 'app1/appointment.html',{'allDoc':app1})
    else:
        return redirect('/signin/')
    
def doctor(request,deptid):
    if request.user.is_authenticated:
        allDoc=Schedule.objects.raw("SELECT s.*, d.* FROM app1_schedule s INNER JOIN  app1_doctor d ON s.doctor_id=d.did WHERE d.dept_id={}".format(deptid))
        return render(request, 'app1/doc.html', {'allDoc':allDoc})   
    else:
        return redirect('/signin/')
    
def changeProfile(request):
    if request.user.is_authenticated:
        if request.POST:
            frm = ChangeProfileFrm(request.POST, instance=request.user)
            if frm.is_valid():
                try:
                    frm.save()
                    messages.success(request,'Profile Update successfully')
                except Exception as e:
                    messages.error(request, 'Profile Could Not Update successfully')
        else:
            frm=ChangeProfileFrm(instance=request.user)
        return render(request, 'app1/changepro.html', {'frm':frm})
    else:
        return redirect('/signin/')

def chagapss(request):
    if request.user.is_authenticated:
        if request.POST:
            frm = ChngePassFrm(request.user, request.POST)
            if frm.is_valid():
                frm.save()
                update_session_auth_hash(request, request.user)
                messages.success(request, 'Password change successfully')
        else:
            frm=ChngePassFrm(request.user)
        return render(request, 'app1/changepass.html', {'frm':frm})
    else:
        return redirect('/signin/')
    
def cancelApp(request, appid):
    if request.user.is_authenticated:
        try:
            appointment = Appointment.objects.get(appid=appid,patient=request.user)
            appointment.delete()
            messages.success(request, 'Appointment cancel successfully')
        except Exception as e:
            messages.success(request, 'Appointment not cancel successfully')
        return redirect('/appointment/')
    else:
        return redirect('/signin/')
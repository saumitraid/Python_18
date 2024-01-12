from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
import datetime
from . models import Schedule, Doctor, Appointment
from . forms import MyRegFrm, MyLoginFrm, AppointmentForm, ChangeProfileFrm, ChngePassFrm
# Create your views here.

def home(request):
    return render(request, 'myapp/home.html')

def about(request):
    return render(request, 'myapp/about.html')

def service(request):
    return render(request, 'myapp/service.html')

def userLogin(request):
    if request.POST:
        frm=MyLoginFrm(request=request, data=request.POST)
        if frm.is_valid():
            uname=frm.cleaned_data['username']
            upwd=frm.cleaned_data['password']
            user=authenticate(username=uname, password=upwd)
            if user is not None:
                login(request, user)
                return redirect('/profile')
    else:
        frm=MyLoginFrm()
    return render(request, 'myapp/login.html', {'frm':frm})

def userReg(request):
    if request.POST:
        frm=MyRegFrm(request.POST)
        if frm.is_valid():
            try:
                frm.save()
                messages.success(request, "New patient registration is successfull")
            except Exception as e:
                messages.error(request, "New patient registration is unsuccessfull")
    else:
        frm=MyRegFrm()
    return render(request, 'myapp/reg.html', {'frm':frm})

def userLogout(request):
    logout(request)
    return redirect('/login')

def contact(request):
    return render(request, 'myapp/contact.html')

def profile(request):
    if request.user.is_authenticated:
        allDoc=Schedule.objects.raw("SELECT s.*, d.* FROM myapp_schedule s INNER JOIN  myapp_doctor d ON s.doctor_id=d.did")
        return render(request, 'myapp/profile.html', {'allDoc':allDoc})
    else:
        return redirect('/login')

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
        allDoc=Schedule.objects.raw("SELECT s.*, d.* FROM myapp_schedule s INNER JOIN  myapp_doctor d ON s.doctor_id=d.did WHERE d.did={}".format(did))
        return render(request, 'myapp/makeApp.html', {'allDoc':allDoc, 'frm':frm})
    else:
        return redirect('/login')
    
def myAppointment(request):
    if request.user.is_authenticated:
        myApp=Appointment.objects.raw("SELECT a.*, d.*, s.days, s.time_slot FROM myapp_appointment a INNER JOIN myapp_doctor d ON  a.doctor_id=d.did INNER JOIN myapp_schedule s ON a.doctor_id=s.doctor_id WHERE a.patient_id={}".format(request.user.id))
        return render(request, 'myapp/myAppointment.html',{'allDoc':myApp})
    else:
        return redirect('/login')

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
        return render(request, 'myapp/chngProfile.html', {'frm':frm})
    else:
        return redirect('/login')

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
        return render(request, 'myapp/chngPass.html', {'frm':frm})
    else:
        return redirect('/login')
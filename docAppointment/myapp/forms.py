from django import forms
from datetime import date, timedelta
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, UserChangeForm, PasswordChangeForm
from . models import Patient, Appointment

class DateInput(forms.DateInput):
    input_type = 'date'

class MyRegFrm(UserCreationForm):
    username=forms.CharField(label='Enter user name',
        widget=forms.TextInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter user name'}))
    first_name=forms.CharField(label='Enter first name',
        widget=forms.TextInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter first name'}))
    last_name=forms.CharField(label='Enter last name',
        widget=forms.TextInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter last name'}))
    email=forms.CharField(label='Enter email-id',
        widget=forms.EmailInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter email-id'}))
    mobile=forms.CharField(label='Enter contact number',
        widget=forms.NumberInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter contact number'}))
    age=forms.CharField(label='Enter patient age',
        widget=forms.NumberInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter patient age'}))
    gender=forms.CharField(label='Enter patient gender',
        widget=forms.TextInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter patient gender'}))
    password1=forms.CharField(label='Enter password',
        widget=forms.PasswordInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter password'}))
    password2=forms.CharField(label='Enter confirm password',
        widget=forms.PasswordInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter confirm password'}))
    class Meta:
        model = Patient
        fields = ("username","first_name", "last_name","email","mobile","age","gender")

class MyLoginFrm(AuthenticationForm):
    username=forms.CharField(label='Enter user name',
        widget=forms.TextInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter user name'}))
    password=forms.CharField(label='Enter password',
        widget=forms.PasswordInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter password'}))

class AppointmentForm(forms.ModelForm):
    appdate=forms.DateField(label="Select Appointment date*",
            widget=DateInput(attrs={
            'class': 'form-control border-primary',
            'placeholder': 'Select Appointment date'
        }))
    def clean_appdate(self):
        ad = self.cleaned_data['appdate']
        td=date.today()
        fd=date.today() + timedelta(days=30)
        if ad==td:
            raise forms.ValidationError('Selected date may not be today')
        elif ad < td:
            raise forms.ValidationError('Selected date may not be previous day')
        elif ad > fd:
            raise forms.ValidationError('Selected date must be within 30 days from current date')
        return ad
    class Meta:
        model = Appointment
        fields = ['appdate']

class ChangeProfileFrm(UserChangeForm):
    password=None
    username=None
    first_name=forms.CharField(label='Enter first name',
        widget=forms.TextInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter first name'}))
    last_name=forms.CharField(label='Enter last name',
        widget=forms.TextInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter last name'}))
    email=forms.CharField(label='Enter email-id',
        widget=forms.EmailInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter email-id'}))
    mobile=forms.CharField(label='Enter contact number',
        widget=forms.NumberInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter contact number'}))
    age=forms.CharField(label='Enter patient age',
        widget=forms.NumberInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter patient age'}))
    gender=forms.CharField(label='Enter patient gender',
        widget=forms.TextInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter patient gender'}))
    class Meta:
        model = Patient
        fields = ("first_name", "last_name","email","mobile","age","gender")

class ChngePassFrm(PasswordChangeForm):
    old_password=forms.CharField(label='Enter current password',
        widget=forms.PasswordInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter current password'}))
    new_password1=forms.CharField(label='Enter new password',
        widget=forms.PasswordInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter new password'}))
    new_password2=forms.CharField(label='Enter confirm password',
        widget=forms.PasswordInput(attrs={'class': 'form-control border-primary', 
                                      'placeholder':'Enter confirm password'}))
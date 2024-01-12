from django.contrib import admin
from django.http.request import HttpRequest
from . models import Patient, Doctor, Schedule, Appointment


admin.site.site_header='Doctor Appointment Administration'
admin.site.site_title='Administration'
admin.site.index_title='Doctor Appointment'

# Register your models here.
@admin.register(Doctor)
class DoctorAdmin(admin.ModelAdmin):
    list_display=('dname', 'degree', 'specialization', 'contact', 'yoe')

@admin.register(Schedule)
class ScheduleAdmin(admin.ModelAdmin):
    list_display=('doctors','days', 'time_slot')
    raw_id_fields=['doctor']

    def doctors(self, obj):
        return obj.doctor.dname

@admin.register(Appointment)
class AppointmentAdmin(admin.ModelAdmin):
    list_display=('patients','doctors', 'appmadeon', 'appdate')

    def patients(self, obj):
        return obj.patient.first_name+" "+obj.patient.last_name
    
    def doctors(self, obj):
        return obj.doctor.dname
    
    def has_change_permission(self, request, obj=None):
        return False
    def has_delete_permission(self, request, obj=None):
        return False
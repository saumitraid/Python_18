from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home-page'),
    path('about', views.about, name='about-page'),
    path('service', views.service, name='service-page'),
    path('login', views.userLogin, name='login-page'),
    path('contact', views.contact, name='contact-page'),
    path('reg', views.userReg, name='reg-page'),
    path('profile', views.profile, name='profile-page'),
    path('logout', views.userLogout, name='logout-page'),
    path('makeapp/<int:did>', views.makeApp, name='app-page'),
    path('myapp', views.myAppointment, name='myapp-page'),
    path('chagpro', views.changeProfile, name='chagpro-page'),
    path('chagapss', views.chagapss, name='chagapss-page'),
]

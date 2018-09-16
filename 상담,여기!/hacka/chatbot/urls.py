from django.urls import include, path
from . import views

urlpatterns = [
    path('', views.keyboard, name='start'),
    path('keyboard/', views.keyboard),
    path('message', views.message),
]
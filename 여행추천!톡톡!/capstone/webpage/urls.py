from django.urls import include, path
from . import views
from .views import *

urlpatterns = [
    path('', views.main_page, name = 'main_page'),
    path('signup/', views.signup_acc),
    path('signup/insertacc/', views.Join_Acc.as_view()),
    path('delete/', views.delete),
    path('delete/deleteacc/', views.Delete_acc.as_view()),
    path('findpw/', views.find_acc),
    path('findpw/find/', views.Find_Acc.as_view()),
    path('login/', views.login_acc),
    path('logout/', views.logout_acc),
    path('ajax/', views.make_rpl),
    path('test/', views.test_page),
    path('list/', views.db_list),
]

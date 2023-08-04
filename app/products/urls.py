from django.urls import path, include
from .views import *
from rest_framework.routers import DefaultRouter

from products import views


router = DefaultRouter()
router.register('', views.ProductViewSet)
app_name = 'products'

urlpatterns = [
    path('', include(router.urls) ),
]
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AudiobookViewSet, ReviewViewSet

router = DefaultRouter()
router.register(r'audiobooks', AudiobookViewSet)
router.register(r'reviews', ReviewViewSet)

urlpatterns = [
  path('', include(router.urls)),
]
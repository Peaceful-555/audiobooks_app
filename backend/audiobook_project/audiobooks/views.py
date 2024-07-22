from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from .models import Audiobook, Review
from .serializers import AudiobookSerializer, ReviewSerializer

class AudiobookViewSet(viewsets.ModelViewSet):
  queryset = Audiobook.objects.all()
  serializer_class = AudiobookSerializer

class ReviewViewSet(viewsets.ModelViewSet):
  queryset = Review.objects.all()
  serializer_class = ReviewSerializer
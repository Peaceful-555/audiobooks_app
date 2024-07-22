from rest_framework import serializers
from .models import Audiobook, Review

class AudiobookSerializer(serializers.ModelSerializer):
  class Meta:
      model = Audiobook
      fields = '__all__'

class ReviewSerializer(serializers.ModelSerializer):
  class Meta:
      model = Review
      fields = '__all__'
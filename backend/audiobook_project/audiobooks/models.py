
# Create your models here.
from django.db import models

class Audiobook(models.Model):
  title = models.CharField(max_length=255)
  author = models.CharField(max_length=255)
  genre = models.CharField(max_length=100)
  description = models.TextField()
  cover_image = models.URLField(max_length=200)

  def __str__(self):
      return self.title

class Review(models.Model):
  audiobook = models.ForeignKey(Audiobook, related_name='reviews', on_delete=models.CASCADE)
  user = models.CharField(max_length=255)
  rating = models.IntegerField()
  comment = models.TextField()

  def __str__(self):
      return f'{self.user} - {self.audiobook.title}'

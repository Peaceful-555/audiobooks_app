import random
from django.core.management.base import BaseCommand
from audiobooks.models import Audiobook

class Command(BaseCommand):
  help = 'Populate the database with random audiobooks'

  def handle(self, *args, **kwargs):
      genres = ['Fiction', 'Non-Fiction', 'Science Fiction', 'Fantasy', 'Mystery', 'Thriller']
      for _ in range(50):
          Audiobook.objects.create(
              title=f'Audiobook {_}',
              author=f'Author {_}',
              genre=random.choice(genres),
              description=f'Description for Audiobook {_}',
              cover_image='https://placehold.co/600x400'
          )
      self.stdout.write(self.style.SUCCESS('Database populated with random audiobooks'))
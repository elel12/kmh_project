from django.db import models

# Create your models here.

class acc_search(models.Model):
    search_id = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    search_link = models.TextField()

# Create your models here.

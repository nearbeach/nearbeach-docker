from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
# from django.conf import settings

import os

class Command(BaseCommand):
    def handle(self, *args, **options):
        if User.objects.count() == 0:
            username = os.getenv("ADMIN_USERNAME")
            email = os.getenv("ADMIN_EMAIL")
            password = User.objects.make_random_password()
            print('Creating account for %s (%s)' % (username, email))
            admin = User.objects.create_superuser(email=email, username=username, password=password)
            admin.is_active = True
            admin.is_admin = True
            admin.save()

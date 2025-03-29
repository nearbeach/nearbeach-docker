from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
# from django.conf import settings

import os
import string
import secrets

class Command(BaseCommand):
    def handle(self, *args, **options):
        if User.objects.count() == 0:
            username = os.getenv("ADMIN_USERNAME", "admin")
            email = os.getenv("ADMIN_EMAIL", "admin@localhost")
            password = self.generate_initial_password()
            print('Creating account for %s (%s)' % (username, email))
            admin = User.objects.create_superuser(email=email, username=username, password=password)
            admin.is_active = True
            admin.is_admin = True
            admin.save()

    # from https://docs.python.org/3/library/secrets.html#recipes-and-best-practices
    def generate_initial_password(self):
        alpha = string.ascii_letters + string.digits
        password = ''.join(secrets.choice(alpha) for i in range(16))
        return password

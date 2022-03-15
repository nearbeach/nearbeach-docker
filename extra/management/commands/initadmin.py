from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
from django.conf import settings


class Command(BaseCommand):
    def handle(self, *args, **options):
        print("Creating Super Admin")

        username = 'admin'
        email = 'support@nearbeach.org'
        password = 'admin'
        print('Creating account for %s (%s)' % (username, email))
        admin = User.objects.create_superuser(
            email=email,
            username=username,
            password=password
        )
        admin.is_active = True
        admin.is_admin = True
        admin.save()
        """
        if User.objects.count() == 0:
            for user in settings.ADMINS:
                username = 'admin'
                email = 'support@nearbeach.org'
                password = 'admin'
                print('Creating account for %s (%s)' % (username, email))
                admin = User.objects.create_superuser(email=email, username=username, password=password)
                admin.is_active = True
                admin.is_admin = True
                admin.save()
        else:
            print('Admin accounts can only be initialized if no Accounts exist')
        """
#! /bin/sh

set -e

echo "**** Waiting for DB availability ****"
python manage.py wait_for_database

echo "**** begining DB setup ****"
python manage.py migrate
python manage.py initadmin
echo "**** DB setup complete ****"

echo "**** Updating Crontab ****"
python manage.py updatecrontab

echo "**** Starting Cron Services ****"
crond -b -l 8

echo "**** running NearBeach ****"
python manage.py runserver 0.0.0.0:8000

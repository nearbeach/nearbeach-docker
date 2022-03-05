# syntax=docker/dockerfile:1
FROM python:3.8-slim-buster
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /oceansuite

COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install gcc python3-setuptools shared-mime-info libjpeg-dev zlib1g-dev -y

RUN pip install --upgrade pip wheel
RUN pip install --default-timeout=1000 -r requirements.txt

COPY oceansuite .

CMD ["python3", "manage.py", "migrate" ]
CMD ["python3", "manage.py", "createsuperuser", "--no-input", "--username admin", "--email support@nearbeach.org" ]
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
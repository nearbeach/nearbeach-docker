# syntax=docker/dockerfile:1
#FROM python:3.8-slim-buster
FROM python:3.8.3-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /oceansuite

COPY requirements.txt requirements.txt

#RUN apt-get update && apt-get install gcc python3-setuptools shared-mime-info libjpeg-dev zlib1g-dev -y
#RUN apt-get install libmariadbclient-dev libssl-dev -y

# install dependencies
RUN apk update
RUN pip install --upgrade pip wheel
RUN apk add python3-dev
RUN apk add gpgme-dev
RUN apk add libc-dev
RUN apk add gcc jpeg-dev zlib-dev libffi-dev freetype-dev musl-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev cairo-dev pango-dev gdk-pixbuf-dev
RUN apk add mariadb-dev
COPY ./requirements.txt .
RUN pip install -r requirements.txt
RUN pip install mysqlclient

#RUN pip install --upgrade pip wheel
#RUN pip install --default-timeout=1000 -r requirements.txt
#RUN pip install mysqlclient

COPY oceansuite/* .
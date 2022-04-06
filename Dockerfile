# syntax=docker/dockerfile:1
FROM python:3.8.3-alpine

# Environmental Variables for the Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Setup of Working Directory
WORKDIR /oceansuite

# Copy the requirements.txt file
COPY requirements.txt requirements.txt

# Update apk and pip
RUN echo "**** Update apk and Pip ****" && \
    apk update && \
    pip install --upgrade pip wheel

# Install Required Dependencies
RUN echo "**** install build packages ****" && \
    apk add --no-cache --virtual=build-dependencies --upgrade \
        cairo-dev \
        freetype-dev \
        gcc \ 
        gdk-pixbuf-dev \
        gpgme-dev \
        jpeg-dev \ 
        lcms2-dev \
        libc-dev \
        libffi-dev \
        mariadb-dev \
        musl-dev \
        openjpeg-dev \
        pango-dev \
        python3-dev \
        tcl-dev \
        tiff-dev \
        tk-dev \
        zlib-dev

# Install Required Python Dependencies
RUN echo "**** install python packages ****" && \
    pip install -r requirements.txt

# Copy everything into the destination
COPY . .

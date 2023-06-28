# syntax=docker/dockerfile:1
FROM python:3.11.4-alpine as build

# Environmental Variables for the Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN adduser -D -g "nearbeach" nearbeach

# Setup of Working Directory
WORKDIR /oceansuite
RUN chown nearbeach:nearbeach /oceansuite

# Create the private folder directory
RUN echo "**** Making private directory *****" && \
    mkdir oceansuite && \
    mkdir oceansuite/private

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

# Copy the requirements.txt file
COPY --chown=nearbeach:nearbeach requirements.txt requirements.txt
# Install Required Python Dependencies
RUN echo "**** install python packages ****" && \
    pip install -r requirements.txt

USER nearbeach
# Copy everything into the destination
COPY --chown=nearbeach:nearbeach . .
RUN chmod u+x setup_db_and_run_server.sh

FROM python:3.11.4-alpine
COPY --from=build / /
CMD './setup_db_and_run_server.sh'
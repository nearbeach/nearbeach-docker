# nearbeach-docker
A simple Docker file to install NearBeach and a example Docker compose

````
docker buildx build \
--push \
--platform linux/arm64,linux/amd64,linux/amd64/v2,linux/ppc64le,linux/s390x,linux/arm/v7,linux/arm/v6 \
--tag <username>/<image-name>:<tag> .
````

# The following does not work - need to figure out how to pass environment variables into the system
docker build -f Dockerfile-nomad --tag robotichead/nearbeach:nomad-latest --build-arg SECRET_KEY=12345 --build-arg MYSQL_HOST=localhost --build-arg MYSQL_DATABASE=nearbeach_docker --build-arg MYSQL_USER=root --build-arg MYSQL_PASSWORD= .

# Testing this out
docker build -f Dockerfile-nomad --tag robotichead/nearbeach:nomad-latest .
# nearbeach-docker
A simple Docker file to install NearBeach and a example Docker compose

````
docker buildx build \
--push \
--platform linux/arm64,linux/amd64,linux/amd64/v2,linux/ppc64le,linux/s390x,linux/arm/v7,linux/arm/v6 \
--tag <username>/<image-name>:<tag> .
````

# Updating Docker Versions

Please edit the file ./.github/workflows/docker-image.yml, on line 47 to represent the latest NearBeach version


# Update Read Me

When there is a minor version update, you'll need to update the requirements txt file.
i.e.

````
NearBeach==0.29.7
````
# nearbeach-docker
A simple Docker file to install NearBeach and a example Docker compose

````
docker buildx build \
--push \
--platform linux/arm64,linux/amd64,linux/amd64/v2,linux/ppc64le,linux/s390x,linux/arm/v7,linux/arm/v6 \
--tag <username>/<image-name>:<tag> .
````


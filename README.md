# Docker image for Mapbender

*This Image is just for building mapbender artifacts. To run mapbender in docker use
[this image](https://github.com/mapbender/docker)...*

## How to run

You have to [install docker](https://docs.docker.com/engine/installation/) first.

### The easiest way
```bash
./build.sh
```

### The not as easy as above way

After that, or if you want to use the image from the docker hub repository, run:

```bash
docker run mapbender/build -v /absolute/path/to/out:/out
```

If you want to build a specific version you can change the behavior
by changing environment variables, like this:

```bash
docker run mapbender/build --env MAPBENDER_REPOSITORY="..." -v /absolute/path/to/out:/out
```

*See list below for all environment variables...*

#### Build image on your own
If you want to build the image locally run in this folder:

```bash
docker build -t mapbender/build .
```

## How to enhance this image

This docker image has a user for builds called bob. Please prefer him for builds!

There is a directory for enhancing with additional provisioning in `/build-init.d`.
You can create your own image for builds and enhance this one by placing shell scripts
or a parameter.yml into this folder like this:

```docker
FROM mapbender/build

MAINTAINER Put your name here

COPY some-shell-script.sh /build-init.d/
COPY my-own-and-specific-paramters.yml /build-init.d/parameters.yml
```

## Environment variables

* `MAPBENDER_REPOSITORY` default value: "https://github.com/mapbender/mapbender-starter.git"
* `MAPBENDER_BRANCH` default value: "master"
* `MAPBENDER_NAME` default value: "mapbender"
* `MAPBENDER_VERSION` default value: "master"
* `BUILD_NUMBER` default value: 1

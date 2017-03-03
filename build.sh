#!/usr/bin/env bash

mkdir -p out \
  && docker run --name build-mapbender -v $PWD/out:/out mapbender/build \
  && docker rm build-mapbender \
  && echo "Build done, artifacts placed in directory '$PWD/out'"

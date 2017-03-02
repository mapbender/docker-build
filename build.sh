#!/usr/bin/env bash

mkdir -p out \
  && docker run -v --name build-mapbender $PWD/out:/out mapbender/build \
  && docker rm build-mapbender \
  && echo "Build done, artifacts placed in directory '$PWD/out'"

#!/usr/bin/env bash

docker container run \
  --volume $1:/workdir \
  --user builduser \
  --rm -it --name build_builder timreid/mill-builder \
  build $2 $3
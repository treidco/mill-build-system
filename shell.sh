#!/usr/bin/env bash

docker container run \
  --volume $1:/workdir \
  --user builduser \
  --rm -it --name shell_builder timreid/mill-builder \
  shell
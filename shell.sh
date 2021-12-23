#!/usr/bin/env bash

docker container run \
  --volume $(pwd)/builder/scripts:/scripts \
  --volume $1:/workdir \
  --user builduser \
  --rm -it --name shell_builder mill-builder:0.1 \
  shell
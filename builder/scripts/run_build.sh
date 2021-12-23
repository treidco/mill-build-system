#!/usr/bin/env bash

cd /workdir

if [ $1 = "shell" ]; then
  echo "Starting bash shell"
  /bin/bash
elif [ $1 = "build" ]; then
  echo "Performing build with command: mill $2"
  mill $2
fi
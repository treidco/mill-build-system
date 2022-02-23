#!/usr/bin/env bash


if [ -z "$3" ]; then
    echo "Setting workdir to /workdir"
  cd /workdir || exit
else
  echo "Setting workdir to $3"
  cd "$3" || exit
fi

if [ "$1" = "shell" ]; then
  echo "Starting bash shell"
  /bin/bash
elif [ "$1" = "build" ]; then
  echo "Performing build with command: mill $2"
  mill "$2"
fi
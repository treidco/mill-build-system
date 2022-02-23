#!/usr/bin/env bash

time docker image build \
  --build-arg USERNAME=builduser \
  --file install_builder.dockerfile \
  --tag timreid/mill-builder:latest \
  --tag timreid/mill-builder:0.3 .
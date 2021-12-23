#!/usr/bin/env bash

time docker image build \
  --build-arg USERNAME=${USER} \
  --file install_builder.dockerfile \
  --tag mill-builder:0.1 .
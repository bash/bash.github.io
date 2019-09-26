#!/usr/bin/env bash

set -e

build_directory=build

mkdir -p -- "$build_directory"

cp -R CNAME index.html style.css \
      "$build_directory"

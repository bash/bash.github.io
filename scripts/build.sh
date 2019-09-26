#!/usr/bin/env bash

set -e

build_directory="build/"

mkdir -p -- "$build_directory"

cp -R icons CNAME index.html style.css \
      "$build_directory"

find -mindepth 1 "$build_directory"

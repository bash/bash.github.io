#!/usr/bin/env bash

set -e
set -o xtrace

git fetch
dpl pages git \
    --target_branch master \
    --local_dir "./build" \
    --keep-history \
    --token "$GITHUB_TOKEN"

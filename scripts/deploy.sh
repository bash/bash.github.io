#!/usr/bin/env bash

set -e
set -o xtrace

dpl pages git \
    --target_branch master \
    --local_dir "./build" \
    --keep-history \
    --token "$GITHUB_TOKEN"

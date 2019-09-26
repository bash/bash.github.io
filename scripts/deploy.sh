#!/usr/bin/env bash

set -eo

dpl pages git \
    --no-committer_from_gh \
    --target_branch master \
    --local_dir build \
    --token "$GITHUB_TOKEN" \
    --keep-history \
    --allow_empty_commit \
    --verbose

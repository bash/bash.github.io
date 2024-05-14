#!/usr/bin/env bash

set -euo pipefail

while true; do
    find content sass static syntaxes templates config.toml | entr -n -d "$MAKE"
    test $? -ne 2 && break
done

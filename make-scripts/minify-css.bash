#!/usr/bin/env bash

set -euo pipefail

find "$1" -name '*.css' -exec dos2unix -r {} +
find "$1" -name '*.css' -exec npx lightningcss --minify --error-recovery --browserslist {} -o {} \;

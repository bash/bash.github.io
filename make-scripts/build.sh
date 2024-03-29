#!/usr/bin/env bash

set -euo pipefail

function minify() {
    dos2unix -r "$1"
    npx lightningcss --minify --browserslist "$1" -o "$1"
}

./update-reading-list.py
./fetch-katex.sh
npm clean-install

zola build --output-dir _site --force

find _site -name '*.css' \
    -exec dos2unix -r {} \; \
    -exec npx lightningcss --minify --error-recovery --browserslist {} -o {} \;

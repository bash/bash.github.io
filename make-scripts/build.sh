#!/usr/bin/env bash

set -euo pipefail

function minify() {
    dos2unix -r "$1"
    npx lightningcss --minify --browserslist "$1" -o "$1"
}

function run_python_script() {
    export PIP_DISABLE_PIP_VERSION_CHECK=1
    export PIP_REQUIRE_VIRTUALENV=1

    python3 -m venv .venv
    source .venv/bin/activate
    pip3 install 'requests~=2.31.0'
    python3 "$1"
}

run_python_script ./update-reading-list.py
./fetch-katex.sh
npm clean-install

zola build --output-dir _site --force

find _site -name '*.css' \
    -exec dos2unix -r {} \; \
    -exec npx lightningcss --minify --error-recovery --browserslist {} -o {} \;

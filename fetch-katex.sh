#!/usr/bin/env bash
set -e

WGET=wget
if command wget2 2> /dev/null; then
WGET=wget2
fi

katex_version='0.16.9'

mkdir -p static/katex/contrib
mkdir -p static/katex/fonts

files=(katex.mjs contrib/auto-render.mjs katex.min.css fonts/KaTeX_Main-Regular.woff2 fonts/KaTeX_Math-Italic.woff2)

for file in ${files[@]}; do
    $WGET -O "static/katex/$file" "https://cdn.jsdelivr.net/npm/katex@$katex_version/dist/$file"
done

echo "[$(tput setaf 2)ok$(tput sgr0)] Fetched KaTeX $katex_version"

#!/usr/bin/env bash

set -euo pipefail

curl --fail-with-body 'https://api.github.com/repos/bash/reading-list/issues?author=bash' | \
    jq 'map({title, body, reading: .labels | any(.name == "reading")}) | sort_by(.reading) | reverse'

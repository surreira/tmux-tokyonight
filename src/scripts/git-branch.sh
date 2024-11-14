#!/usr/bin/env bash

cd "$1" || exit

COLOR_OK=${2}
COLOR_NOK=${3}

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | grep -Ec "^(M| M)" | xargs)

if [[ -n "$BRANCH" ]]; then
    if [[ "$STATUS" = "0" ]]; then
        echo "#[fg=$COLOR_OK]  $BRANCH "
    else
        echo "#[fg=$COLOR_NOK]  $BRANCH "
    fi
fi

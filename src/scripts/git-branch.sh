#!/usr/bin/env sh

cd $1

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | egrep "^(M| M)" | wc -l)

if [[ -n "$BRANCH" ]]; then
    if [[ "$STATUS" = "0" ]]; then
        echo "#[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#1f2335]  $BRANCH "
    else
        echo "#[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]#[fg=#f7768e,bg=#1f2335]  $BRANCH "
    fi
fi

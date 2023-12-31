#!/usr/bin/env sh

cd $1

# Default THEME only changes when this script has a second argument value
THEME=${2:-light}

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | egrep "^(M| M)" | wc -l | xargs)

# Default colors (light mode)
COLOR="#e9e9ec"
COLOR_OK="#2e7de9"
COLOR_NOK="#f7768e"

# Set colors based on THEME argument
if [ $THEME == "dark" ]; then
    COLOR="#1f2335"
    COLOR_OK="#7aa2f7"
fi

if [[ -n "$BRANCH" ]]; then
    if [[ "$STATUS" = "0" ]]; then
        echo "#[fg=$COLOR,bg=$COLOR,nobold,nounderscore,noitalics]#[fg=$COLOR_OK,bg=$COLOR]  $BRANCH "
    else
        echo "#[fg=$COLOR,bg=$COLOR,nobold,nounderscore,noitalics]#[fg=$COLOR_NOK,bg=$COLOR]  $BRANCH "
    fi
fi

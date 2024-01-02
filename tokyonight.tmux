#!/usr/bin/env sh

get_option() {
    local OPTION=$1
    local DEFAULT=$2
    local -r TMUX_OPTION=$(tmux show-option -gqv "$OPTION")

    if [ -z "$TMUX_OPTION" ]; then
        echo "$DEFAULT"
    else
        echo "$TMUX_OPTION"
    fi
}

main() {
    local CURRENT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    local THEME=$(get_option "@tokyonight_theme" "day")

    tmux source-file "$CURRENT_DIRECTORY/src/tokyonight-$THEME.conf"
}

main

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

    local AUTO=$(get_option "@tokyonight_auto" 1)
    if [[ $AUTO == 1 ]]; then
        local MODE=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
        if [[ $MODE == "Dark" ]]; then
            THEME="storm"
        fi
    fi

    tmux source-file "$CURRENT_DIRECTORY/src/tokyonight-$THEME.conf"
}

main

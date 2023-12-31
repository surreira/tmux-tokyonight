#!/usr/bin/env sh

TOKYONIGHT_THEME="src/tokyonight-storm.conf"
CURRENT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

COLOR=${TMUX_COLOR_MODE:-dark} # default value "dark"
if [[ $COLOR == "light" ]]; then
    TOKYONIGHT_THEME="src/tokyonight-day.conf"
fi

main() {
    tmux source-file "$CURRENT_DIRECTORY/$TOKYONIGHT_THEME"
}

main

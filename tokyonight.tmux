#!/usr/bin/env sh

TOKYONIGHT_THEME="src/tokyonight-storm.conf"
CURRENT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
    tmux source-file "$CURRENT_DIRECTORY/$TOKYONIGHT_THEME"
}

main

#!/usr/bin/env bash

get_option() {
    local option=$1
    local default=$2
    local -r tmux_option=$(tmux show-option -gqv "$option")

    if [ -z "$tmux_option" ]; then
        echo "$default"
    else
        echo "$tmux_option"
    fi
}

tset() {
    local option=$1
    local value=$2

    tmux_commands+=(set-option -gq "$option" "$value" ";")
}

tsetw() {
    local option=$1
    local value=$2

    tmux_commands+=(set-window -gq "$option" "$value" ";")
}

tsetwo() {
    local option=$1
    local value=$2
    tmux_commands+=(set-window-option -g "$option" "$value" ";")
}

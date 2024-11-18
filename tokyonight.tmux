#!/usr/bin/env bash

# Set path of script
CURRENT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Import
# shellcheck source=./src/utils.sh
source "${CURRENT_DIRECTORY}/src/utils.sh"

main() {
    # Aggregate all tmux commands in one array
    local tmux_commands=()

    # Load theme
    local option_theme option_auto
    option_theme=$(get_option "@tokyonight_theme" "storm")
    option_auto=$(get_option "@tokyonight_auto" 0)

    # for testing purpuses, when the refactor is completed
    if [[ $option_auto == 1 ]]; then
        local mode
        mode=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
        if [[ $mode != "Dark" ]]; then
            option_theme="day"
        fi
    fi

    # Load theme colors palette
    # https://github.com/dylanaraps/pure-sh-bible#parsing-a-keyval-file
    while IFS='=' read -r key val; do
        [ "${key##\#*}" ] || continue
        eval "local $key"="$val"
    done <"${CURRENT_DIRECTORY}/themes/${option_theme}.tmuxtheme"

    # Load git branch script
    local git_branch="#(${CURRENT_DIRECTORY}/src/scripts/git-branch.sh #{pane_current_path} '${tn_fg}' '${tn_red}')"

    tset status "on"
    tset status-justify "left"

    tset status-left-length "100"
    tset status-right-length "100"

    tset message-style "fg=${tn_fg},bg=${tn_bg}"
    tset message-command-style "fg=${tn_fg},bg=${tn_bg}"

    tset status-style "fg=${tn_blue},bg=${tn_bg_dark}"

    tset status-left "#[fg=${tn_black},bg=${tn_blue}] #S "
    tset status-right "$git_branch #[fg=${tn_blue},bg=${tn_dark_gray}] %Y-%m-%d %H:%M #[fg=${tn_black},bg=${tn_blue}] #h "

    tsetw window-status-format "#[fg=${tn_fg},bg=${tn_bg_dark}] #I #W "
    tsetw window-status-current-format "#[fg=${tn_blue},bg=${tn_dark_gray}] #I #W "

    tmux "${tmux_commands[@]}"
}

main "$@"

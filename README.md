# Tmux Tokyonight Theme

Personal take on Tokyo Night theme for tmux.

## Install via TPM

In `tmux.conf`:

```
set -g @plugin 'surreira/tokyonight-tmux'
```

Available modes are `storm` (dark) and `day` (light), the default mode if no
configuration is set in `tmux.conf` will be `day`.

Example:

```
# set light mode
tmux set -g @tokyonight_theme 'day'
# or dark mode
tmux set -g @tokyonight_theme 'storm'
```

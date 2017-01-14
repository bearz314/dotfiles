unbind C-b
set -g prefix `
bind-key ` send-prefix
setw -g mode-keys vi

unbind % # Remove default binding since we’re replacing
bind | split-window -h
bind - split-window -v


# screen mode
#set -g default-terminal "screen"
set -g default-terminal "screen-256color"

# buffer clearing
bind -n C-k clear-history

# source config file
bind r source-file ~/.tmux.conf

# vim pane movement
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# history
set -g history-limit 5000

# allow terminal scrolling
set-option -g terminal-overrides 'xterm*:smcup@:rmcup@'

# copy mode
unbind [
bind [ copy-mode
unbind ]
bind ] paste-buffer

# use vi mode
setw -g mode-keys vi
set -g status-keys vi
setw -g utf8 on
# use mouse in copy mode
setw -g mode-mouse on

# panes
set -g mouse-select-pane on
set -g pane-border-fg colour6
set -g pane-active-border-fg brightred
set -g pane-active-border-attr blink
# resize panes with mouse (drag borders)
set -g mouse-select-pane on
set -g mouse-resize-pane on

set-option -g renumber-windows on
set -g base-index 1
setw -g pane-base-index 1

# status line
set -g status-utf8 on
set -g status-justify left
set -g status-bg default
set -g status-fg colour12
set -g status-interval 2


# messaging
set -g message-fg black
set -g message-bg yellow
set -g message-command-fg blue
set -g message-command-bg black


#window mode
setw -g mode-bg colour5
setw -g mode-fg colour0


# window status
#setw -g window-status-format " #F#I:#W#F "
#setw -g window-status-current-format " #F#I:#W#F "
setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "
setw -g window-status-current-bg colour0
setw -g window-status-current-fg colour11
setw -g window-status-current-attr dim
setw -g window-status-bg green
setw -g window-status-fg black
setw -g window-status-attr reverse
setw -g window-status-content-bg colour0
setw -g window-status-content-fg colour11
setw -g window-status-content-attr bold,blink,reverse


# Info on right (requires stlarch-terminusmod font)
set -g status-right-length 60
set -g status-right '#[fg=brightgreen]%a %H:%M'

source ~/.local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf
set-option -g default-terminal "screen-256color"

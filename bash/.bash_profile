#!/bin/bash

# Bash profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPath $HOME/.local/bin

bind '"\C-f":"tmux-sessionizer\n"'
bind '"\C-h":"cht.sh\n"'

#!/bin/bash

# Bash profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPath $HOME/.local/bin
addToPath /usr/local/go/bin

bind '"\C-f":"\C-k \C-utmux-sessionizer\n"'
bind '"\C-h":"\C-k \C-ucht.sh\n"'

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


sourceNoetic() {
    NOETIC=/opt/ros/noetic/setup.bash
    if [ -f "$NOETIC" ]; then
        source "$NOETIC"
        echo "======================"
        echo "ROS NOETIC enable"
        echo "======================"
    else 
        echo "ROS Noetic is not installed"
    fi
}

sourceFoxy(){
    FOXY=/opt/ros/foxy/setup.bash
    if [ -f "$FOXY" ]; then
        source "$FOXY"
        echo "======================"
        echo "ROS FOXY enable"
        echo "======================"
    else 
        echo "ROS Foxy is not installed"
    fi
}

# sourceNoetic
sourceFoxy


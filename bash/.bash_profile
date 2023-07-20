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
bind '"\C-g":"\C-k \C-ucolcon-extension\n"'

checkRos() {
    ROS_INS_DIR=/opt/ros
    if [ -f "$ROS_INS_DIR" ]; then
        echo "======================"
        echo "ROS is not installed"
        echo "======================"
    fi
}

sourceNoetic() {
    NOETIC=/opt/ros/noetic/setup.bash
    if [ -f "$NOETIC" ]; then
        source "$NOETIC"
        echo "======================"
        echo "ROS NOETIC enable"
        echo "======================"
    fi
}

sourceFoxy(){
    FOXY=/opt/ros/foxy/setup.bash
    if [ -f "$FOXY" ]; then
        source "$FOXY"
        echo "======================"
        echo "ROS FOXY enable"
        echo "======================"
    fi 
}

sourceHumble(){
    HUMBLE=/opt/ros/humble/setup.bash
    if [ -f "$HUMBLE" ]; then
        source "$HUMBLE"
        echo "======================"
        echo "ROS HUMBLE enable"
        echo "======================"
    fi
}

# sourceNoetic
sourceFoxy
# sourceHumble

# this is for tmuxinator
export EDITOR=nvim

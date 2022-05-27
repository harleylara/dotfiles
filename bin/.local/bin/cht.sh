#!/bin/bash

languages=$(echo "python javascript arduino c cpp" | tr " " "\n")
core_utils=$(echo "find sed awk" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Query: " query

if echo "$languages" | grep -qs $selected; then
    tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -r"
else
    tmux split-window -h bash -c "curl cht.sh/$selected~$query | less -r"
fi

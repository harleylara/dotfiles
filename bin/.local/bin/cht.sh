#!/bin/bash

SELECTED=$(cat ~/.tmux-cht-languages ~/.tmux-cht-commands | fzf)
PANE=$(echo "$TMUX_PANE" | sed "s/^.//")

if [[ -z $SELECTED ]]; then
    exit 0
fi

read -p "Query: " QUERY

if [[ "$PANE" == 0 ]]; then
    # single pane view running inside tmux
    if grep -qs $SELECTED ~/.tmux-cht-languages; then
        tmux split-window -h bash -c "curl cht.sh/$SELECTED/$(echo "$QUERY" | tr " " "+") | less -r"
    else
        tmux split-window -h bash -c "curl cht.sh/$SELECTED~$QUERY | less -r"
    fi
else
    # runing already multi pane view or running outside tmux
    if grep -qs $SELECTED ~/.tmux-cht-languages; then
        curl cht.sh/$SELECTED/$(echo "$QUERY" | tr " " "+") | less -r
    else
        curl cht.sh/$SELECTED~$QUERY | less -r
    fi
fi

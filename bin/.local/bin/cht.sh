#!/bin/bash

LANGUAGES=$(echo "python javascript arduino c cpp" | tr " " "\n")
CORE_UTILS=$(echo "docker find sed awk" | tr " " "\n")

SELECTED=$(echo -e "$LANGUAGES\n$CORE_UTILS" | fzf)
PANE=$(echo "$TMUX_PANE" | sed "s/^.//")

echo "Pane number: $PANE"

read -p "Query: " QUERY

if [[ "$PANE" == 0 ]]; then
    # single pane view running inside tmux
    if echo "$LANGUAGES" | grep -qs $SELECTED; then
        tmux split-window -h bash -c "curl cht.sh/$SELECTED/$(echo "$QUERY" | tr " " "+") | less -r"
    else
        tmux split-window -h bash -c "curl cht.sh/$SELECTED~$QUERY | less -r"
    fi
else
    # runing already multi pane view or running outside tmux
    if echo "$LANGUAGES" | grep -qs $SELECTED; then
        curl cht.sh/$SELECTED/$(echo "$QUERY" | tr " " "+") | less -r
    else
        curl cht.sh/$SELECTED~$QUERY | less -r
    fi
fi

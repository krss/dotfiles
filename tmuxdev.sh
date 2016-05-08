#!/bin/bash

sess=devenv

tmux new-session -d -s $sess
tmux split-window -hl 80 -t $sess
tmux send-keys -t $sess 'clear' Enter
tmux send-keys -t $sess '~/dotfiles/setpipe.sh' Enter
tmux select-pane -t $sess.0
tmux attach-session -t $sess

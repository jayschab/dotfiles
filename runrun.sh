#!/bin/sh

tmux has-session -t runrun
if [ $? != 0 ]
then
  cd ~/Coding/Rails/runrunit/
  tmux new-session   -s runrun      -n "vim" -d
  tmux new-window    -t runrun:1 -a -n "rails"
  tmux split-window  -t runrun:2.0  -v
  tmux new-window    -t runrun:2 -a -n "workers"
  tmux split-window  -t runrun:3.0  -v

  tmux send-keys -t runrun:1   "vim"           Enter
  tmux send-keys -t runrun:2.0 "bundle exec rails server"  Enter
  tmux send-keys -t runrun:2.1 "bundle exec rails console" Enter
  tmux send-keys -t runrun:3.0 "memcached -vv"  Enter
  tmux send-keys -t runrun:3.1 "bundle exec rake jobs:work" Enter

  tmux select-window   -t runrun:1

  # For debugging
  #tmux set-option -t runrun set-remain-on-exit on
fi
tmux attach -t runrun

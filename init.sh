#!/bin/bash

# Small script that automatically sets up the development environment for my current project
# saves about 30 seconds * opening projects 2 times / day * 4 days / week = valuable time! ;)

cur_proj_name="blaze-penguinz"

go2cpd () {
  # go to current project directory
  cd "$HOME/Documents/github/$cur_proj_name"
}

echo "Starting $cur_proj_name!"

# start atom and firefox in the background and hide their output from nuhup.out log-files and terminal
nohup atom >/dev/null 2>&1 &
nohup firefox localhost:3000 >/dev/null 2>&1 &

# finally, go to project directory and launch app-processes
go2cpd

gnome-terminal \
--tab-with-profile=Meteor -t "meteor" -e "bash -c 'meteor'" \
--tab-with-profile=Meteor -t "mongo" -e "bash -c 'sleep 5s; meteor mongo'" \
--tab-with-profile=Meteor -t "git" -e "bash"

exit 0

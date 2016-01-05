#!/bin/bash

# Small script that automatically sets up the development environment for my current project
# saves about 30 seconds * opening projects 2 times / day * 4 days / week = valuable time! ;)

go2cpd () {
  # go to current project directory
  cd "/home/sam/Documents/github/blaze-penguinz"
}

cur_proj_name="Blaze Penguinz"
echo "Starting: $cur_proj_name!  -  ($PWD)"

# start atom and firefox in the background and hide their output from nuhup.out log-files and terminal
nohup atom >/dev/null 2>&1 &
nohup firefox localhost:3000 >/dev/null 2>&1 &

# finally, go to project directory and launch app-processes
go2cpd

gnome-terminal \
--tab-with-profile=Meteor -t "meteor" -e "meteor" \
--tab-with-profile=Meteor -t "git" -e "bash" \
--tab-with-profile=Meteor -t "mongo" -x bash -c "sleep 5s; meteor mongo"

exit 0

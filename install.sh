#!/bin/bash

# Run from the directory that contains this file
cd "$(dirname "${BASH_SOURCE[0]}")"

# Nuke the current git data that we got from cloning this project.
# It's not possible to be both a bare and non-bare git repo at the same time.
# (I tried.)
rm -rf .git

git init --bare
mv post-receive hooks/post-receive

PWD=$(pwd)
GIT_REMOTE_CMD="git remote add deploy ssh://$USER@MY_SERVER_URL$PWD"

# Write the git remote command to a file in case we forget it. Because we will.
echo $GIT_REMOTE_CMD > git_remote_command.txt

echo "Ploy.sh installed. To add a remote, run:"
echo $GIT_REMOTE_CMD
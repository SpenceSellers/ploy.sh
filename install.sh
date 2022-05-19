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
echo "Ploy installed. To add a remote, run:"
echo "git remote add deploy ssh:$USER@SERVER_URL$PWD"
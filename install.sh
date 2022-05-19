#!/bin/bash

# Run from the directory that contains this file
cd "$(dirname "${BASH_SOURCE[0]}")"

# Nuke the current git data that we got from cloning this project.
rm -rf .git

git init --bare
mv post-receive hooks/post-receive
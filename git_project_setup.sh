#!/bin/bash

# Initialise Git repository
git init

# Add files and commit them
git add .
git commit -m "Initial commit"

# Create remote repository on GitHub and add it as origin
# Replace <remote_repository_url> with your actual URL
git remote add origin https://github.com/PeterManda19/greetings-webapp.git

# Push files to remote repository
git push -u origin master

# Get GitHub username from remote URL
github_username=$(git config --get remote.origin.url | sed -n 's/.*github.com[:/]\([^/]*\).*/\1/p')

# Get repository name from remote URL
repository_name=$(basename -s .git $(git config --get remote.origin.url))

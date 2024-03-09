#!/bin/bash

# Set the directory containing git repositories
repositories_dir=.

# Loop over the directories in the repositories directory
for repository_dir in "$repositories_dir"/*/
do
  # Check if the directory is a git repository
  if [ -d "$repository_dir/.git" ]
  then
    # Change into the repository directory, discard all local changes, and pull the latest changes
    cd "$repository_dir"
    echo "Updating repository: $(basename $repository_dir)"
    git checkout Gemfile.lock
    git pull --ff-only
  fi
done

SKIP_SEEDS=1 SKIP_WAGONFILE=1 /usr/local/bin/rails-entrypoint.sh echo "All up to date!"

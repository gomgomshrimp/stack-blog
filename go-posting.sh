#!/bin/bash

set -e

[ $# -eq 0 ] && { echo "Usage: $0 <commit message>"; exit 1; }

echo -e "\033[0;32mPositing new article to GitHub...\033[0m"

# Build the project.
hugo -t hugo-theme-stack

# Go To Public folder, sub module commit
cd public
# Add changes to git.
git add .

# Commit changes.
if [ $# -eq 1 ]
  then commit_message="$1"
fi
git commit -m "$commit_message"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..


# blog 저장소 Commit & Push
git add .

if [ $# -eq 1 ]
  then commit_message="$1"
fi
git commit -m "$commit_message"

git push origin master
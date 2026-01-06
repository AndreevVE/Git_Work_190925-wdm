#!/bin/bash

if ! git rev-parse --is-inside-work-tree &>/dev/null; then 
echo "Error: the current directory is not a Git repository." 
exit 1
 fi

git add -A
if git diff --cached --quiet; then
 echo "No changes to commit." 
exit 0 
fi

commit_message="Automatic commit $(date +'%Y-%m-%d %H:%M:%S')" 
git commit -m "$commit_message"

echo "Commit created successfully: $commit_message"

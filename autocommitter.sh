#!/bin/bash

if [ -d ".git" ]; then
    echo "Directory is exist";
    if ! git diff-index --quiet HEAD --; then
        git add .
        git commit -m "Автоматический коммит $(date +'%Y-%m-%d %H:%M:%S')"
    else
        echo "no changes"
    fi
fi
#!/bin/bash

if [ ! -d ".git" ]; then
    echo "Текущая директория не является гит репозиторием"

    exit 1
fi

git add .

if  git diff-index --quiet HEAD --; then
    echo "Нет изменений"

    exit 0
fi

commit_message="Автокоммит: $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_message"

echo "Коммит создан."
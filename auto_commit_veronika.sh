#!/bin/bash

if [ ! -d ".git" ]; then
    echo "Сначала выберите гит репозиторий"
    exit 1
fi

git add .

if git diff --cached --quiet; then
    echo "Нет изменений"
    exit 0
fi

git commit -m "Коммит VOstroverkh $(date +'%Y-%m-%d %H:%M:%S')"

echo "Изменения были успешно закомичены"
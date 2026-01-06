#!/bin/bash
if [ ! -d ".git" ]; then
  echo "Ошибка: текущая директория не является репозиторием Git"
  exit 1
fi
git add .
if git diff --cached --quiet; then
  echo "Изменений для коммита нет"
  exit 0
fi
git commit -m "Автоматический коммит $(date +'%Y-%m-%d %H:%M:%S')"
echo "Коммит успешно создан"



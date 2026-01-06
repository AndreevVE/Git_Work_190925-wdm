#!/usr/bin/env bash

# Проверка: находимся ли в git-репозитории
if [ ! -d ".git" ]; then
  echo "Текущая директория не является Git-репозиторием"
  exit 1
fi

# Проверка: находимся ли в git-репозитории
# if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
#   echo "Текущая директория не является Git-репозиторием"
#   exit 1
# fi

# Добавление всех изменений в индекс
git add -A

# Проверка наличия изменений для коммита
if git diff --cached --quiet; then
  echo "Нет изменений для коммита"
  exit 0
fi

# Создание коммита с датой и временем
commit_message="Автоматический коммит $(date +'%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_message"

# Результат
if [ $? -eq 0 ]; then
  echo "Коммит успешно создан"
else
  echo "Ошибка при создании коммита"
  exit 1
fi

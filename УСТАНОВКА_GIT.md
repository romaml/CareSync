# 📦 Установка Git для Windows

## Шаг 1: Скачайте Git

1. Перейдите на [git-scm.com/download/win](https://git-scm.com/download/win)
2. Скачайте установщик для Windows
3. Запустите установщик и следуйте инструкциям (можно оставить все настройки по умолчанию)

## Шаг 2: Проверьте установку

Откройте PowerShell или Command Prompt и выполните:

```bash
git --version
```

Должна появиться версия Git (например, `git version 2.42.0`)

## Шаг 3: Настройте Git (первый раз)

```bash
git config --global user.name "Ваше Имя"
git config --global user.email "ваш.email@example.com"
```

## Шаг 4: Инициализируйте репозиторий

После установки Git выполните в папке проекта:

```bash
cd C:\Users\rbezv\Downloads\AIRBASE
git init
git add .
git commit -m "Initial commit: CareSync - Система управления здоровьем детей"
```

## Шаг 5: Создайте репозиторий на GitHub

Следуйте инструкциям в файле `GITHUB_SETUP.md`


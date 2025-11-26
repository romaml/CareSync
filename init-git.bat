@echo off
chcp 65001 >nul
echo ========================================
echo   Инициализация Git репозитория
echo ========================================
echo.

REM Проверка наличия Git
git --version >nul 2>&1
if errorlevel 1 (
    echo [ОШИБКА] Git не установлен!
    echo.
    echo Пожалуйста, установите Git:
    echo 1. Скачайте с https://git-scm.com/download/win
    echo 2. Установите Git
    echo 3. Перезапустите этот скрипт
    echo.
    echo Или следуйте инструкциям в файле УСТАНОВКА_GIT.md
    echo.
    pause
    exit /b 1
)

echo [OK] Git найден
echo.

REM Инициализация репозитория
if exist ".git" (
    echo [INFO] Git репозиторий уже инициализирован
) else (
    echo [1/4] Инициализация Git репозитория...
    git init
    echo [OK] Репозиторий инициализирован
)

echo.
echo [2/4] Добавление файлов...
git add .
echo [OK] Файлы добавлены

echo.
echo [3/4] Создание коммита...
git commit -m "Initial commit: CareSync - Система управления здоровьем детей"
if errorlevel 1 (
    echo [ВНИМАНИЕ] Коммит не создан (возможно, нет изменений)
) else (
    echo [OK] Коммит создан
)

echo.
echo ========================================
echo   ✅ Готово!
echo ========================================
echo.
echo Следующие шаги:
echo 1. Создайте репозиторий на GitHub (см. GITHUB_SETUP.md)
echo 2. Выполните команды:
echo    git remote add origin https://github.com/YOUR_USERNAME/caresync.git
echo    git branch -M main
echo    git push -u origin main
echo.
pause


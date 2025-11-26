@echo off
chcp 65001 >nul
echo ========================================
echo   Создание репозитория на GitHub
echo ========================================
echo.

REM Проверка наличия Git
git --version >nul 2>&1
if errorlevel 1 (
    echo [ОШИБКА] Git не установлен!
    echo Установите Git с https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Проверка наличия GitHub CLI
gh --version >nul 2>&1
if errorlevel 1 (
    echo [ИНФОРМАЦИЯ] GitHub CLI не установлен
    echo.
    echo Используйте ручной способ создания репозитория:
    echo.
    echo 1. Перейдите на https://github.com/new
    echo 2. Создайте новый репозиторий (НЕ добавляйте README!)
    echo 3. Выполните команды, которые покажет GitHub
    echo.
    echo Или установите GitHub CLI:
    echo https://cli.github.com/
    echo.
    pause
    exit /b 0
)

echo [OK] GitHub CLI найден
echo.

REM Проверка авторизации
gh auth status >nul 2>&1
if errorlevel 1 (
    echo [ВНИМАНИЕ] Вы не авторизованы в GitHub CLI
    echo.
    echo Выполните авторизацию:
    echo   gh auth login
    echo.
    echo Затем запустите этот скрипт снова
    pause
    exit /b 1
)

echo [OK] Авторизация в GitHub подтверждена
echo.

REM Проверка наличия локального репозитория
if not exist ".git" (
    echo [1/5] Инициализация Git репозитория...
    git init
    echo [OK] Репозиторий инициализирован
    echo.
)

REM Добавление файлов
echo [2/5] Добавление файлов...
git add .
echo [OK] Файлы добавлены
echo.

REM Создание коммита
echo [3/5] Создание коммита...
git commit -m "Initial commit: CareSync - Система управления здоровьем детей" >nul 2>&1
if errorlevel 1 (
    echo [ВНИМАНИЕ] Коммит не создан (возможно, нет изменений)
) else (
    echo [OK] Коммит создан
)
echo.

REM Запрос имени репозитория
set /p REPO_NAME="Введите имя репозитория (например: caresync): "
if "%REPO_NAME%"=="" set REPO_NAME=caresync

REM Запрос описания
set /p REPO_DESC="Введите описание (или нажмите Enter для пропуска): "

REM Запрос видимости
echo.
echo Выберите видимость репозитория:
echo 1. Public (публичный)
echo 2. Private (приватный)
set /p VISIBILITY="Ваш выбор (1 или 2, по умолчанию 1): "
if "%VISIBILITY%"=="" set VISIBILITY=1
if "%VISIBILITY%"=="2" (
    set VISIBILITY_FLAG=--private
) else (
    set VISIBILITY_FLAG=--public
)

echo.
echo [4/5] Создание репозитория на GitHub...
if "%REPO_DESC%"=="" (
    gh repo create %REPO_NAME% %VISIBILITY_FLAG% --source=. --remote=origin --push
) else (
    gh repo create %REPO_NAME% %VISIBILITY_FLAG% --description "%REPO_DESC%" --source=. --remote=origin --push
)

if errorlevel 1 (
    echo [ОШИБКА] Не удалось создать репозиторий
    echo.
    echo Возможные причины:
    echo - Репозиторий с таким именем уже существует
    echo - Проблемы с авторизацией
    echo - Проблемы с сетью
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ✅ Репозиторий успешно создан!
echo ========================================
echo.
echo Ваш репозиторий доступен по адресу:
gh repo view --web %REPO_NAME%
echo.
pause


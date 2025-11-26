@echo off
echo ========================================
echo   CareSync PHP Backend Server
echo ========================================
echo.
echo Запуск PHP встроенного сервера...
echo.
echo Backend будет доступен по адресу:
echo   http://localhost:8000/api/
echo.
echo Нажмите Ctrl+C для остановки
echo.

cd /d %~dp0

REM Поиск PHP
set PHP_EXE=php.exe

REM Проверка пользовательского пути (замените на свой путь к PHP)
REM if exist "C:\path\to\your\php\php.exe" (
REM     set PHP_EXE=C:\path\to\your\php\php.exe
REM     goto php_found
REM )

REM Проверка стандартных путей
if exist "C:\php\php.exe" (
    set PHP_EXE=C:\php\php.exe
    goto php_found
)

if exist "C:\Program Files\PHP\php.exe" (
    set PHP_EXE=C:\Program Files\PHP\php.exe
    goto php_found
)

REM Проверка, доступен ли PHP в PATH
php --version >nul 2>&1
if errorlevel 1 (
    echo [ВНИМАНИЕ] PHP не найден автоматически!
    echo.
    echo Пожалуйста, запустите setup-php.bat для настройки PHP
    echo или укажите путь к PHP вручную.
    echo.
    echo Пример: set PHP_EXE=C:\php\php.exe
    echo.
    pause
    exit /b 1
)

:php_found
echo [OK] Используется PHP: %PHP_EXE%

REM Создание тестовых пользователей
echo [1/2] Создание тестовых пользователей...
"%PHP_EXE%" create_test_users.php

echo.
echo [2/2] Запуск сервера...
echo.

"%PHP_EXE%" -S localhost:8000 router.php

pause


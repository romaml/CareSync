@echo off
chcp 65001 >nul
echo ========================================
echo   Запуск HTML Frontend
echo ========================================
echo.
echo ВАЖНО: Для работы нужен Backend API!
echo.
echo Если backend не запущен, откройте config.js
echo и настройте API URL на ваш сервер.
echo.
echo Запуск веб-сервера на порту 8080...
echo.
echo Откройте в браузере:
echo   http://localhost:8080/login.html
echo.
echo Нажмите Ctrl+C для остановки
echo.

REM Проверка Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ОШИБКА] Python не найден!
    echo.
    echo Установите Python или используйте другой веб-сервер:
    echo   - Node.js: npx http-server -p 8080
    echo   - PHP: php -S localhost:8080
    echo.
    pause
    exit /b 1
)

python -m http.server 8080



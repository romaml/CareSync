# CareSync Backend

PHP Backend API для приложения CareSync.

## 🚀 Быстрый запуск

### Вариант 1: Использовать скрипт
```bash
start-server.bat
```

### Вариант 2: Вручную
```bash
php -S localhost:8000 router.php
```

Backend будет доступен на: http://localhost:8000/api/

## 📋 Требования

- PHP 7.4+
- Расширения: PDO, SQLite

## ⚙️ Настройка

1. **Настройте PHP путь** в `start-server.bat` если нужно
2. **Измените JWT_SECRET** в `config.php` для продакшена
3. **База данных** создается автоматически при первом запуске

## 🔧 Создание тестовых пользователей

```bash
php create_test_users.php
```

Тестовые данные:
- parent1 / testpass123
- doctor1 / testpass123
- admin / testpass123

## 📚 API Endpoints

- POST /api/auth/users/login/ - Вход
- GET /api/auth/users/me/ - Текущий пользователь
- GET /api/children/ - Список детей
- POST /api/children/ - Создать ребенка
- GET /api/health-records/ - Медицинские записи
- GET /api/recommendations/ - Рекомендации

## 📞 Для использования с Frontend

Frontend должен быть настроен на API URL: http://localhost:8000/api


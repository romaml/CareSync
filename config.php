<?php
/**
 * CareSync PHP Backend Configuration
 */

// Error reporting
// Для продакшена установите error_reporting(0) и ini_set('display_errors', 0)
if (getenv('ENVIRONMENT') === 'production' || isset($_SERVER['HTTP_HOST']) && strpos($_SERVER['HTTP_HOST'], 'cba.pl') !== false) {
    error_reporting(0);
    ini_set('display_errors', 0);
    ini_set('log_errors', 1);
    ini_set('error_log', __DIR__ . '/error.log');
} else {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
}

// Timezone
date_default_timezone_set('UTC');

// Database configuration
define('DB_PATH', __DIR__ . '/database.sqlite');
define('DB_TYPE', 'sqlite');

// JWT Configuration
define('JWT_SECRET', 'caresync-secret-key-change-in-production-' . md5(__DIR__));
define('JWT_ALGORITHM', 'HS256');
define('JWT_ACCESS_LIFETIME', 3600); // 1 hour
define('JWT_REFRESH_LIFETIME', 604800); // 7 days

// CORS Configuration
// Для хостинга автоматически добавляется текущий домен
$corsOrigins = [
    'http://localhost:8080',
    'http://localhost:3000',
    'http://127.0.0.1:8080',
    'http://127.0.0.1:3000'
];

// Автоматическое определение текущего домена для хостинга
if (isset($_SERVER['HTTP_HOST'])) {
    $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? 'https' : 'http';
    $currentOrigin = $protocol . '://' . $_SERVER['HTTP_HOST'];
    $corsOrigins[] = $currentOrigin;
    // Также добавляем версию с www
    $corsOrigins[] = $protocol . '://www.' . $_SERVER['HTTP_HOST'];
}

define('CORS_ALLOW_ORIGINS', $corsOrigins);

// Application settings
define('APP_NAME', 'CareSync');
define('APP_VERSION', '1.0.0');



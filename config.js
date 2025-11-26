// Конфигурация для хостинга
// Измените эти настройки под ваш хостинг

(function() {
    'use strict';
    
    // Определяем API URL
    let apiUrl;
    
    // Проверяем протокол и хост
    const protocol = window.location.protocol;
    const hostname = window.location.hostname;
    
    // Определяем API URL в зависимости от окружения
    // Для локальной разработки всегда используем localhost:8000
    const isLocalDev = protocol === 'file:' || 
                      hostname === '' || 
                      hostname === 'localhost' || 
                      hostname === '127.0.0.1' ||
                      window.location.port === '8080' ||
                      window.location.port === '3000' ||
                      window.location.port === '';
    
    if (isLocalDev) {
        // PHP backend на порту 8000
        apiUrl = 'http://localhost:8000/api';
    } else {
        // Для хостинга (cba.pl и другие): API на том же домене
        // Автоматически определяется текущий домен
        apiUrl = '/api'; // API на том же домене
    }
    
    // Устанавливаем глобальную переменную
    window.API_URL = apiUrl;
    
    // Для отладки (можно удалить в продакшене)
    if (window.location.protocol === 'file:' || hostname === '' || hostname === 'localhost') {
        console.log('[CareSync Config] API URL установлен:', apiUrl);
        console.log('[CareSync Config] Протокол:', protocol);
        console.log('[CareSync Config] Hostname:', hostname);
    }
    
    window.CARESYNC_CONFIG = {
        API_URL: apiUrl,
        APP_NAME: 'CareSync',
        VERSION: '1.0.0'
    };
})();


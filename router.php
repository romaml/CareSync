<?php
/**
 * Router for PHP built-in server
 */

// Get request path
$requestUri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$path = trim($requestUri, '/');

// Remove 'api' prefix
if (strpos($path, 'api/') === 0) {
    $path = substr($path, 4);
}

// Route to API handler
if (strpos($path, 'auth/users') === 0 || 
    strpos($path, 'children') === 0 || 
    strpos($path, 'health-records') === 0 || 
    strpos($path, 'recommendations') === 0) {
    
    require_once __DIR__ . '/api/index.php';
    exit;
}

// Token refresh endpoint
if (strpos($path, 'token/refresh') === 0) {
    require_once __DIR__ . '/api/token.php';
    exit;
}

// 404 for other routes
http_response_code(404);
header('Content-Type: application/json');
echo json_encode(['error' => 'Endpoint not found']);


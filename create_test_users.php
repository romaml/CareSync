<?php
/**
 * Create test users script
 */

require_once __DIR__ . '/database.php';
require_once __DIR__ . '/config.php';

$db = Database::getInstance()->getConnection();

$users = [
    [
        'username' => 'parent1',
        'email' => 'parent1@example.com',
        'password' => 'testpass123',
        'first_name' => 'Jan',
        'last_name' => 'Kowalski',
        'role' => 'parent',
        'phone_number' => '+48123456789'
    ],
    [
        'username' => 'doctor1',
        'email' => 'doctor1@example.com',
        'password' => 'testpass123',
        'first_name' => 'Anna',
        'last_name' => 'Nowak',
        'role' => 'doctor',
        'phone_number' => '+48987654321'
    ],
    [
        'username' => 'admin',
        'email' => 'admin@example.com',
        'password' => 'testpass123',
        'first_name' => 'Admin',
        'last_name' => 'User',
        'role' => 'admin',
        'phone_number' => '+48111111111',
        'is_staff' => 1,
        'is_superuser' => 1
    ]
];

foreach ($users as $userData) {
    // Check if user exists
    $stmt = $db->prepare("SELECT id FROM users WHERE username = ?");
    $stmt->execute([$userData['username']]);
    $existing = $stmt->fetch();
    
    if ($existing) {
        // Update password
        $passwordHash = password_hash($userData['password'], PASSWORD_DEFAULT);
        $stmt = $db->prepare("
            UPDATE users 
            SET password_hash = ?, 
                email = ?, 
                first_name = ?, 
                last_name = ?, 
                role = ?, 
                phone_number = ?,
                is_staff = ?,
                is_superuser = ?,
                updated_at = CURRENT_TIMESTAMP
            WHERE username = ?
        ");
        $stmt->execute([
            $passwordHash,
            $userData['email'],
            $userData['first_name'],
            $userData['last_name'],
            $userData['role'],
            $userData['phone_number'],
            $userData['is_staff'] ?? 0,
            $userData['is_superuser'] ?? 0,
            $userData['username']
        ]);
        echo "Updated user: {$userData['username']}\n";
    } else {
        // Create user
        $passwordHash = password_hash($userData['password'], PASSWORD_DEFAULT);
        $stmt = $db->prepare("
            INSERT INTO users (username, email, password_hash, first_name, last_name, role, phone_number, is_staff, is_superuser)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([
            $userData['username'],
            $userData['email'],
            $passwordHash,
            $userData['first_name'],
            $userData['last_name'],
            $userData['role'],
            $userData['phone_number'],
            $userData['is_staff'] ?? 0,
            $userData['is_superuser'] ?? 0
        ]);
        echo "Created user: {$userData['username']}\n";
    }
}

echo "\nTest users created successfully!\n";
echo "All users have password: testpass123\n";



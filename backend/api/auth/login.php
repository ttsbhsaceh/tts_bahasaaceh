<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../../functions/helper.php';
require_once __DIR__ . '/../../config/database.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    json_error("Metode tidak diizinkan.", 405);
}

$input = get_json_input();
$email = trim($input['email'] ?? '');
$password = $input['password'] ?? '';

if ($email === '' || $password === '') {
    json_error("Email dan password wajib diisi.");
}

$stmt = $pdo->prepare("SELECT id, username, password_hash FROM users WHERE email = :email LIMIT 1");
$stmt->execute(['email' => $email]);
$user = $stmt->fetch();

if (!$user || !password_verify($password, $user['password_hash'])) {
    json_error("Email atau password salah.", 401);
}

// Regenerasi ID sesi untuk mencegah session fixation
session_regenerate_id(true);
$_SESSION['user_id'] = $user['id'];
$_SESSION['username'] = $user['username'];
$_SESSION['is_guest'] = false;

json_response([
    "success" => true,
    "message" => "Login berhasil.",
    "user" => [
        "id" => $user['id'],
        "username" => escape_output($user['username']),
    ],
]);

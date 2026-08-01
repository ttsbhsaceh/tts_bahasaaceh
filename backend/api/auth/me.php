<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../../functions/helper.php';

if (empty($_SESSION['user_id']) && empty($_SESSION['is_guest'])) {
    json_response(["success" => true, "logged_in" => false]);
}

json_response([
    "success" => true,
    "logged_in" => true,
    "user" => [
        "id" => $_SESSION['user_id'] ?? null,
        "username" => escape_output($_SESSION['username'] ?? 'Tamu'),
        "is_guest" => !empty($_SESSION['is_guest']),
    ],
]);

<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../../functions/helper.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    json_error("Metode tidak diizinkan.", 405);
}

session_regenerate_id(true);
$_SESSION['user_id'] = null;
$_SESSION['username'] = 'Tamu';
$_SESSION['is_guest'] = true;
// Progres sementara tamu disimpan di session, hilang saat sesi berakhir
$_SESSION['guest_progress'] = $_SESSION['guest_progress'] ?? [];

json_response([
    "success" => true,
    "message" => "Masuk sebagai tamu.",
    "user" => [
        "id" => null,
        "username" => "Tamu",
        "is_guest" => true,
    ],
]);

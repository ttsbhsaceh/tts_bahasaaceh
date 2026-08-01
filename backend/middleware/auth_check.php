<?php
// Middleware: pastikan pengguna sudah login (akun terdaftar ATAU tamu) sebelum
// mengakses endpoint yang membutuhkan sesi. Panggil require_once file ini di awal
// endpoint yang butuh proteksi.

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../functions/helper.php';

if (empty($_SESSION['user_id']) && empty($_SESSION['is_guest'])) {
    json_error("Anda belum login. Silakan login atau masuk sebagai tamu.", 401);
}

// Menyediakan variabel siap pakai untuk endpoint yang meng-include middleware ini
$CURRENT_USER_ID = $_SESSION['user_id'] ?? null;
$IS_GUEST = !empty($_SESSION['is_guest']);

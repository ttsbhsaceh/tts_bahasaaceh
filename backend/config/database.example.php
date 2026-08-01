<?php
// Salin file ini menjadi database.php lalu isi sesuai kredensial database Anda
// (dari InfinityFree Control Panel / XAMPP lokal). JANGAN commit database.php asli.

$DB_HOST = "localhost";
$DB_NAME = "namadatabase";
$DB_USER = "usernamedatabase";
$DB_PASS = "passworddatabase";

try {
    $pdo = new PDO(
        "mysql:host={$DB_HOST};dbname={$DB_NAME};charset=utf8mb4",
        $DB_USER,
        $DB_PASS,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]
    );
} catch (PDOException $e) {
    http_response_code(500);
    header('Content-Type: application/json');
    echo json_encode(["success" => false, "message" => "Koneksi database gagal."]);
    exit;
}

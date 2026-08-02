<?php
// Konfigurasi database via environment variable.
// Railway otomatis menyuntik variabel MYSQLHOST, MYSQLDATABASE, MYSQLUSER, MYSQLPASSWORD, MYSQLPORT
// ketika kamu menambahkan MySQL plugin. Untuk lokal, bisa pakai database.example.php sebagai acuan.

$DB_HOST = getenv('MYSQLHOST')     ?: getenv('DB_HOST') ?: 'localhost';
$DB_PORT = getenv('MYSQLPORT')     ?: getenv('DB_PORT') ?: '3306';
$DB_NAME = getenv('MYSQLDATABASE') ?: getenv('DB_NAME') ?: 'tts_aceh';
$DB_USER = getenv('MYSQLUSER')     ?: getenv('DB_USER') ?: 'root';
$DB_PASS = getenv('MYSQLPASSWORD') ?: getenv('DB_PASS') ?: '';

try {
    $pdo = new PDO(
        "mysql:host={$DB_HOST};port={$DB_PORT};dbname={$DB_NAME};charset=utf8mb4",
        $DB_USER,
        $DB_PASS,
        [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]
    );

    ensureDatabaseSchema($pdo);
} catch (PDOException $e) {
    http_response_code(500);
    header('Content-Type: application/json');
    echo json_encode(["success" => false, "message" => "Koneksi database gagal."]);
    exit;
}

function executeSqlFile(PDO $pdo, string $filePath): void
{
    if (!is_readable($filePath)) {
        throw new RuntimeException("File SQL tidak ditemukan: {$filePath}");
    }

    $sql = file_get_contents($filePath);
    if ($sql === false) {
        throw new RuntimeException("Gagal membaca file SQL: {$filePath}");
    }

    $statements = preg_split('/;\s*(?:\r?\n|$)/', $sql);
    foreach ($statements as $statement) {
        $statement = trim($statement);
        if ($statement === '' || preg_match('/^(--|#)/', $statement)) {
            continue;
        }
        $pdo->exec($statement);
    }
}

function ensureDatabaseSchema(PDO $pdo): void
{
    try {
        $pdo->query('SELECT 1 FROM paket LIMIT 1');
    } catch (PDOException $e) {
        if ($e->getCode() !== '42S02') {
            throw $e;
        }

        $schemaFile = __DIR__ . '/../../database/tts_aceh.sql';
        $seedFile   = __DIR__ . '/../../database/seed_soal.sql';

        executeSqlFile($pdo, $schemaFile);
        executeSqlFile($pdo, $seedFile);
    }
}

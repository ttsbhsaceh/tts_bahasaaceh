<?php

function run_sql_file(mysqli $mysqli, string $filePath): void
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

        if (!$mysqli->query($statement)) {
            throw new RuntimeException(
                "Gagal menjalankan SQL: {$mysqli->error}\nStatement: {$statement}"
            );
        }
    }
}

function ensure_database_seeded(string $host, int $port, string $dbName, string $user, string $pass): void
{
    if (!extension_loaded('mysqli')) {
        throw new RuntimeException('Ekstensi mysqli belum aktif di PHP runtime.');
    }

    $mysqli = new mysqli($host, $user, $pass, $dbName, $port);
    if ($mysqli->connect_error) {
        throw new RuntimeException('Koneksi ke database gagal: ' . $mysqli->connect_error);
    }
    $mysqli->set_charset('utf8mb4');

    $hasPaket = (bool) ($mysqli->query("SHOW TABLES LIKE 'paket'") ?: false)->num_rows;
    $hasSoal  = (bool) ($mysqli->query("SHOW TABLES LIKE 'soal'") ?: false)->num_rows;

    $needsInitialSeed = !$hasPaket || !$hasSoal;

    if ($needsInitialSeed) {
        $schemaFile = __DIR__ . '/../../database/tts_aceh.sql';
        $seedFile   = __DIR__ . '/../../database/seed_soal.sql';
        $mysqli->query("SET FOREIGN_KEY_CHECKS = 0");
        run_sql_file($mysqli, $schemaFile);
        run_sql_file($mysqli, $seedFile);
        $mysqli->query("SET FOREIGN_KEY_CHECKS = 1");
        return;
    }

    $paketCount = (int) $mysqli->query("SELECT COUNT(*) FROM paket")->fetch_row()[0];
    $soalCount  = (int) $mysqli->query("SELECT COUNT(*) FROM soal")->fetch_row()[0];

    if ($paketCount >= 20 && $soalCount >= 200) {
        return;
    }

    $mysqli->query("SET FOREIGN_KEY_CHECKS = 0");
    if ($mysqli->query("SHOW TABLES LIKE 'jawaban_user'")->num_rows) {
        $mysqli->query("TRUNCATE TABLE jawaban_user");
    }
    if ($mysqli->query("SHOW TABLES LIKE 'progress'")->num_rows) {
        $mysqli->query("TRUNCATE TABLE progress");
    }
    if ($mysqli->query("SHOW TABLES LIKE 'soal'")->num_rows) {
        $mysqli->query("TRUNCATE TABLE soal");
    }
    if ($mysqli->query("SHOW TABLES LIKE 'paket'")->num_rows) {
        $mysqli->query("TRUNCATE TABLE paket");
    }

    $schemaFile = __DIR__ . '/../../database/tts_aceh.sql';
    $seedFile   = __DIR__ . '/../../database/seed_soal.sql';
    run_sql_file($mysqli, $schemaFile);
    run_sql_file($mysqli, $seedFile);
    $mysqli->query("SET FOREIGN_KEY_CHECKS = 1");
}

$host = getenv('MYSQLHOST') ?: getenv('DB_HOST') ?: 'localhost';
$port = (int) (getenv('MYSQLPORT') ?: getenv('DB_PORT') ?: '3306');
$dbName = getenv('MYSQLDATABASE') ?: getenv('DB_NAME') ?: 'tts_aceh';
$user = getenv('MYSQLUSER') ?: getenv('DB_USER') ?: 'root';
$pass = getenv('MYSQLPASSWORD') ?: getenv('DB_PASS') ?: '';

try {
    ensure_database_seeded($host, $port, $dbName, $user, $pass);
    echo "Database initialized successfully.\n";
} catch (Throwable $e) {
    fwrite(STDERR, "Gagal menginisialisasi database: {$e->getMessage()}\n");
    exit(1);
}

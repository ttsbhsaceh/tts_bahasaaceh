<?php
// Kumpulan fungsi bantu yang dipakai di berbagai endpoint API

// ─── CORS ────────────────────────────────────────────────────────────────────
// Otomatis dijalankan saat helper.php di-include.
// Frontend Netlify → proxy /backend/api/* → Railway, sehingga browser
// tidak perlu cross-origin request. CORS header ini adalah failsafe jika
// API diakses langsung (misal: dari Postman atau pengembang lain).
(function () {
    $origin = getenv('CORS_ORIGIN') ?: '*';
    header("Access-Control-Allow-Origin: {$origin}");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");
    if ($origin !== '*') {
        header("Access-Control-Allow-Credentials: true");
    }
    // Tangani preflight OPTIONS request
    if (isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        http_response_code(204);
        exit;
    }
})();

// ─── Fungsi respons ───────────────────────────────────────────────────────────

function json_response($data, int $status_code = 200): void
{
    http_response_code($status_code);
    header('Content-Type: application/json');
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    exit;
}

function json_error(string $message, int $status_code = 400): void
{
    json_response(["success" => false, "message" => $message], $status_code);
}

function get_json_input(): array
{
    $raw = file_get_contents('php://input');
    $data = json_decode($raw, true);
    return is_array($data) ? $data : [];
}

// ─── Fungsi jawaban ───────────────────────────────────────────────────────────

// Bersihkan & bandingkan jawaban: tidak case-sensitive, abaikan spasi awal/akhir
function normalisasi_jawaban(string $jawaban): string
{
    return strtoupper(trim($jawaban));
}

function cocok_jawaban(string $input, string $kunci): bool
{
    return normalisasi_jawaban($input) === normalisasi_jawaban($kunci);
}

function escape_output(string $text): string
{
    return htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
}

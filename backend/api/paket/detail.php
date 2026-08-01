<?php
require_once __DIR__ . '/../../functions/helper.php';
require_once __DIR__ . '/../../middleware/auth_check.php';
require_once __DIR__ . '/../../config/database.php';

$paketId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
if ($paketId <= 0) {
    json_error("ID paket tidak valid.");
}

$stmt = $pdo->prepare("SELECT id, nomor_paket, grid_baris, grid_kolom FROM paket WHERE id = :id");
$stmt->execute(['id' => $paketId]);
$paket = $stmt->fetch();

if (!$paket) {
    json_error("Paket tidak ditemukan.", 404);
}

$stmt = $pdo->prepare("SELECT id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia
                       FROM soal WHERE paket_id = :pid ORDER BY nomor_soal ASC");
$stmt->execute(['pid' => $paketId]);
$soalRows = $stmt->fetchAll();

// Ambil jawaban tersimpan milik user (jika ada), tanpa mengirim kunci jawaban ke frontend
$savedAnswers = [];
if ($IS_GUEST) {
    $savedAnswers = $_SESSION['guest_answers'][$paketId] ?? [];
} else {
    $soalIds = array_column($soalRows, 'id');
    if (!empty($soalIds)) {
        $placeholders = implode(',', array_fill(0, count($soalIds), '?'));
        $stmt = $pdo->prepare("SELECT soal_id, jawaban_input FROM jawaban_user
                               WHERE user_id = ? AND soal_id IN ($placeholders)");
        $stmt->execute(array_merge([$CURRENT_USER_ID], $soalIds));
        foreach ($stmt->fetchAll() as $row) {
            $savedAnswers[$row['soal_id']] = $row['jawaban_input'];
        }
    }
}

$soal = [];
foreach ($soalRows as $s) {
    $soal[] = [
        "id" => (int)$s['id'],
        "nomor" => (int)$s['nomor_soal'],
        "arah" => $s['arah'],
        "baris_mulai" => (int)$s['baris_mulai'],
        "kolom_mulai" => (int)$s['kolom_mulai'],
        "panjang" => (int)$s['panjang'],
        "clue_aceh" => escape_output($s['clue_aceh']),
        "clue_indonesia" => escape_output($s['clue_indonesia']),
        "jawaban_tersimpan" => $savedAnswers[$s['id']] ?? '',
    ];
}

json_response([
    "success" => true,
    "paket" => [
        "id" => (int)$paket['id'],
        "nomor_paket" => (int)$paket['nomor_paket'],
        "grid_baris" => (int)$paket['grid_baris'],
        "grid_kolom" => (int)$paket['grid_kolom'],
        "soal" => $soal,
    ],
]);

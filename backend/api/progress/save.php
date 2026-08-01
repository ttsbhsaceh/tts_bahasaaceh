<?php
require_once __DIR__ . '/../../middleware/auth_check.php';
require_once __DIR__ . '/../../config/database.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    json_error("Metode tidak diizinkan.", 405);
}

$input = get_json_input();
$paketId = (int)($input['paket_id'] ?? 0);
$jawabanInput = $input['jawaban'] ?? []; // { soal_id: "TEKS" }

if ($paketId <= 0 || !is_array($jawabanInput)) {
    json_error("Data tidak valid.");
}

$stmt = $pdo->prepare("SELECT id FROM soal WHERE paket_id = :pid");
$stmt->execute(['pid' => $paketId]);
$soalIds = array_column($stmt->fetchAll(), 'id');

if (empty($soalIds)) {
    json_error("Paket tidak ditemukan.", 404);
}

$adaTerisi = false;

foreach ($soalIds as $soalId) {
    $inputUser = trim((string)($jawabanInput[$soalId] ?? ''));
    if ($inputUser === '') {
        continue;
    }
    $adaTerisi = true;

    if ($IS_GUEST) {
        $_SESSION['guest_answers'][$paketId][$soalId] = $inputUser;
    } else {
        $stmt2 = $pdo->prepare("INSERT INTO jawaban_user (user_id, soal_id, jawaban_input, benar)
                                VALUES (:uid, :sid, :input1, 0)
                                ON DUPLICATE KEY UPDATE jawaban_input = :input2, updated_at = NOW()");
        $stmt2->execute([
            'uid' => $CURRENT_USER_ID,
            'sid' => $soalId,
            'input1' => $inputUser,
            'input2' => $inputUser,
        ]);
    }
}

if ($adaTerisi) {
    if ($IS_GUEST) {
        // Jangan turunkan status 'selesai' yang sudah tercapai sebelumnya
        if (($_SESSION['guest_progress'][$paketId] ?? 'belum') === 'belum') {
            $_SESSION['guest_progress'][$paketId] = 'sedang';
        }
    } else {
        $stmt3 = $pdo->prepare("INSERT INTO progress (user_id, paket_id, status)
                                VALUES (:uid, :pid, 'sedang')
                                ON DUPLICATE KEY UPDATE
                                status = IF(status = 'belum', 'sedang', status), updated_at = NOW()");
        $stmt3->execute(['uid' => $CURRENT_USER_ID, 'pid' => $paketId]);
    }
}

json_response(["success" => true, "message" => "Progres disimpan."]);

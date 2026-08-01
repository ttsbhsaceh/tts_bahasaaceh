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

// Ambil kunci jawaban asli dari database (tidak pernah dikirim ke frontend sebelumnya)
$stmt = $pdo->prepare("SELECT id, jawaban_aceh FROM soal WHERE paket_id = :pid");
$stmt->execute(['pid' => $paketId]);
$kunciJawaban = [];
foreach ($stmt->fetchAll() as $row) {
    $kunciJawaban[$row['id']] = $row['jawaban_aceh'];
}

if (empty($kunciJawaban)) {
    json_error("Paket tidak ditemukan.", 404);
}

$hasil = [];
$totalTerisi = 0;
$totalBenar = 0;

foreach ($kunciJawaban as $soalId => $kunci) {
    $inputUser = trim((string)($jawabanInput[$soalId] ?? ''));
    if ($inputUser === '') {
        $hasil[$soalId] = "kosong";
        continue;
    }
    $totalTerisi++;
    $benar = cocok_jawaban($inputUser, $kunci);
    $hasil[$soalId] = $benar ? "benar" : "salah";
    if ($benar) {
        $totalBenar++;
    }

    // Simpan jawaban terakhir pengguna
    if ($IS_GUEST) {
        $_SESSION['guest_answers'][$paketId][$soalId] = $inputUser;
    } else {
        $stmt2 = $pdo->prepare("INSERT INTO jawaban_user (user_id, soal_id, jawaban_input, benar)
                                VALUES (:uid, :sid, :input1, :benar1)
                                ON DUPLICATE KEY UPDATE jawaban_input = :input2, benar = :benar2, updated_at = NOW()");
        $stmt2->execute([
            'uid' => $CURRENT_USER_ID,
            'sid' => $soalId,
            'input1' => $inputUser,
            'benar1' => $benar ? 1 : 0,
            'input2' => $inputUser,
            'benar2' => $benar ? 1 : 0,
        ]);
    }
}

$statusBaru = 'belum';
if ($totalBenar === count($kunciJawaban)) {
    $statusBaru = 'selesai';
} elseif ($totalTerisi > 0) {
    $statusBaru = 'sedang';
}

if ($IS_GUEST) {
    $_SESSION['guest_progress'][$paketId] = $statusBaru;
} else {
    $stmt3 = $pdo->prepare("INSERT INTO progress (user_id, paket_id, status)
                            VALUES (:uid, :pid, :status1)
                            ON DUPLICATE KEY UPDATE status = :status2, updated_at = NOW()");
    $stmt3->execute(['uid' => $CURRENT_USER_ID, 'pid' => $paketId, 'status1' => $statusBaru, 'status2' => $statusBaru]);
}

json_response([
    "success" => true,
    "hasil" => $hasil,
    "status_paket" => $statusBaru,
    "total_benar" => $totalBenar,
    "total_soal" => count($kunciJawaban),
]);

<?php
require_once __DIR__ . '/../../middleware/auth_check.php';
require_once __DIR__ . '/../../config/database.php';

$totalPaket = (int)$pdo->query("SELECT COUNT(*) AS c FROM paket")->fetch()['c'];

$selesai = 0;
$sedang = 0;

if ($IS_GUEST) {
    foreach ($_SESSION['guest_progress'] ?? [] as $status) {
        if ($status === 'selesai') $selesai++;
        elseif ($status === 'sedang') $sedang++;
    }
} else {
    $stmt = $pdo->prepare("SELECT status, COUNT(*) AS c FROM progress WHERE user_id = :uid GROUP BY status");
    $stmt->execute(['uid' => $CURRENT_USER_ID]);
    foreach ($stmt->fetchAll() as $row) {
        if ($row['status'] === 'selesai') $selesai = (int)$row['c'];
        elseif ($row['status'] === 'sedang') $sedang = (int)$row['c'];
    }
}

json_response([
    "success" => true,
    "ringkasan" => [
        "total_paket" => $totalPaket,
        "selesai" => $selesai,
        "sedang" => $sedang,
        "belum" => $totalPaket - $selesai - $sedang,
    ],
]);

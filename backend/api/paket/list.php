<?php
require_once __DIR__ . '/../../functions/helper.php';
require_once __DIR__ . '/../../middleware/auth_check.php';
require_once __DIR__ . '/../../config/database.php';

$stmt = $pdo->query("SELECT id, nomor_paket, grid_baris, grid_kolom FROM paket ORDER BY nomor_paket ASC");
$paketList = $stmt->fetchAll();

$statusMap = [];

if ($IS_GUEST) {
    // Status tamu diambil dari session sementara (tidak permanen)
    foreach ($_SESSION['guest_progress'] ?? [] as $paketId => $status) {
        $statusMap[$paketId] = $status;
    }
} else {
    $stmt = $pdo->prepare("SELECT paket_id, status FROM progress WHERE user_id = :uid");
    $stmt->execute(['uid' => $CURRENT_USER_ID]);
    foreach ($stmt->fetchAll() as $row) {
        $statusMap[$row['paket_id']] = $row['status'];
    }
}

$result = [];
foreach ($paketList as $p) {
    $result[] = [
        "id" => (int)$p['id'],
        "nomor_paket" => (int)$p['nomor_paket'],
        "grid_baris" => (int)$p['grid_baris'],
        "grid_kolom" => (int)$p['grid_kolom'],
        "status" => $statusMap[$p['id']] ?? 'belum',
    ];
}

json_response(["success" => true, "paket" => $result]);

<?php
require __DIR__ . '/../backend/config/database.php';

$id = $pdo->query("SELECT id FROM paket WHERE nomor_paket = 1")->fetchColumn();
if (!$id) {
    echo "PAKET_NOT_FOUND\n";
    exit(1);
}

$pdo->exec("UPDATE paket SET grid_kolom = 18 WHERE id = " . (int)$id);

$updates = [
    ['CEUDAH', 'mendatar', 2, 13],
    ['SABE', 'mendatar', 4, 12],
    ['SILOP', 'menurun', 4, 12],
    ['CAMPLI', 'mendatar', 5, 7],
    ['LINCAH', 'mendatar', 7, 5],
    ['ENGKOT', 'mendatar', 10, 2],
    ['TULEH', 'menurun', 1, 15],
    ['HANCO', 'menurun', 4, 8],
    ['MAYANG', 'menurun', 6, 3],
    ['PINTO', 'menurun', 6, 6],
];

foreach ($updates as [$jawaban, $arah, $baris, $kolom]) {
    $sql = sprintf(
        "UPDATE soal SET baris_mulai = %d, kolom_mulai = %d WHERE paket_id = %d AND jawaban_aceh = '%s' AND arah = '%s'",
        $baris,
        $kolom,
        $id,
        addslashes($jawaban),
        addslashes($arah)
    );
    $pdo->exec($sql);
}

$stmt = $pdo->prepare("SELECT nomor_soal, arah, baris_mulai, kolom_mulai, panjang, jawaban_aceh FROM soal WHERE paket_id = :pid ORDER BY nomor_soal");
$stmt->execute(['pid' => $id]);
foreach ($stmt->fetchAll() as $row) {
    echo json_encode($row) . "\n";
}

$paket = $pdo->prepare("SELECT id, nomor_paket, grid_baris, grid_kolom FROM paket WHERE id = :id");
$paket->execute(['id' => $id]);
echo json_encode($paket->fetch()) . "\n";

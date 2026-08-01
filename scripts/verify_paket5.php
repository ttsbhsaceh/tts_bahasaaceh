<?php
$mysqli = new mysqli('127.0.0.1', 'root', '', 'tts_aceh');
if ($mysqli->connect_errno) {
    echo 'ERR:' . $mysqli->connect_error . PHP_EOL;
    exit(1);
}
$res = $mysqli->query('SELECT nomor_paket, grid_baris, grid_kolom FROM paket WHERE nomor_paket = 5');
if ($row = $res->fetch_assoc()) {
    echo 'paket=' . $row['nomor_paket'] . ':' . $row['grid_baris'] . 'x' . $row['grid_kolom'] . PHP_EOL;
} else {
    echo 'paket=not_found' . PHP_EOL;
}
$res2 = $mysqli->query('SELECT COUNT(*) AS c FROM soal WHERE paket_id = (SELECT id FROM paket WHERE nomor_paket = 5)');
if ($row2 = $res2->fetch_assoc()) {
    echo 'soal_count=' . $row2['c'] . PHP_EOL;
}
$res3 = $mysqli->query('SELECT nomor_soal, arah, baris_mulai, kolom_mulai, panjang, jawaban_aceh FROM soal WHERE paket_id = (SELECT id FROM paket WHERE nomor_paket = 5) ORDER BY nomor_soal LIMIT 3');
while ($row3 = $res3->fetch_assoc()) {
    echo 'sample=' . $row3['nomor_soal'] . ':' . $row3['arah'] . ':' . $row3['baris_mulai'] . ',' . $row3['kolom_mulai'] . ':' . $row3['panjang'] . ':' . $row3['jawaban_aceh'] . PHP_EOL;
}
$mysqli->close();

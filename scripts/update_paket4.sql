USE tts_aceh;
UPDATE paket SET grid_baris = 14, grid_kolom = 15 WHERE nomor_paket = 4;
SET @paket_id = (SELECT id FROM paket WHERE nomor_paket = 4);
DELETE FROM soal WHERE paket_id = @paket_id;
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'menurun', 1, 11, 5, 'alat peu nama jih yang fungsi untk tapajoh makanan?', 'Alat apa yang digunakan untuk makan sup?', 'TANCA'),
(@paket_id, 2, 'mendatar', 2, 10, 2, 'peu yang tapeugah nye pekerjaan tanyo kaleuh?', 'Apa yang diucapkan jika pekerjaan telah selesai?', 'KA'),
(@paket_id, 3, 'menurun', 2, 13, 5, 'peu yang tapubut nye teungeh taduk"?', 'Apa yang kita lakukan saat mengobrol?', 'MARIT'),
(@paket_id, 4, 'mendatar', 5, 10, 4, 'selaen honda peu yang 2 boh bhan?', 'Kendaraan apa yang memiliki dua roda?', 'GARI'),
(@paket_id, 5, 'menurun', 5, 10, 4, 'meunyo na aleu basah wate tagacah?', 'Lantai yang basah terasa bagaimana?', 'GLUE'),
(@paket_id, 6, 'menurun', 6, 4, 6, 'so yang tinggai i rumoh?', 'Siapa yang tinggal di rumah?', 'URUENG'),
(@paket_id, 7, 'menurun', 7, 7, 6, 'bak pat bak kaye tatanom?', 'Di mana pohon buah ditanam?', 'LAMPOH'),
(@paket_id, 8, 'menurun', 8, 2, 5, 'meseu na saboh beunda yang tertarik bak mata geupeunan?', 'Apa yang kamu rasakan terhadap makanan favoritmu?', 'GALAK'),
(@paket_id, 9, 'mendatar', 8, 6, 7, 'lawan kata tubit peu?', 'Lawan kata keluar adalah?', 'TAMOENG'),
(@paket_id, 10, 'mendatar', 11, 1, 8, 'indonesia nyo geukhen dengon?', 'Indonesia adalah sebuah apa?', 'NANGGROE');

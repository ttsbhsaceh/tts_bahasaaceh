USE tts_aceh;

DELETE FROM soal WHERE paket_id = (SELECT id FROM paket WHERE nomor_paket = 5);
DELETE FROM paket WHERE nomor_paket = 5;

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (5, 20, 12);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'mendatar', 5, 7, 4, 'lawan kata menang peu?', 'Lawan kata menang adalah?', 'TALO');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'mendatar', 8, 5, 5, 'meuseu ta jak duk bak rumoh laen peu nama jih?', 'Apa yang dilakukan saat berpindah rumah?', 'PINAH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'mendatar', 10, 6, 4, 'lawan kata leu" ge?', 'Lawan kata berkali-kali?', 'SIGO');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'mendatar', 12, 4, 5, 'peu lawan kata mate?', 'Lawan kata mati adalah?', 'HUDEP');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 15, 2, 6, 'mainan yang han item le geupeunan?', 'Apa yang terjadi jika mainan tidak bisa dipakai lagi?', 'REULEH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 9, 'mendatar', 17, 1, 4, 'meseu ta peublo barang tapi hana laba geupeunan?', 'Jika uang berkurang karena jualan tidak laku, disebut apa?', 'RUGO');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 10, 6, 'selaen geukhen aneuk inong peu nama laen?', 'Anak perempuan disebut apa?', 'PUTROE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'menurun', 4, 8, 7, 'peu nama binatang yang i phe aleh an galak i deng bak bungong?', 'Hewan apa yang suka hinggap di bunga?', 'BAMBANG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'menurun', 10, 6, 6, 'meunyo hana ngen berrti tanyo?', 'Jika tidak ada teman, kita menjadi apa?', 'SIDROE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 14, 4, 5, 'peu nama jih yang na bak bak bungong mawo?', 'Apa yang ada pada batang bunga mawar?', 'DUROE');

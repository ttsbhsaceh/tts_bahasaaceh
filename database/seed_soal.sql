-- Seed data: 20 paket TTS Bahasa Aceh
-- Sumber: gambar TTS digital (nomor soal & posisi persis sesuai sumber),
-- grid dibangun otomatis dengan memastikan setiap perpotongan huruf valid
-- dan seluruh soal per paket saling terhubung dalam satu grid.

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (1, 18, 18);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'mendatar', 2, 13, 6, 'aneuk manyak yang lagak wajah peu nama jih?', 'Anak yang wajahnya bagus disebut?', 'CEUDAH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'mendatar', 4, 12, 4, 'meunye ka tip" uro berartii?', 'Setiap hari berarti...?', 'SABE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'mendatar', 5, 7, 6, 'peu nama alat bak dapu yang keu eng?', 'Bumbu dapur yang pedas?', 'CAMPLI');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 7, 5, 6, 'makanan peu yang rasa jih mameh keu eng?', 'Makanan dari buah yang rasanya pedas dan manis?', 'LINCAH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 9, 'mendatar', 10, 2, 6, 'peu nama binatang yang melangu lam ie?', 'Hewan yang berenang di air?', 'ENGKOT');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 15, 5, 'dengan peu tapuegt tugas selaen ngen ta ketik?', 'Apa yang dilakukan saat membuat tugas?', 'TULEH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'menurun', 4, 8, 5, 'glah yang bukah jeut keu?', 'Gelas yang jatuh bisa menjadi?', 'HANCO');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'menurun', 4, 12, 5, 'benda peu yang tapakek bak aki?', 'Apa yang dipakai di kaki saat di rumah?', 'SILOP');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'menurun', 6, 3, 6, 'meunye tanyo peugah haba keu lucu nama jih?', 'Kalau sedang bergurau, kita sedang...?', 'MAYANG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 6, 6, 5, 'peu yang tabuka wate tajak tamong rumoh?', 'Apa yang dibuka sebelum masuk rumah?', 'PINTO');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (2, 17, 14);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'mendatar', 3, 8, 5, 'peu nama binatang yang meukokoh watee beungoh?', 'Hewan yang berkokok di pagi hari?', 'MANOK');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'mendatar', 7, 3, 6, 'lawan kata goh lom peu?', 'Lawan kata belum?', 'KALEUH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'mendatar', 10, 2, 6, 'peu nama binatang yang galak pajoh naleung dan meu-embek?', 'Hewan yang suka makan rumput dan mengembik?', 'KAMENG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 13, 1, 5, 'peu nama binatang yang geubri susu?', 'Hewan yang menghasilkan susu?', 'LEUMO');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 10, 3, 'lawan kata jeut pue?', 'Lawan kata iya?', 'HAN');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'menurun', 1, 12, 3, 'soe yang peutuha tanyo?', 'Siapa yang melahirkan kita?', 'MAK');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'menurun', 3, 8, 5, 'raseu gula peu?', 'Rasa gula adalah?', 'MAMEH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'menurun', 7, 3, 5, 'peu tanyoan keu cara?', 'Kata yang digunakan untuk bertanya tentang cara?', 'KIBAN');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'menurun', 9, 5, 6, 'lawan kata saleh peu?', 'Lawan kata salah?', 'BEUTOY');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'menurun', 9, 7, 4, 'lawan kata inong peu?', 'Lawan kata perempuan?', 'AGAM');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (3, 16, 11);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'mendatar', 4, 1, 6, 'peu nama jih makanan engkot?', 'Apa yang dipasang pada kail untuk menarik ikan?', 'EMPEUN');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'mendatar', 7, 5, 5, 'peu yang tapubut meunye tayak peu balek ngen?', 'Apa yang dilakukan saat mengirim teman pulang?', 'INTAT');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'mendatar', 8, 2, 4, 'peu yang tapakek bak badan?', 'Apa yang dipakai di badan?', 'BAJE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 9, 6, 4, '... droneun ho', 'Kalian mau kemana???', 'AWAK');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 4, 4, 'tarek that ... nyo?', 'Hari cerah banget ... ini', 'UROE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'menurun', 2, 2, 4, '... meujak u bireun', 'Kami mau pergi ke bireun', 'KAMO');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'menurun', 2, 6, 6, 'peu nama benda yang bak ta boh bu?', 'Apa yang digunakan untuk meletakkan nasi?', 'PINGAN');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'menurun', 6, 8, 4, 'lawan kata euu?', 'Lawan kata iya adalah?', 'HANA');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'menurun', 7, 5, 2, 'peu yang tajeb tip uro?', 'Apa yang kita minum setiap hari?', 'IE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 8, 2, 7, 'makanan yang teupeuget dari breuh?', 'Makanan yang terbuat dari beras apa?', 'BULUKAT');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (4, 14, 15);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 11, 5, 'alat peu nama jih yang fungsi untk tapajoh makanan?', 'Alat apa yang digunakan untuk makan sup?', 'TANCA');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'mendatar', 2, 10, 2, 'peu yang tapeugah nye pekerjaan tanyo kaleuh?', 'Apa yang diucapkan jika pekerjaan telah selesai?', 'KA');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'menurun', 2, 13, 5, 'peu yang tapubut nye teungeh taduk"?', 'Apa yang kita lakukan saat mengobrol?', 'MARIT');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'mendatar', 5, 10, 4, 'selaen honda peu yang 2 boh bhan?', 'Kendaraan apa yang memiliki dua roda?', 'GARI');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'menurun', 5, 10, 4, 'meunyo na aleu basah wate tagacah?', 'Lantai yang basah terasa bagaimana?', 'GLUE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'menurun', 6, 4, 6, 'so yang tinggai i rumoh?', 'Siapa yang tinggal di rumah?', 'URUENG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'menurun', 7, 7, 6, 'bak pat bak kaye tatanom?', 'Di mana pohon buah ditanam?', 'LAMPOH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 8, 2, 5, 'meseu na saboh beunda yang tertarik bak mata geupeunan?', 'Apa yang kamu rasakan terhadap makanan favoritmu?', 'GALAK');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 8, 6, 7, 'lawan kata tubit peu?', 'Lawan kata keluar adalah?', 'TAMOENG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 9, 'mendatar', 11, 1, 8, 'indonesia nyo geukhen dengon?', 'Indonesia adalah sebuah apa?', 'NANGGROE');

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

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (6, 11, 17);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'mendatar', 7, 10, 6, 'cicem biasa geupelihara bak?', 'Burung dipelihara di dalam...', 'CINTRA');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 3, 10, 3, 'nye tanyo kalen hantu peu yang tanyo rasakan?', 'Jika melihat hantu, kita merasa...', 'YOE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 2, 3, 6, 'peu nama beda yang wate ta eh bak ta puduk ule?', 'Kepala biasanya diletakkan di atas...', 'BANTAI');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 9, 'menurun', 6, 15, 5, 'glah yang bagah bukah geupeunan?', 'Gelas yang mudah pecah disebut...', 'RAPOH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 10, 'menurun', 3, 2, 7, 'lemo galak pajoh?', 'Sapi suka makan...', 'NALEUNG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 2, 12, 7, 'selaen buw peu nama binatang yang hi buw tapi rayek?', 'Monyet adalah hewan yang mirip...', 'ENGKONG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'mendatar', 4, 7, 6, 'wate ujeun tanyo tapakek?', 'Saat hujan, kita memakai...', 'PAYONG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'mendatar', 4, 1, 4, 'peu nama alat untuk ta khep labang?', 'Alat untuk memukul paku adalah...', 'PALE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'menurun', 1, 8, 4, 'yang biasa ta leung bak aleu peu?', 'Tikar biasanya digelar di lantai untuk...', 'TIKA');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'menurun', 1, 4, 4, 'rata" meja ngen kursi geupeugt darii?', 'Meja dan kursi banyak dibuat dari...', 'KAYE');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (7, 19, 14);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'mendatar', 5, 6, 7, 'meunye ka hek kadang tanyo?', 'Ketika kita lelah kadang kita...', 'TEUNGET');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'mendatar', 8, 5, 5, 'ureng biasa ek geubeu et barang geuhen berarti geu an?', 'Orang yang bisa mengangkat barang berat disebut...', 'TEUGA');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'mendatar', 11, 6, 4, 'meunye tanyo hana tapeugt tugas berarti tanyo?', 'Tidak mengerjakan tugas karena lupa disebut...', 'DALE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 13, 4, 4, 'segolom jak kula berarti tanyo harus .... baje kula', 'Sebelum pergi ke sekolah, kita ... seragam.', 'PAKE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 9, 'mendatar', 16, 1, 8, 'baje meukrot" ta peurapi dengan cara?', 'Baju kusut dirapikan dengan cara...', 'GEUMOSOK');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 11, 5, 'tanyo wangi ngen sabon berarti harus?', 'Kita wangi karena sabun berarti harus...', 'MANOE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'menurun', 5, 6, 5, 'meunye tabuka sut berati harus .... ile', 'Untuk membuka laci, kita harus...', 'TAREK');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'menurun', 7, 9, 6, 'cicem i phe bak?', 'Burung terbang di...', 'LANGET');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'menurun', 10, 7, 5, 'meunyo makanan lam pingan ka gleh tapajoh berarti?', 'Jika makanan sudah dimakan semua, berarti sudah...', 'KABEH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 12, 5, 6, 'nye leuh tamano tanyo ta peu tho badan ngen...', 'Setelah mandi, badan dikeringkan dengan...', 'HANDOK');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (8, 12, 20);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'mendatar', 4, 9, 7, 'orang yang merumpok juara berarti?', 'Orang yang juara disebut...', 'MEUNANG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'mendatar', 6, 13, 7, 'tanyo harus get" wate ta?', 'Kita harus saling baik saat...', 'MEUNGON');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'mendatar', 7, 7, 5, 'peng dak jeut ta ... lam celeng', 'Uang sebaiknya kita ... di celengan.', 'KUBAH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 9, 'mendatar', 10, 1, 7, 'segalom tapubut si peubut sipu" tanyo harus ?', 'Sebelum bertindak, kita harus...', 'SEUMIKE');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 12, 5, 'nye olah raga tanyo jeut ta?', 'Saat olahraga, kita bisa...', 'PLUNG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'menurun', 1, 14, 7, 'meunyo tanyo takalen bak lungkik pinto berarti teungeh?', 'Melihat dari celah pintu disebut...', 'JEUNGEK');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'menurun', 3, 10, 6, 'layang putoh berarti ka .... u langet', 'Layang-layang putus lalu ... ke udara.', 'LEUPAH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'menurun', 4, 18, 4, 'kelinci jeut i ?', 'Kelinci bisa...', 'GROP');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 7, 7, 5, 'ie yang kabeh tajeb bak plok berarti?', 'Air minum di botol sudah...', 'KABEH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'menurun', 8, 3, 5, 'tanyo nye deuk berarti deuk bak?', 'Kita merasa lapar di bagian...', 'PRUET');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (9, 12, 13);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'mendatar', 2, 7, 5, 'tanyo tajak bak?', 'Kita berjalan di...', 'JALAN');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'mendatar', 4, 7, 5, 'ureung saket biasa ?', 'Orang yang sakit biasanya merasa...', 'LEMEH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'mendatar', 5, 5, 3, 'aneuk manyak i maen i ... rumoh', 'Anak-anak bermain di ... rumah.', 'LUA');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'mendatar', 7, 5, 3, 'bek tuwe ... aro mak wate koh jalan', 'Jangan lupa ... tangan ibu saat menyeberang jalan.', 'MAT');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 9, 1, 5, 'nye on kaye i bapot berarti na?', 'Daun bergerak karena ada...', 'ANGEN');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 8, 4, 'pasai an biasa ... ureung', 'Pasar biasanya sangat...', 'RAME');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'menurun', 1, 10, 5, 'buku lon ... teupakek', 'Buku tulisku sudah ... dipakai.', 'KABEH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'menurun', 4, 2, 6, 'nye tanyo kalen yang aneh tanyo merasa?', 'Jika melihat hal yang aneh, kita merasa...', 'HIREUN');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'menurun', 4, 7, 4, 'kapai an ka ngop lam ...', 'Kapal itu tenggelam di laut', 'LAOT');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 7, 5, 3, 'ie untuk manoe jeut ta crong bak?', 'Air untuk mandi bisa diambil dari...', 'MON');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (10, 13, 12);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 5, 'mendatar', 4, 1, 7, 'nye ka tetap taduk bak rumoh an berarti ka sah ?', 'Menetap di suatu tempat.', 'TINGGAI');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 6, 'mendatar', 6, 6, 5, 'yak ta ... makanan an', 'Ayok kita ... makanan itu', 'PAJOH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'mendatar', 8, 5, 5, 'ie yang i le biasa jih bak?', 'Air yang mengalir dari hulu ke hilir.', 'KRUNG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 9, 'mendatar', 10, 1, 5, 'tatarek sipupu ateuk tanyo berarti dengan cara ?', 'Menarik sesuatu ke arah kita.', 'TAREK');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 1, 'menurun', 1, 4, 6, 'rasa makanan yang meurasa berarti?', 'Rasa makanan yang lezat.', 'MANGAT');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 2, 'menurun', 2, 9, 7, 'tempat yang taduk na duson peu nan?', 'Tempat tinggal di desa.', 'GAMPONG');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 3, 'menurun', 3, 2, 4, 'tempat yang hana to berarti?', 'Tempat yang letaknya tidak dekat.', 'JIOH');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 4, 'menurun', 3, 7, 6, 'benda yang tapakek bak aki wate tajak kula peu nama jih?', 'Benda yang dipakai di kaki saat sekolah.', 'SIPATU');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 7, 'menurun', 8, 2, 3, 'lawan kata dalam?', 'Lawan kata "dalam".', 'LUA');
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES (@paket_id, 8, 'menurun', 8, 5, 4, 'anggota tuboh yang ijak" peu nama jih?', 'Anggota tubuh untuk berjalan.', 'KAKI');

-- Paket 11-20
INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (11, 15, 15);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 1, 7, 'Bagian tanaman yang warna warni ditimoh bak pucok', 'Bagian tanaman yang berwarna-warni dan harum.', 'BUNGONG'),
(@paket_id, 2, 'mendatar', 3, 1, 5, 'proses meutamah rayek tanaman', 'Proses berkembang atau bertambah besar bagi tanaman.', 'TIMOH'),
(@paket_id, 3, 'mendatar', 6, 10, 5, 'tatagun masakan ngen tabalot ngen oen biasa tapeulaku bak ungkot bileh', 'Cara memasak makanan dibungkus daun lalu dipanggang/dikukus.', 'PAYEH'),
(@paket_id, 4, 'mendatar', 8, 10, 6, 'Sifeut sok wate ipeudeuh bak gop', 'Sifat suka pamer kepada orang lain.', 'MEUNG'),
(@paket_id, 5, 'mendatar', 10, 6, 6, 'buet wate ipajoh mangsa le binatang', 'Tindakan menerkam atau menyergap mangsa.', 'JAKHAP'),
(@paket_id, 7, 'mendatar', 6, 3, 5, 'But tapuduk bibit lam tanoh', 'Kegiatan memasukkan bibit atau tumbuhan ke dalam tanah.', 'TANOM'),
(@paket_id, 9, 'mendatar', 6, 7, 6, 'ukuran aneuk miet yang manteng ubeut', 'Ukuran yang tidak besar atau anak kecil.', 'MANYAK'),
(@paket_id, 6, 'menurun', 1, 1, 6, 'sesuatu yang nyata hana salah', 'Sesuatu yang benar, nyata, atau tidak salah.', 'BUTOI'),
(@paket_id, 8, 'menurun', 3, 3, 7, 'sipupu yang manteng na', 'Keadaan yang masih ada atau belum berubah.', 'MANTENG'),
(@paket_id, 10, 'menurun', 5, 11, 6, 'bagian tuboh cicem untuk diphe', 'Bagian tubuh burung yang digunakan untuk terbang.', 'SAYEUP');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (12, 13, 17);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 2, 5, 'Tanaman yang jeut tapeuget keu bantai.', 'Bahan lembut putih yang biasa dipakai untuk mengisi bantal atau kasur.', 'PANJO'),
(@paket_id, 2, 'mendatar', 3, 1, 5, 'Tapleh kulet dari lua.', 'Proses melepaskan kulit luar atau mengupas sesuatu.', 'PLUEK'),
(@paket_id, 3, 'mendatar', 6, 4, 7, 'Buah ubeut yang keu''eung.', 'Buah kecil berasa pedas yang sering dijadikan bumbu masakan.', 'CAMPLI'),
(@paket_id, 4, 'mendatar', 4, 10, 4, 'Meuphom atau itupu sesuatu.', 'Mengerti, paham, atau menguasai suatu informasi.', 'THEE'),
(@paket_id, 5, 'mendatar', 8, 11, 5, 'Sifeut hana ye keu sipupu.', 'Sifat tidak gentar menghadapi bahaya atau berani.', 'BEUHE'),
(@paket_id, 6, 'menurun', 10, 7, 6, 'Bagian lam tapak jaroe.', 'Bagian dalam telapak tangan.', 'PALEUT'),
(@paket_id, 7, 'menurun', 1, 2, 5, 'Buet wate tapeutentei sipupu.', 'Tindakan menentukan atau memilih sesuatu dari beberapa opsi.', 'PILEH'),
(@paket_id, 8, 'menurun', 3, 5, 8, 'Ungkot sure yang thoe geutagun.', 'Potongan ikan tongkol kering yang dimasak khas Aceh.', 'KEMAMAH'),
(@paket_id, 9, 'menurun', 6, 8, 7, 'Deuh takalon ngen mata.', 'Dapat dilihat oleh mata atau kelihatan.', 'LEUMAH'),
(@paket_id, 10, 'menurun', 3, 12, 8, 'Hantu yang na wate meugreb.', 'Makhluk halus atau sejenis hantu dalam mitologi.', 'GEUNTEUT');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (13, 14, 15);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 2, 7, 'Nikmat yang geubri le Tuhan.', 'Karunia, nikmat, atau rezeki yang diberikan oleh Tuhan.', 'RASEUKI'),
(@paket_id, 2, 'mendatar', 3, 2, 4, 'Usaha wate tasitet sipupue.', 'Usaha untuk menemukan atau mencari sesuatu.', 'MITA'),
(@paket_id, 3, 'mendatar', 5, 1, 5, 'Ie yang itubiet dr kulit wate suum.', 'Cairan alami yang keluar dari pori-pori kulit saat kepanasan atau beraktivitas.', 'REUOH'),
(@paket_id, 4, 'mendatar', 7, 5, 7, 'Jumlah yang kalewat dari ta peurelei.', 'Sisa atau jumlah yang melampaui batas cukup.', 'LEUBEH'),
(@paket_id, 5, 'mendatar', 9, 7, 5, 'Posisi yang na di ateuh saboh tempat.', 'Posisi yang berada di bagian atas suatu tempat.', 'ICONG'),
(@paket_id, 6, 'mendatar', 11, 8, 5, 'Ukoran leubeh dr lipeh.', 'Ukuran ketebalan suatu benda atau objek.', 'TUBAI'),
(@paket_id, 7, 'menurun', 1, 2, 7, 'Binatang lam uteung meucorak yang ipajoh siy.', 'Hewan buas pemangsa bertubuh besar bercorak belang yang dijuluki raja hutan.', 'RIMUENG'),
(@paket_id, 8, 'menurun', 5, 5, 5, 'Sifeut sesuatu yang han jeut takalen dan ubeut.', 'Sifat permukaan atau tekstur yang tidak kasar.', 'HALOH'),
(@paket_id, 9, 'menurun', 7, 8, 5, 'Ukoran yang nit dan hana le.', 'Ukuran jumlah yang sedikit atau tidak banyak.', 'BACUT'),
(@paket_id, 10, 'menurun', 11, 10, 3, 'Tajok sesuatu ke ureung laen.', 'Tindakan menyerahkan sesuatu kepada orang lain.', 'BRI');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (14, 15, 15);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 2, 6, 'tuboh wate tingeh meuasoe', 'Tubuh yang terlihat gemuk atau berisi.', 'TUMBON'),
(@paket_id, 2, 'mendatar', 3, 1, 8, 'sasaran yang butoi', 'Sasaran yang tepat atau kena.', 'KEUNONG'),
(@paket_id, 3, 'mendatar', 7, 5, 5, 'sifeut sok atau sombong', 'Sifat suka menyombongkan diri.', 'MBONG'),
(@paket_id, 4, 'mendatar', 9, 5, 8, 'yang jeut peupuleh peunyaket atau ubat', 'Sesuatu yang digunakan untuk mengobati penyakit.', 'PEUNAWA'),
(@paket_id, 5, 'mendatar', 11, 10, 4, 'ukuran yang paneuk', 'Ukuran yang tidak panjang.', 'TUET'),
(@paket_id, 6, 'mendatar', 13, 8, 4, 'taminah ke tempat laen dengan cara tagrop', 'Berpindah tempat dengan cara melompat.', 'CHEN'),
(@paket_id, 7, 'menurun', 1, 2, 6, 'talangkah udalam saboh tempat', 'Masuk ke dalam suatu tempat.', 'TAMENG'),
(@paket_id, 8, 'menurun', 3, 5, 5, 'sipupu yang golom tapubut', 'Sesuatu yang belum dilakukan.', 'GOLOM'),
(@paket_id, 9, 'menurun', 7, 6, 5, 'tabuka mata wate beudeh eh', 'Membuka mata ketika bangun tidur.', 'BLEUT'),
(@paket_id, 10, 'menurun', 9, 10, 5, 'teuntang jeum, uroe, masa', 'Berhubungan dengan jam, hari, atau masa.', 'WATEE');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (15, 13, 15);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 2, 4, 'rasa bungeh atau hana senang', 'Perasaan emosi atau rasa tidak senang.', 'DHET'),
(@paket_id, 2, 'mendatar', 3, 1, 3, 'itubit ie mata karna sedih', 'Menumpahkan air mata karena sedih.', 'MOE'),
(@paket_id, 3, 'mendatar', 3, 5, 6, 'rasa wate kuah ka pah', 'Ukuran atau kondisi yang sudah pas dan sesuai.', 'MINYUM'),
(@paket_id, 4, 'mendatar', 6, 5, 9, 'su rudok dan kilat wate ujeun', 'Suara gemuruh menggelegar di langit saat hujan.', 'GEULANTEU'),
(@paket_id, 5, 'mendatar', 11, 10, 3, 'koh sipupue ngen igoe', 'Menjepit atau memotong sesuatu dengan gigi.', 'KAP'),
(@paket_id, 6, 'menurun', 1, 2, 4, 'bagian ulei ateuh alis', 'Bagian kepala di atas alis.', 'DHOE'),
(@paket_id, 7, 'menurun', 1, 5, 6, 'ukor brat benda wate tatimang', 'Mengukur berat suatu benda dengan timbangan.', 'TIMANG'),
(@paket_id, 8, 'menurun', 2, 9, 2, 'apui wate tingeh udep', 'Keadaan api yang sedang membara atau berkobar.', 'HU'),
(@paket_id, 9, 'menurun', 6, 8, 5, 'posisi yang paling ujong', 'Posisi yang berada di bagian belakang.', 'LIKOT'),
(@paket_id, 10, 'menurun', 6, 11, 6, 'benda yang tapeusapat jeut keu saboh', 'Kumpulan benda yang disusun bertumpuk menjadi satu.', 'TUMPOK');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (16, 17, 14);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 1, 6, 'binatang meuaki dua yang kireuh-kireuh umpeun', 'Hewan berkaki dua yang biasa dipelihara dan menghasilkan telur.', 'MANOK'),
(@paket_id, 2, 'mendatar', 5, 1, 5, 'rasa wate ka hana ek le makanan dan ka luwih lam pruet', 'Perasaan mual atau... di perut.', 'LEUGE'),
(@paket_id, 3, 'mendatar', 7, 4, 6, 'kata gantoe yang makna jih rame ureung', 'Kata ganti yang bermakna "seluruh" atau...', 'MANDUM'),
(@paket_id, 4, 'mendatar', 10, 4, 7, 'tumbuhan yang ditimoh diateuh tanoh warna ijo biasajih umpeun lumo', 'Tumbuhan liar yang biasa tumbuh di tanah lapang atau rumput.', 'NALEUNG'),
(@paket_id, 5, 'mendatar', 12, 10, 4, 'binatang yang dua boh aki biasa lebih muhai dari manok', 'Unggas air yang mirip dengan angsa tetapi berukuran lebih kecil.', 'ITEK'),
(@paket_id, 6, 'menurun', 1, 1, 7, 'buahan yang sering dipakek keu lincah yang kulit jih ijo atau kuning wate ka masak', 'Buah tropis berdaging manis dengan kulit berwarna hijau atau kekuningan saat matang (mangga).', 'MAMPLAM'),
(@paket_id, 7, 'menurun', 5, 4, 8, 'wilayah yang ubeut yang pimpin jih geuchik', 'Pembagian wilayah administratif terkecil di bawah mukim (desa).', 'GAMPONG'),
(@paket_id, 8, 'menurun', 9, 7, 5, 'buet yang wate tapeulaku meulanggar hukom tuhan', 'Perbuatan melanggar hukum Tuhan atau dosa.', 'DESYA'),
(@paket_id, 9, 'menurun', 10, 10, 3, 'Rasa roh takhem bak tuboh wate di lik-lik', 'Rasa geli atau kebas pada tubuh.', 'GLI'),
(@paket_id, 10, 'menurun', 11, 12, 5, 'Buet wate geuseleung makanan', 'Tindakan menyuap makanan.', 'PEUAP');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (17, 17, 18);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 1, 7, 'Mayat makhluk hudep yang ka mate', 'Mayat atau jasad makhluk hidup yang sudah mati (bangkai).', 'BANGKE'),
(@paket_id, 2, 'mendatar', 4, 1, 7, 'pakaian yang tapakek dimiyup untuk top pha', 'Pakaian yang dipakai untuk menutupi bagian bawah tubuh (celana).', 'SILUWEU'),
(@paket_id, 3, 'mendatar', 7, 4, 6, 'di mame le ie krueng', 'Terbawa oleh arus air (hanyut).', 'HANYOT'),
(@paket_id, 4, 'mendatar', 11, 7, 7, 'Ie yang di le trok u laot', 'Aliran air besar yang mengalir menuju laut (sungai).', 'KRUENG'),
(@paket_id, 5, 'mendatar', 13, 10, 8, 'hantu yang na di aceh', 'Makhluk halus atau makhluk gaib (hantu).', 'BUROENG'),
(@paket_id, 6, 'menurun', 1, 1, 5, 'logam yang kuat biasa tapakek untuk bangunan', 'Logam kuat yang biasa digunakan untuk bahan bangunan atau alat-alat (besi).', 'BEUSO'),
(@paket_id, 7, 'menurun', 3, 4, 5, 'tempat tinggai manusia', 'Tempat tinggal manusia (rumah).', 'RUMOH'),
(@paket_id, 8, 'menurun', 6, 7, 6, 'binatang jeut diphe yang biasa jih dipip darah', 'Serangga kecil pengisap darah yang sering berbunyi berdengung (nyamuk).', 'NYAMOK'),
(@paket_id, 9, 'menurun', 10, 10, 6, 'binatang sejenis lumo tapi biasa jih lam lubeung', 'Hewan mamalia besar bertanduk yang suka kubangan (kerbau).', 'KEUBEU'),
(@paket_id, 10, 'menurun', 12, 14, 4, 'perhiasan yang warna kuneng yang meumanyam', 'Logam mulia berwarna kuning yang sangat berharga (emas).', 'MEUH');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (18, 11, 15);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 1, 7, 'alat makanan yang biasa taboh bu atau ungkot', 'Alat makan berbentuk cekung yang biasa digunakan untuk meletakkan nasi dan lauk (piring).', 'PINGAN'),
(@paket_id, 2, 'mendatar', 3, 1, 5, 'buet wate tacok ie lam mon ngen tima', 'Kegiatan mengambil air dari sumur menggunakan timba (menimba).', 'CRONG'),
(@paket_id, 3, 'mendatar', 5, 1, 5, 'sifeut binatang yang golom ragoe', 'Sifat hewan atau sesuatu yang tidak jinak (liar).', 'KLEUT'),
(@paket_id, 4, 'mendatar', 7, 4, 8, 'makanan yang dipajoh le manusia', 'Sesuatu yang biasa dimakan oleh manusia atau hewan (makanan).', 'PEUNAJOH'),
(@paket_id, 5, 'mendatar', 4, 10, 4, 'buet tapakek pakaian atau barang bak tuboh', 'Tindakan mengenakan pakaian atau barang di tubuh (pakai).', 'NGUI'),
(@paket_id, 6, 'menurun', 1, 1, 5, 'bagian tumbuhan paleng ujong', 'Bagian tumbuhan yang paling ujung atau muda (pucuk).', 'PUCOK'),
(@paket_id, 7, 'menurun', 5, 2, 4, 'keadaan badan wate tingoh leumoh', 'Kondisi badan yang tidak bertenaga atau letih (lemah).', 'LAEH'),
(@paket_id, 8, 'menurun', 5, 5, 5, 'penyaket yang menular sering keuneng bak manok', 'Penyakit ayam menular yang menyebar dengan cepat secara luas (wabah).', 'TAEUN'),
(@paket_id, 9, 'menurun', 8, 12, 5, 'makanan wate tatagun ka brat that hitam', 'Keadaan makanan atau benda yang kelewatan masak hingga hitam (hangus).', 'ANGOH'),
(@paket_id, 10, 'menurun', 10, 14, 5, 'tadeng bak saboh tempat wate lam perjalananan', 'Singgah atau berhenti sejenak di suatu tempat dalam perjalanan (mampir).', 'PIYOH');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (19, 13, 14);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 1, 6, 'binatang yang bineng krueng mirip biawak', 'Hewan melata pemakan daging yang mirip biawak (biawak).', 'MURUWA'),
(@paket_id, 2, 'mendatar', 3, 1, 7, 'goni yang biasa dipaso untuk panen pade', 'Wadah besar yang biasanya terbuat dari goni atau plastik untuk menampung hasil bumi (karung).', 'EUMPANG'),
(@paket_id, 3, 'mendatar', 5, 1, 5, 'binatang yang cerdik dan sereng seumeungeut', 'Hewan mamalia bertelinga panjang yang suka melompat (kancil).', 'GLUEH'),
(@paket_id, 4, 'mendatar', 8, 4, 5, 'tempat jep ie yang dari kaca', 'Tempat minum yang biasanya terbuat dari kaca atau porselen (gelas).', 'CAWAN'),
(@paket_id, 5, 'mendatar', 9, 10, 3, 'bagian tuboh manusia yang diateuh tuot', 'Bagian kaki manusia di atas lutut (paha).', 'PHA'),
(@paket_id, 6, 'mendatar', 11, 7, 5, 'bei hana mangat sejenis beu ungkot', 'Aroma yang tidak sedap atau bau khas ikan (amis).', 'HANYI'),
(@paket_id, 7, 'menurun', 1, 1, 5, 'bagian muka yang sering timoh jerawat', 'Bagian wajah sering tumbuh jerawat.', 'MIENG'),
(@paket_id, 8, 'menurun', 5, 5, 7, 'tempat boh makanan atau punuwo', 'Sajian makanan atau hidangan yang disuguhkan (hidangan).', 'HIDANG'),
(@paket_id, 9, 'menurun', 7, 7, 5, 'Bagian bumo yang sereng tanyo gideng ngen aki', 'Lapisan permukaan bumi tempat berpijak (tanah).', 'TANOH'),
(@paket_id, 10, 'menurun', 8, 11, 4, 'kue khas aceh yang mebentuk ungkot atau bungong', 'Jenis kue tradisional khas Aceh yang berbentuk ikan atau bunga (kue bolu).', 'BHOI');

INSERT INTO paket (nomor_paket, grid_baris, grid_kolom) VALUES (20, 14, 21);
SET @paket_id = LAST_INSERT_ID();
INSERT INTO soal (paket_id, nomor_soal, arah, baris_mulai, kolom_mulai, panjang, clue_aceh, clue_indonesia, jawaban_aceh) VALUES
(@paket_id, 1, 'mendatar', 1, 1, 5, 'boeh warna oren yang le aneuk', 'Buah tropis berdaging manis dengan biji-biji kecil di bagian tengahnya (pepaya).', 'PUTEK'),
(@paket_id, 2, 'mendatar', 4, 1, 5, 'boeh warna kuneng dan meusisek diluwa dan na mahkota', 'Buah tropis berdaging kuning dengan kulit bersisik dan bermahkota (nanas).', 'ANEUH'),
(@paket_id, 3, 'mendatar', 6, 1, 6, 'buet wate tingeh le that dan bingong tapubut', 'Perasaan bingung, canggung, atau salah tingkah (sibuk).', 'GABUEK'),
(@paket_id, 4, 'mendatar', 8, 6, 5, 'boeh yang warna kuneng sereng peget keu kuah apam', 'Buah besar berduri tumpul dengan daging buah berwarna kuning yang harum (nangka).', 'PANAH'),
(@paket_id, 5, 'mendatar', 12, 9, 5, 'taba sipupu tapuduk ateuh baho', 'Beban yang dibawa dengan cara diletakkan di atas pundak atau dipikul (pikul).', 'GULAM'),
(@paket_id, 6, 'menurun', 8, 13, 7, 'tapeumate sipupu', 'Tindakan atau proses untuk mematikan sesuatu (mematikan).', 'PEULEN'),
(@paket_id, 7, 'menurun', 1, 1, 7, 'boeh warna kuneng sereng dipajoh le monyet', 'Buah berbentuk lonjong yang tersusun dalam tandan dengan kulit kuning saat matang (pisang).', 'PISANG'),
(@paket_id, 8, 'menurun', 6, 6, 5, 'alat untuk itubit angen', 'Alat yang digerakkan untuk menghasilkan angin (kipas).', 'KIPAH'),
(@paket_id, 9, 'menurun', 7, 9, 6, 'bagian tumbuhan untuk ditimoh oen', 'Bagian tumbuhan yang menghubungkan daun atau buah dengan batang utama (tangkai).', 'TANGKE'),
(@paket_id, 10, 'menurun', 5, 13, 6, 'rhet dari tempat', 'Keadaan jatuh dari tempat yang lebih tinggi (jatuh).', 'SUMPOM');

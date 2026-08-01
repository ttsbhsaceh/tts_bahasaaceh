# TTS Aceh — Media Belajar Bahasa Aceh Lewat Teka-Teki Silang

Website permainan Teka-Teki Silang (TTS) sederhana sebagai media pembelajaran
Bahasa Aceh. Antarmuka berbahasa Indonesia, clue soal berbahasa Aceh (bisa
ditoggle ke Bahasa Indonesia), dan jawaban wajib menggunakan Bahasa Aceh.

## Teknologi

**Frontend:** HTML5, CSS3, JavaScript (Vanilla), Bootstrap 5, SweetAlert2, Lucide Icons
**Backend:** PHP Native 8.0 (tanpa framework), API JSON, PHP Session untuk autentikasi
**Database:** MySQL (PDO, prepared statements)

## Fitur

- Login, Registrasi, dan mode **Masuk sebagai Tamu**
- 20 paket TTS (saat ini 10 paket sudah terisi, 10 lagi menyusul — lihat catatan di bawah)
- Clue Bahasa Aceh dengan tombol toggle ke Bahasa Indonesia
- Satu tombol "Periksa Jawaban" untuk seluruh grid sekaligus
- Riwayat & status progres per akun (Belum / Sedang / Selesai), tersimpan otomatis
- Progres tamu bersifat sementara (per sesi, tidak permanen)

## Struktur Folder

```
project/
├── frontend/        # HTML, CSS, JS (tidak butuh build tool)
└── backend/         # API PHP (JSON endpoints)
    ├── api/auth/     # register, login, guest, logout, me
    ├── api/paket/    # list, detail
    ├── api/soal/     # check_answer
    ├── api/progress/ # save, get
    ├── config/       # koneksi database
    ├── middleware/   # auth_check.php (verifikasi session)
    └── functions/    # helper.php
```

## Instalasi Lokal (XAMPP / Laragon, PHP 8.0)

1. Salin folder `project/` ke `htdocs/` (XAMPP) atau `www/` (Laragon).
2. Buat database MySQL baru, misalnya `tts_aceh`.
3. Import struktur tabel:
   ```
   mysql -u root -p tts_aceh < database/tts_aceh.sql
   ```
4. Import data 10 paket awal:
   ```
   mysql -u root -p tts_aceh < database/seed_soal.sql
   ```
5. Salin `backend/config/database.example.php` menjadi `backend/config/database.php`,
   lalu isi `$DB_HOST`, `$DB_NAME`, `$DB_USER`, `$DB_PASS` sesuai environment lokalmu.
6. Buka `http://localhost/project/frontend/index.html` di browser.

## Deployment ke InfinityFree

1. Upload seluruh isi folder `project/` ke `htdocs` di File Manager InfinityFree.
2. Buat database MySQL lewat vPanel InfinityFree, lalu import `tts_aceh.sql` dan
   `seed_soal.sql` lewat phpMyAdmin yang disediakan.
3. Edit `backend/config/database.php` di server dengan kredensial yang diberikan
   InfinityFree (host biasanya bukan `localhost`, cek di vPanel).
4. Pastikan versi PHP di vPanel diset ke **8.0**.
5. Akses website lewat domain InfinityFree kamu — frontend & backend satu origin,
   jadi PHP Session langsung berfungsi tanpa konfigurasi CORS tambahan.

## Catatan Penting Soal Data Grid TTS

Data 10 paket pertama sudah diperbarui menggunakan gambar TTS digital yang lebih
presisi (bukan hasil scan tulisan tangan). Sekarang setiap nomor soal
(Mendatar/Menurun) **sama persis** dengan penomoran di sumber aslinya, termasuk
kasus di mana satu nomor dipakai bersama oleh soal Mendatar & Menurun yang mulai
di kotak yang sama. Posisi grid (baris/kolom) tetap dibangun oleh skrip
(`database/seed_soal.sql`) dengan memastikan setiap perpotongan huruf valid dan
seluruh 10 soal per paket saling terhubung dalam satu grid — jadi bentuk visual
persisnya mungkin tidak 100% identik dengan tata letak asli di gambar, tapi semua
clue, jawaban, dan nomor soal sudah akurat.

10 paket sisanya (paket 11–20) belum ada — tinggal ditambahkan lewat tabel
`paket` dan `soal` di database tanpa perlu mengubah kode aplikasi.

## Keamanan

- Semua query menggunakan PDO prepared statement.
- Password di-hash dengan `password_hash()` / `password_verify()`.
- Endpoint yang butuh login diproteksi lewat `middleware/auth_check.php`.
- Output ditampilkan dengan `htmlspecialchars()`.

## Screenshot

Lihat folder `docs/screenshots/` untuk tangkapan layar aplikasi.

# 🚀 Panduan Deploy TTS Bahasa Aceh

Proyek ini menggunakan dua platform:
- **Railway** → Backend PHP + MySQL
- **Netlify** → Frontend (HTML/CSS/JS statis)

---

## BAGIAN 1 — Deploy Backend ke Railway

### Langkah 1: Buat akun & project Railway
1. Buka https://railway.app dan login / daftar
2. Klik **"New Project"** → pilih **"Deploy from GitHub repo"**
3. Hubungkan repo GitHub kamu yang berisi proyek ini
   > Jika belum ada di GitHub, upload dulu via `git push`

### Langkah 2: Tambahkan MySQL
1. Di dalam project Railway, klik **"+ New"** → **"Database"** → **"MySQL"**
2. Tunggu MySQL selesai provisioning

### Langkah 3: Import database
1. Klik service MySQL → tab **"Connect"**
2. Salin **"MySQL Connection URL"** lalu buka **TablePlus** / **DBeaver** / **phpMyAdmin**
3. Import file SQL berikut **secara urut**:
   ```
   database/tts_aceh.sql      ← struktur tabel (jalankan pertama)
   database/seed_soal.sql     ← data soal (jalankan kedua)
   ```

### Langkah 4: Cek environment variable
Railway otomatis menyuntikkan env var MySQL ke semua service dalam project yang sama:
- `MYSQLHOST`, `MYSQLPORT`, `MYSQLDATABASE`, `MYSQLUSER`, `MYSQLPASSWORD`

Pastikan service backend dan MySQL berada dalam **project yang sama** agar env var terbaca otomatis.

### Langkah 5: Salin URL Railway
1. Klik service backend → tab **"Settings"**
2. Di bagian **"Networking"** → klik **"Generate Domain"**
3. Salin URL yang muncul, contoh:
   ```
   https://project-tts-aceh-production.up.railway.app
   ```
4. Simpan URL ini — dibutuhkan di langkah Netlify

---

## BAGIAN 2 — Deploy Frontend ke Netlify

### Langkah 1: Edit netlify.toml
Buka file `netlify.toml` di root proyek, ganti baris ini:
```
to = "https://GANTI_URL_RAILWAY_KAMU/api/:splat"
```
dengan URL Railway yang kamu salin tadi:
```
to = "https://project-tts-aceh-production.up.railway.app/api/:splat"
```

### Langkah 2: Deploy ke Netlify
**Cara A — via GitHub (disarankan):**
1. Buka https://app.netlify.com → **"Add new site"** → **"Import from Git"**
2. Pilih repo yang sama dengan Railway
3. Build settings:
   - **Base directory**: (kosongkan)
   - **Publish directory**: `frontend`
   - **Build command**: (kosongkan)
4. Klik **"Deploy site"**

**Cara B — drag & drop:**
1. Buka https://app.netlify.com/drop
2. Drag folder `frontend/` ke halaman tersebut

### Langkah 3: Cek hasil deploy
1. Buka URL Netlify yang diberikan
2. Coba registrasi dan login
3. Coba mainkan salah satu paket TTS

---

## Troubleshooting

| Masalah | Solusi |
|---------|--------|
| "Koneksi database gagal" | Pastikan MySQL dan backend dalam project Railway yang sama |
| Login gagal / session hilang | Cek URL Railway di `netlify.toml` sudah benar |
| Halaman tidak ditemukan | Pastikan publish directory di Netlify = `frontend` |
| API 404 | Pastikan `netlify.toml` sudah diupdate sebelum deploy ulang |

---

## Struktur URL

```
Frontend:  https://nama-kamu.netlify.app/
Backend:   https://nama-kamu.up.railway.app/api/auth/login.php
```

Netlify secara otomatis meneruskan semua request `/backend/api/*`
dari frontend ke Railway (transparan, tanpa CORS issue).

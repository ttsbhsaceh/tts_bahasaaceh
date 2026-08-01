-- =====================================================
-- Database: tts_aceh
-- Website TTS (Teka-Teki Silang) Bahasa Aceh
-- =====================================================

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS paket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomor_paket INT NOT NULL UNIQUE,
    grid_baris INT NOT NULL,
    grid_kolom INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS soal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paket_id INT NOT NULL,
    nomor_soal INT NOT NULL,
    arah ENUM('mendatar','menurun') NOT NULL,
    baris_mulai INT NOT NULL,
    kolom_mulai INT NOT NULL,
    panjang INT NOT NULL,
    clue_aceh VARCHAR(255) NOT NULL,
    clue_indonesia VARCHAR(255) NOT NULL,
    jawaban_aceh VARCHAR(50) NOT NULL,
    FOREIGN KEY (paket_id) REFERENCES paket(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Progres tiap akun per paket
CREATE TABLE IF NOT EXISTS progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    paket_id INT NOT NULL,
    status ENUM('belum','sedang','selesai') NOT NULL DEFAULT 'belum',
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uniq_user_paket (user_id, paket_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (paket_id) REFERENCES paket(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Jawaban terakhir yang diinput pengguna, per soal
CREATE TABLE IF NOT EXISTS jawaban_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    soal_id INT NOT NULL,
    jawaban_input VARCHAR(50) NOT NULL DEFAULT '',
    benar TINYINT(1) NOT NULL DEFAULT 0,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uniq_user_soal (user_id, soal_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (soal_id) REFERENCES soal(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Setelah tabel dibuat, jalankan file seed_soal.sql untuk mengisi 10 paket awal.

const assert = require('assert');
const fs = require('fs');
const path = require('path');

const seedFile = path.join(__dirname, '..', 'database', 'seed_soal.sql');
assert.ok(fs.existsSync(seedFile), 'File seed utama belum tersedia');

const sql = fs.readFileSync(seedFile, 'utf8');
const paketNumbers = [...sql.matchAll(/INSERT INTO paket \(nomor_paket, grid_baris, grid_kolom\) VALUES \((\d+),/g)].map((m) => Number(m[1]));

assert.deepStrictEqual(paketNumbers.slice(0, 20), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], 'Seed utama harus memuat paket 1 sampai 20');
console.log('Seed data tests passed');

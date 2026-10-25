# Evaluasi Mandiri: Pemodelan Data Toko Online + Kupon Diskon

Lanjutan dari soal SQL 1-3 (tabel `pelanggan`, `produk`, `transaksi`).
Penambahan proses bisnis: **kupon diskon** (tabel `kupon` dan kolom `id_kupon` pada `transaksi`).

| Tahap | Isi | Lokasi |
|---|---|---|
| 1. Pemodelan Konseptual | Entitas, atribut, relasi, dan diagram ERD | `bukti_uts/Laporan_Pemodelan_Data.pdf` (Bab 2) |
| 2. Pemodelan Logis | Skema relasional dan normalisasi UNF, 1NF, 2NF, 3NF | `bukti_uts/Laporan_Pemodelan_Data.pdf` (Bab 3) |
| 3. Pemodelan Fisik | Kode SQL DDL dengan Primary Key, Foreign Key, dan constraint | `uts.sql` dan Bab 4 laporan |

## Struktur

- `uts.sql`: kode CREATE TABLE untuk 4 tabel di database `takoonline_uts`.
- `bukti_uts/`: laporan PDF dan tangkapan layar bukti pengerjaan.

## Cara menjalankan uts.sql

1. Nyalakan MySQL di XAMPP.
2. Buka DBeaver, hubungkan ke `localhost`, lalu buka skrip SQL baru.
3. Tempel isi `uts.sql`, lalu tekan Alt + X untuk menjalankan seluruh skrip.
4. Segarkan (F5) dan pastikan ada 4 tabel di `takoonline_uts`.

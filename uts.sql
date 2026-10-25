-- =====================================================================
-- EVALUASI MANDIRI: PEMODELAN FISIK (DDL) - TOKO ONLINE + KUPON DISKON
-- Database: takoonline_uts (MySQL / MariaDB)
-- Urutan: tabel induk dibuat lebih dulu, tabel anak sesudahnya.
-- Penambahan bisnis: tabel kupon, dan kolom id_kupon pada transaksi.
-- =====================================================================
CREATE DATABASE IF NOT EXISTS takoonline_uts
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;
USE takoonline_uts;

-- 1. pelanggan (induk)
CREATE TABLE pelanggan (
    id_pelanggan  INT AUTO_INCREMENT PRIMARY KEY,
    nama          VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL UNIQUE,
    negara        VARCHAR(50)  NOT NULL DEFAULT 'Indonesia'
);

-- 2. produk (induk)
CREATE TABLE produk (
    id_produk     INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk   VARCHAR(150) NOT NULL,
    kategori      VARCHAR(50)  NOT NULL,
    harga         DECIMAL(12,2) NOT NULL,
    jumlah_stok   INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_produk_harga CHECK (harga >= 0),
    CONSTRAINT chk_produk_stok  CHECK (jumlah_stok >= 0)
);

-- 3. kupon (induk) -- PENAMBAHAN BARU
CREATE TABLE kupon (
    id_kupon          INT AUTO_INCREMENT PRIMARY KEY,
    kode_kupon        VARCHAR(20)  NOT NULL UNIQUE,
    deskripsi         VARCHAR(150),
    persen_diskon     DECIMAL(5,2) NOT NULL,
    tanggal_mulai     DATE NOT NULL,
    tanggal_berakhir  DATE NOT NULL,
    kuota_pakai       INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_kupon_persen CHECK (persen_diskon > 0 AND persen_diskon <= 100),
    CONSTRAINT chk_kupon_periode CHECK (tanggal_berakhir >= tanggal_mulai),
    CONSTRAINT chk_kupon_kuota CHECK (kuota_pakai >= 0)
);

-- 4. transaksi (anak dari pelanggan, produk, dan kupon)
CREATE TABLE transaksi (
    id_transaksi       INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan       INT NOT NULL,
    id_produk          INT NOT NULL,
    id_kupon           INT NULL,
    tanggal_transaksi  DATE NOT NULL,
    jumlah             INT NOT NULL,
    total_harga        DECIMAL(12,2) NOT NULL,
    status             VARCHAR(20) NOT NULL DEFAULT 'Diproses',
    CONSTRAINT fk_transaksi_pelanggan
        FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    CONSTRAINT fk_transaksi_produk
        FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    CONSTRAINT fk_transaksi_kupon
        FOREIGN KEY (id_kupon) REFERENCES kupon(id_kupon) ON DELETE SET NULL,
    CONSTRAINT chk_transaksi_jumlah CHECK (jumlah > 0),
    CONSTRAINT chk_transaksi_total CHECK (total_harga >= 0),
    CONSTRAINT chk_transaksi_status
        CHECK (status IN ('Diproses', 'Dikirim', 'Selesai', 'Dibatalkan'))
);

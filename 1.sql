CREATE DATABASE IF NOT EXISTS takoonline;
USE takoonline;

CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama         VARCHAR(100) NOT NULL,
    email        VARCHAR(100) NOT NULL UNIQUE,
    negara       VARCHAR(50)
);

CREATE TABLE produk (
    id_produk    INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk  VARCHAR(150) NOT NULL,
    kategori     VARCHAR(50),
    harga        DECIMAL(12,2) NOT NULL,
    jumlah_stok  INT
);

CREATE TABLE transaksi (
    id_transaksi      INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan      INT NOT NULL,
    id_produk         INT NOT NULL,
    tanggal_transaksi DATE,
    jumlah            INT NOT NULL,
    total_harga       DECIMAL(12,2),
    status            VARCHAR(20),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk)    REFERENCES produk(id_produk)
);

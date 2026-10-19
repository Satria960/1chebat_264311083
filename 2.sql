USE takoonline;

INSERT INTO pelanggan (id_pelanggan, nama, email, negara) VALUES
(1, 'Nadia Susanto', 'nadia_susanto25@gmail.com', 'Indonesia'),
(2, 'Kartika Fauzi', 'kartika_fauzi46@gmail.com', 'Indonesia'),
(3, 'Stefani Nabila Marpaung', 'stefani_marpaung53@gmail.com', 'Indonesia');

INSERT INTO produk (id_produk, nama_produk, kategori, harga, jumlah_stok) VALUES
(1, 'Avoskin Serum Niacinamide 20ml Brightening', 'Beauty', 179900, 60),
(2, 'Avoskin Serum Niacinamide 20ml Oil Control', 'Beauty', 140000, 34),
(3, 'Avoskin Serum Niacinamide 20ml Sensitive Skin', 'Beauty', 154900, 740);

INSERT INTO transaksi (id_transaksi, id_pelanggan, id_produk, tanggal_transaksi, jumlah, total_harga, status) VALUES
(1, 1, 1, '2026-10-01', 2, 359800, 'Selesai'),
(2, 2, 2, '2026-10-05', 1, 140000, 'Dikirim'),
(3, 3, 3, '2026-10-10', 3, 464700, 'Selesai');

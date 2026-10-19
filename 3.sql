SELECT 'pelanggan' AS tabel, COUNT(*) AS jumlah FROM takoonline.pelanggan
UNION ALL SELECT 'produk', COUNT(*) FROM takoonline.produk
UNION ALL SELECT 'transaksi', COUNT(*) FROM takoonline.transaksi;

import 'package:flutter/material.dart';
import 'gambar_hp.dart';

class DetailHp extends StatelessWidget {
  final Map<String, String> produk;

  const DetailHp({super.key, required this.produk});

  void _tampilkanPesan(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(pesan)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produk['nama']!),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 220,
            child: GambarHp.tampil(produk['gambar']!),
          ),
          const SizedBox(height: 16),
          Text(
            produk['nama']!,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            produk['harga']!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Chip(label: Text('Kategori: ${produk['kategori']!}')),
              const SizedBox(width: 8),
              Chip(
                avatar: const Icon(Icons.star, color: Colors.amber, size: 18),
                label: Text('Rating ${produk['rating']!}'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Deskripsi Produk',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(produk['deskripsi']!),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Tambah ke Keranjang'),
            onPressed: () => _tampilkanPesan(
              context,
              '${produk['nama']!} ditambahkan ke keranjang',
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            icon: const Icon(Icons.favorite_border),
            label: const Text('Tambah ke Favorit'),
            onPressed: () => _tampilkanPesan(
              context,
              '${produk['nama']!} ditambahkan ke Favorit',
            ),
          ),
        ],
      ),
    );
  }
}
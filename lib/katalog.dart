import 'package:flutter/material.dart';
import 'detailproduk.dart';
import 'gambar_hp.dart';

class KatalogHp extends StatelessWidget {
  const KatalogHp({super.key});

  static const List<Map<String, String>> items = [
    {
      'nama': 'Samsung Galaxy S24',
      'kategori': 'Flagship',
      'harga': 'Rp 12.999.000',
      'rating': '4.8',
      'gambar': 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600',
      'deskripsi': 'Layar Dynamic AMOLED 6.2 inci, kamera AI 50MP, dan performa kencang untuk multitasking.',
    },
    {
      'nama': 'iPhone 15',
      'kategori': 'iOS',
      'harga': 'Rp 13.499.000',
      'rating': '4.9',
      'gambar': 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600',
      'deskripsi': 'Desain aluminium tangguh dengan Dynamic Island, chip A16 Bionic, dan kamera utama 48MP.',
    },
    {
      'nama': 'Xiaomi Redmi Note 13 Pro',
      'kategori': 'Mid-Range',
      'harga': 'Rp 3.799.000',
      'rating': '4.7',
      'gambar': 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600',
      'deskripsi': 'Layar AMOLED 120Hz, pengisian cepat 67W, dan baterai tahan lama untuk aktivitas harian.',
    },
    {
      'nama': 'Google Pixel 8a',
      'kategori': 'Android',
      'harga': 'Rp 7.999.000',
      'rating': '4.6',
      'gambar': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600',
      'deskripsi': 'Kamera komputasional khas Google dengan hasil foto tajam di berbagai kondisi cahaya.',
    },
    {
      'nama': 'OPPO Reno 11F 5G',
      'kategori': '5G',
      'harga': 'Rp 4.599.000',
      'rating': '4.5',
      'gambar': 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=600',
      'deskripsi': 'Bodi tipis ringan dengan dukungan konektivitas 5G dan layar jernih nyaman di mata.',
    },
  ];

  void _bukaDetail(BuildContext context, Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailHp(produk: item),
      ),
    );
  }

  Widget _judul(String teks, IconData ikon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
      child: Row(
        children: [
          Icon(ikon, color: Colors.indigo),
          const SizedBox(width: 8),
          Text(
            teks,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final kolomGrid = screenWidth >= 600 ? 3 : 2;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Jual HP'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _judul('Daftar HP', Icons.view_list),
          Expanded(
            flex: 4,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    onTap: () => _bukaDetail(context, item),
                    leading: GambarHp.tampil(item['gambar']!, size: 56),
                    title: Text(
                      item['nama']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('${item['harga']!} • ★ ${item['rating']!}'),
                    trailing: Chip(label: Text(item['kategori']!)),
                  ),
                );
              },
            ),
          ),
          _judul('Galeri HP', Icons.grid_view),
          Expanded(
            flex: 5,
            child: GridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisCount: kolomGrid,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
              children: List.generate(items.length, (index) {
                final item = items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => _bukaDetail(context, item),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Expanded(
                            child: GambarHp.tampil(item['gambar']!),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['nama']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item['harga']!,
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '★ ${item['rating']!}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'detailproduk.dart';

class Katalog extends StatelessWidget {
  const Katalog({super.key});

  // 1 & 3. Data Produk Jual HP + informasi 'rating'
  static const List<Map<String, String>> items = [
    {
      'nama': 'iPhone 15 Pro',
      'kategori': 'Flagship',
      'harga': 'Rp 18.999.000',
      'rating': '4.9',
      'gambar': 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500',
      'deskripsi': 'Chip A17 Pro, bodi titanium ringan, kamera Pro 48MP.',
    },
    {
      'nama': 'Samsung Galaxy S24',
      'kategori': 'Flagship',
      'harga': 'Rp 13.999.000',
      'rating': '4.8',
      'gambar': 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=500',
      'deskripsi': 'Layar Dynamic AMOLED 2X dengan fitur Galaxy AI cerdas.',
    },
    {
      'nama': 'Xiaomi 14T Pro',
      'kategori': 'Mid-Range',
      'harga': 'Rp 8.499.000',
      'rating': '4.7',
      'gambar': 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=500',
      'deskripsi': 'Lensa optik Leica Summilux dan pengisian daya 120W HyperCharge.',
    },
    {
      'nama': 'OPPO Reno 11 5G',
      'kategori': 'Mid-Range',
      'harga': 'Rp 5.999.000',
      'rating': '4.6',
      'gambar': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500',
      'deskripsi': 'Kamera portrait telefoto jernih dengan desain ultra tipis.',
    },
    {
      'nama': 'Vivo V30 5G',
      'kategori': 'Mid-Range',
      'harga': 'Rp 5.499.000',
      'rating': '4.6',
      'gambar': 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=500',
      'deskripsi': 'Aura Light Portrait untuk foto malam hari yang natural.',
    },
    {
      'nama': 'Redmi Note 13',
      'kategori': 'Entry-Level',
      'harga': 'Rp 2.499.000',
      'rating': '4.5',
      'gambar': 'https://images.unsplash.com/photo-1565849904461-04a58ad377e0?w=500',
      'deskripsi': 'Layar AMOLED 120Hz dan kamera utama 108MP yang tajam.',
    },
  ];

  // Widget pembantu judul
  Widget _judul(String teks, IconData ikon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Row(
        children: [
          Icon(ikon, color: Colors.indigo),
          const SizedBox(width: 8),
          Text(
            teks,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }

  // Widget pembantu gambar dari internet
  static Widget _gambar(String url, {double? size}) {
    return Image.network(
      url,
      width: size,
      height: size,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      },
      errorBuilder: (context, error, stack) =>
          const Icon(Icons.smartphone, size: 40, color: Colors.grey),
    );
  }

  // Navigasi ke halaman DetailProduk
  void _bukaDetail(BuildContext context, Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailProduk(produk: item),
      ),
    );
  }

  // 5. Fungsi menampilkan SnackBar Favorit
  void _tambahFavorit(BuildContext context, String namaProduk) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$namaProduk Ditambahkan ke Favorit'),
        backgroundColor: Colors.indigo,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text(
          'Jual HP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          // BAGIAN 1: DAFTAR PRODUK (LISTVIEW)
          _judul('Daftar HP Terbaru', Icons.list_alt),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () => _bukaDetail(context, item),
                    leading: _gambar(item['gambar']!, size: 55),
                    title: Text(
                      item['nama']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        Text(item['harga']!),
                        const SizedBox(width: 10),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(' ${item['rating']}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.pink),
                      onPressed: () => _tambahFavorit(context, item['nama']!),
                    ),
                  ),
                );
              },
            ),
          ),

          // BAGIAN 2: GALERI PRODUK RESPONSIF (GRIDVIEW)
          _judul('Galeri HP', Icons.grid_view),
          Expanded(
            // 4. LayoutBuilder untuk menentukan jumlah kolom responsif
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Jika lebar layar > 600px (layar lebar/tablet) = 3 kolom, ponsel = 2 kolom
                int jumlahKolom = constraints.maxWidth > 600 ? 3 : 2;

                return GridView.count(
                  crossAxisCount: jumlahKolom,
                  childAspectRatio: 0.85,
                  padding: const EdgeInsets.all(8),
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    return Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () => _bukaDetail(context, item),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Baris atas: Rating & Tombol Favorit
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: Colors.amber, size: 16),
                                      Text(
                                        item['rating']!,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () => _tambahFavorit(context, item['nama']!),
                                    child: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.pink,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: _gambar(item['gambar']!)),
                              const SizedBox(height: 6),
                              Text(
                                item['nama']!,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item['harga']!,
                                style: const TextStyle(color: Colors.indigo),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
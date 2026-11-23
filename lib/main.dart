import 'package:flutter/material.dart';
import 'katalog.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jual HP',
      // 2. Ubah warna utama aplikasi (Indigo)
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const Katalog(),
    ),
  );
}
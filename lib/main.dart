import 'package:flutter/material.dart';
import 'katalog.dart';

void main() {
  runApp(const JualHpApp());
}

class JualHpApp extends StatelessWidget {
  const JualHpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jual HP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const KatalogHp(),
    );
  }
}
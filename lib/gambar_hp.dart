import 'package:flutter/material.dart';

class GambarHp {
  static Widget tampil(String url, {double? size}) {
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
      errorBuilder: (context, error, stack) => const Icon(
        Icons.phone_android,
        size: 40,
        color: Colors.grey,
      ),
    );
  }
}
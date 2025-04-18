import 'package:flutter/material.dart';

/// Widget yang menampilkan judul halaman login.
/// 
/// Judul ini menggunakan teks "Weather Login" dengan gaya teks yang
/// telah ditentukan, seperti ukuran font, ketebalan, warna, dan jarak antar huruf.
class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Weather Login',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: Color(0xFF1A237E),
        letterSpacing: 1.2,
      ),
    );
  }
}

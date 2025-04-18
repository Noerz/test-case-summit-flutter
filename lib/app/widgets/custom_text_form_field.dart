import 'package:flutter/material.dart';

/// Widget input teks kustom dengan ikon dan validasi.
///
/// Properti:
/// - [controller]: Controller untuk mengelola teks yang dimasukkan.
/// - [hintText]: Teks petunjuk yang ditampilkan di dalam input.
/// - [icon]: Ikon yang ditampilkan di sebelah kiri input.
/// - [isPassword]: Menentukan apakah input digunakan untuk kata sandi (default: false).
/// - [validator]: Fungsi validasi untuk memvalidasi teks yang dimasukkan.
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validator;

  /// Membuat widget input teks kustom.
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.blueGrey.shade600),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
      ),
    );
  }
}

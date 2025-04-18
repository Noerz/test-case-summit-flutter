import 'package:flutter/material.dart';

/// Widget indikator loading yang menampilkan animasi dan teks.
///
/// Properti:
/// - [screenHeight]: Tinggi layar yang digunakan untuk menghitung jarak antar elemen.
class LoadingIndicator extends StatelessWidget {
  final double screenHeight;

  /// Membuat widget indikator loading.
  const LoadingIndicator({required this.screenHeight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.white),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Loading Weather Data...',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

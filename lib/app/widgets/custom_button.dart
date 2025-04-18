import 'package:flutter/material.dart';

/// Widget tombol kustom dengan berbagai opsi gaya dan animasi.
///
/// Properti:
/// - [text]: Teks yang akan ditampilkan pada tombol.
/// - [onPressed]: Fungsi callback yang akan dipanggil saat tombol ditekan.
/// - [width]: Lebar tombol (default: double.infinity).
/// - [height]: Tinggi tombol (default: 50.0).
/// - [backgroundColor]: Warna latar belakang tombol (default: Colors.blue).
/// - [textColor]: Warna teks pada tombol (default: Colors.white).
/// - [borderRadius]: Radius sudut tombol (default: 20.0).
/// - [fontSize]: Ukuran font teks pada tombol (default: 18.0).
/// - [isLoading]: Menentukan apakah tombol sedang dalam keadaan loading (default: false).
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final bool isLoading;

  /// Membuat widget tombol kustom.
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 20.0,
    this.fontSize = 18.0,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.2),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [backgroundColor.withOpacity(0.8), backgroundColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Container(
              alignment: Alignment.center,
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

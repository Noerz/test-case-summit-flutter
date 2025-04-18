import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

/// Widget [SplashLogo] adalah logo aplikasi yang muncul di layar splash.
/// Logo ini memiliki animasi perubahan opacity berdasarkan properti [logoVisible]
/// pada [SplashController].
class SplashLogo extends StatelessWidget {
  final double screenHeight;

  /// Parameter [screenHeight] digunakan untuk menyesuaikan ukuran layar.
  const SplashLogo({Key? key, required this.screenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Obx(
      () => AnimatedOpacity(
        opacity: controller.logoVisible.value ? 1.0 : 0.0, // Animasi opacity
        duration: const Duration(seconds: 2),
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Logo.png'), // Gambar logo
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

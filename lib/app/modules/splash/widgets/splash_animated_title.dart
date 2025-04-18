import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

/// Widget [SplashAnimatedTitle] adalah judul animasi yang muncul di layar splash.
/// Judul ini memiliki animasi slide dan opacity berdasarkan properti [titleVisible]
/// pada [SplashController].
class SplashAnimatedTitle extends StatelessWidget {
  const SplashAnimatedTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Obx(
      () => AnimatedSlide(
        duration: const Duration(milliseconds: 800),
        offset: controller.titleVisible.value ? Offset.zero : const Offset(0, 0.5), // Animasi slide
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: controller.titleVisible.value ? 1.0 : 0.0, // Animasi opacity
          child: const Text(
            'Weather\nApplication', // Teks judul
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              letterSpacing: 1.2,
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}

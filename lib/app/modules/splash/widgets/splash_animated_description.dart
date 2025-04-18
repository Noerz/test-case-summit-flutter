import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

/// Widget [SplashAnimatedDescription] adalah deskripsi animasi yang muncul di layar splash.
/// Deskripsi ini memiliki animasi perubahan opacity berdasarkan properti [descVisible]
/// pada [SplashController].
class SplashAnimatedDescription extends StatelessWidget {
  const SplashAnimatedDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Obx(
      () => AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: controller.descVisible.value ? 1.0 : 0.0, // Animasi opacity
        child: const Text(
          'Get to know your weather maps\nand radar perception forecast', // Teks deskripsi
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

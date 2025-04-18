import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/const/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../controllers/splash_controller.dart';

/// Widget [SplashSkipButton] adalah tombol "Skip" yang muncul di layar splash.
/// Tombol ini memiliki animasi posisi dan hanya muncul ketika properti [showSkip]
/// pada [SplashController] bernilai true.
class SplashSkipButton extends StatelessWidget {
  const SplashSkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        top: controller.showSkip.value ? 30 : -50,
        right: 30,
        child: CustomButton(
          text: 'Skip', // Teks pada tombol
          onPressed: controller.skip, // Fungsi yang dipanggil saat tombol ditekan
          width: 80,
          height: 40,
          backgroundColor: AppColors.splashSkipButton, // Warna latar tombol
          textColor: Colors.blueGrey.shade800, // Warna teks tombol
          borderRadius: 20,
          fontSize: 14,
        ),
      ),
    );
  }
}

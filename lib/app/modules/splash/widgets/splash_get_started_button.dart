import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/const/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../controllers/splash_controller.dart';

/// Widget [SplashGetStartedButton] adalah tombol "Get Started" yang muncul di layar splash.
/// Tombol ini memiliki animasi skala dan opacity berdasarkan properti [buttonVisible]
/// pada [SplashController].
class SplashGetStartedButton extends StatelessWidget {
  final double screenHeight;

  /// Parameter [screenHeight] digunakan untuk menyesuaikan ukuran tombol dengan layar.
  const SplashGetStartedButton({Key? key, required this.screenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Obx(
      () => AnimatedScale(
        duration: const Duration(milliseconds: 800),
        scale: controller.buttonVisible.value ? 1.0 : 0.8, // Animasi skala
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: controller.buttonVisible.value ? 1.0 : 0.0, // Animasi opacity
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Get Started', // Teks pada tombol
              onPressed: controller.goToNext, // Fungsi yang dipanggil saat tombol ditekan
              isLoading: controller.isLoading.value, // Indikator loading
              backgroundColor: AppColors.splashButtonColor, // Warna latar tombol
              borderRadius: 20,
              height: screenHeight * 0.07,
            ),
          ),
        ),
      ),
    );
  }
}

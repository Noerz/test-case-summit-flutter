import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/const/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../controllers/splash_controller.dart';

class SplashGetStartedButton extends StatelessWidget {
  final double screenHeight;

  const SplashGetStartedButton({Key? key, required this.screenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Obx(
      () => AnimatedScale(
        duration: const Duration(milliseconds: 800),
        scale: controller.buttonVisible.value ? 1.0 : 0.8,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: controller.buttonVisible.value ? 1.0 : 0.0,
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Get Started',
              onPressed: controller.goToNext,
              isLoading: controller.isLoading.value,
              backgroundColor: AppColors.splashButtonColor,
              borderRadius: 20,
              height: screenHeight * 0.07,
            ),
          ),
        ),
      ),
    );
  }
}

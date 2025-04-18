import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/const/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../controllers/splash_controller.dart';

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
          text: 'Skip',
          onPressed: controller.skip,
          width: 80,
          height: 40,
          backgroundColor: AppColors.splashSkipButton,
          textColor: Colors.blueGrey.shade800,
          borderRadius: 20,
          fontSize: 14,
        ),
      ),
    );
  }
}

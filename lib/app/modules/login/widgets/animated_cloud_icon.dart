import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';

class AnimatedCloudIcon extends StatelessWidget {
  final double screenWidth;
  final LoginController controller = Get.find();

  AnimatedCloudIcon({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        child: Container(
          key: ValueKey<bool>(controller.cloudAnim.value),
          width: screenWidth * 0.3,
          height: screenWidth * 0.3,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            Icons.cloud,
            size: screenWidth * 0.2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

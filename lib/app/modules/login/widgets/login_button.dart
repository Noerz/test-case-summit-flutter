import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/widgets/custom_button.dart';
import 'package:weather_app/app/core/const/app_colors.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final LoginController controller;
  final double screenHeight;

  const LoginButton({
    required this.formKey,
    required this.controller,
    required this.screenHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: controller.buttonScale.value,
        child: CustomButton(
          text: 'Sign In',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              controller.handleLogin();
            }
          },
          isLoading: controller.isLoading.value,
          backgroundColor: AppColors.loginButtonColor,
          textColor: Colors.white,
          borderRadius: 20,
          height: screenHeight * 0.07,
          width: double.infinity,
          fontSize: 18,
        ),
      ),
    );
  }
}

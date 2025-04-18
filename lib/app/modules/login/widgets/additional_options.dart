import 'package:flutter/material.dart';
import 'package:weather_app/app/core/const/app_colors.dart';

class AdditionalOptions extends StatelessWidget {
  const AdditionalOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(color: AppColors.loginButtonColor),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Create Account',
            style: TextStyle(color: AppColors.loginButtonColor),
          ),
        ),
      ],
    );
  }
}

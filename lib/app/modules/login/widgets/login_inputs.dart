import 'package:flutter/material.dart';
import 'package:weather_app/app/widgets/custom_text_form_field.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';

class LoginInputs extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginController controller;

  const LoginInputs({
    required this.emailController,
    required this.passwordController,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hintText: 'Email Address',
          icon: Icons.email_outlined,
          validator: controller.validateEmail,
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: passwordController,
          hintText: 'Password',
          icon: Icons.lock_outline,
          isPassword: true,
          validator: controller.validatePassword,
        ),
      ],
    );
  }
}

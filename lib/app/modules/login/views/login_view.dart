import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';
import 'package:weather_app/app/widgets/custom_text_form_field.dart';
import 'package:weather_app/app/constants/app_colors.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginView({super.key}); // Tambahkan GlobalKey

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox.expand( // Gunakan SizedBox.expand untuk memastikan ukuran penuh
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.loginGradientStart, AppColors.loginGradientEnd],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Form( // Bungkus dengan Form
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.1),

                      // Animated Cloud Icon
                      Obx(
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
                      ),

                      SizedBox(height: screenHeight * 0.05),

                      // Title
                      const Text(
                        'Weather Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A237E),
                          letterSpacing: 1.2,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.05),

                      // Email Input
                      CustomTextFormField(
                        controller: _emailController,
                        hintText: 'Email Address',
                        icon: Icons.email_outlined,
                        validator: controller.validateEmail, // Validasi
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      // Password Input
                      CustomTextFormField(
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                        validator: controller.validatePassword, // Validasi
                      ),

                      SizedBox(height: screenHeight * 0.04),

                      // Login Button
                      Obx(
                        () => AnimatedScale(
                          duration: const Duration(milliseconds: 300),
                          scale: controller.buttonScale.value,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.handleLogin();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.loginButtonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.025,
                                ),
                                elevation: 4,
                              ),
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      // Additional Options
                      Row(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';
import 'package:weather_app/app/widgets/custom_button.dart';
import 'package:weather_app/app/widgets/custom_text_form_field.dart';
import 'package:weather_app/app/core/const/app_colors.dart';
import 'package:weather_app/app/modules/login/widgets/animated_cloud_icon.dart';
import 'package:weather_app/app/modules/login/widgets/login_title.dart';
import 'package:weather_app/app/modules/login/widgets/login_inputs.dart';
import 'package:weather_app/app/modules/login/widgets/login_button.dart';
import 'package:weather_app/app/modules/login/widgets/additional_options.dart';

/* LoginView adalah halaman login aplikasi yang memungkinkan pengguna untuk masuk dengan email dan password.
 Halaman ini memiliki animasi ikon awan, input form, dan tombol login.*/
class LoginView extends GetView<LoginController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
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
              child: _buildForm(context),
            ),
          ),
        ),
      ),
    );
  }

  // _buildForm adalah metode privat yang membangun form login, termasuk input email, password, dan tombol login.
  Widget _buildForm(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.1),
            AnimatedCloudIcon(screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.05),
            const LoginTitle(),
            SizedBox(height: screenHeight * 0.05),
            LoginInputs(
              emailController: _emailController,
              passwordController: _passwordController,
              controller: controller,
            ),
            SizedBox(height: screenHeight * 0.04),
            LoginButton(
              formKey: _formKey,
              controller: controller,
              screenHeight: screenHeight,
            ),
            SizedBox(height: screenHeight * 0.03),
            const AdditionalOptions(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/const/app_colors.dart';
import '../controllers/splash_controller.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_animated_title.dart';
import '../widgets/splash_animated_description.dart';
import '../widgets/splash_get_started_button.dart';
import '../widgets/splash_skip_button.dart';

/*SplashView adalah halaman awal aplikasi yang menampilkan animasi logo, judul, deskripsi, 
dan tombol "Get Started". Halaman ini menggunakan GetX untuk mengontrol visibilitas elemen-elemen tersebut.*/
class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.splashGradientStart, AppColors.splashGradientEnd],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Stack(
            children: [
              _buildContent(context),
              const SplashSkipButton(),
            ],
          ),
        ),
      ),
    );
  }

  /* _buildContent adalah metode privat yang membangun konten utama halaman splash, termasuk logo, 
   animasi judul, deskripsi, dan tombol "Get Started".*/
  Widget _buildContent(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SplashLogo(screenHeight: screenHeight),
              SizedBox(height: screenHeight * 0.05),
              const SplashAnimatedTitle(),
              SizedBox(height: screenHeight * 0.03),
              const SplashAnimatedDescription(),
              SizedBox(height: screenHeight * 0.06),
              SplashGetStartedButton(screenHeight: screenHeight),
            ],
          ),
        ),
      ),
    );
  }
}

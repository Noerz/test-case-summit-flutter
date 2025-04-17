import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/constants/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
              // Konten utama di tengah layar
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                    ), // Adjusted padding
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Ikon atau ilustrasi dengan animasi
                        Obx(
                          () => AnimatedOpacity(
                            opacity: controller.logoVisible.value ? 1.0 : 0.0,
                            duration: const Duration(seconds: 2),
                            child: Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/Logo.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),

                        // Animated Title
                        Obx(
                          () => AnimatedSlide(
                            duration: const Duration(milliseconds: 800),
                            offset:
                                controller.titleVisible.value
                                    ? Offset.zero
                                    : const Offset(0, 0.5),
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 800),
                              opacity:
                                  controller.titleVisible.value ? 1.0 : 0.0,
                              child: const Text(
                                'Weather\nApplication',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  letterSpacing: 1.2,
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // Animated Description
                        Obx(
                          () => AnimatedOpacity(
                            duration: const Duration(milliseconds: 1000),
                            opacity: controller.descVisible.value ? 1.0 : 0.0,
                            child: const Text(
                              'Get to know your weather maps\nand radar perception forecast',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.06),

                        // Tombol Get Started
                        // Animated Button
                        Obx(
                          () => AnimatedScale(
                            duration: const Duration(milliseconds: 800),
                            scale: controller.buttonVisible.value ? 1.0 : 0.8,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 800),
                              opacity:
                                  controller.buttonVisible.value ? 1.0 : 0.0,
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: controller.goToNext,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.splashButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.025,
                                    ),
                                    elevation: 6,
                                    shadowColor: Colors.blue.withOpacity(0.3),
                                  ),
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child:
                                        controller.isLoading.value
                                            ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                            : Text(
                                              'Get Started',
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Tombol Skip di pojok kanan atas
              // Animated Skip Button
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: controller.showSkip.value ? 30 : -50,
                  right: 30,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: controller.skip,
                      hoverColor: Colors.white.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.splashSkipButton,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey.shade800,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

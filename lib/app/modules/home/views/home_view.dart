import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';
import 'package:weather_app/app/core/const/app_colors.dart';
import 'package:weather_app/app/routes/app_pages.dart';
import 'package:weather_app/app/widgets/custom_button.dart';
import '../widgets/custom_bottom_bar.dart';
import '../../../widgets/loading_indicator.dart';
import '../widgets/error_widget_section.dart';
import '../widgets/top_bar.dart';
import '../widgets/location_info.dart';
import '../widgets/rain_chance_text.dart';
import '../widgets/temperature_section.dart';
import '../widgets/hourly_forecast_section.dart';

/*HomeView adalah halaman utama aplikasi yang menampilkan informasi cuaca, termasuk lokasi, 
peluang hujan, suhu, dan prakiraan cuaca per jam.*/
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      bottomNavigationBar: CustomBottomBar(
        controller: controller,
        onLogout: () {
          controller.clearWeatherData();
          Get.offAllNamed(Routes.LOGIN);
        },
      ),
      body: Obx(() => _buildBody(screenHeight, screenWidth)),
    );
  }

  // _buildBody adalah metode yang membangun konten utama halaman berdasarkan status loading dan data cuaca.
  Widget _buildBody(double screenHeight, double screenWidth) {
    if (controller.isLoading.value) {
      return LoadingIndicator(screenHeight: screenHeight);
    }

    final weather = controller.weatherData.value;
    if (weather == null) {
      return _buildErrorSection(screenHeight, screenWidth);
    }

    return _buildWeatherContent(screenHeight, screenWidth, weather);
  }

  // _buildErrorSection menampilkan pesan error jika data cuaca tidak tersedia.
  Widget _buildErrorSection(double screenHeight, double screenWidth) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off,
              size: screenHeight * 0.2,
              color: Colors.grey,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Data cuaca tidak tersedia',
              style: TextStyle(
                fontSize: screenHeight * 0.025,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.03),
            CustomButton(
              text: 'Coba Lagi',
              onPressed: () => controller.fetchWeatherByCity('Depok'),
              backgroundColor: AppColors.splashButtonColor,
              textColor: Colors.white,
              borderRadius: 20,
              height: screenHeight * 0.07,
              width: screenWidth * 0.5,
              fontSize: screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  // _buildWeatherContent menampilkan informasi cuaca jika data tersedia.
  Widget _buildWeatherContent(double screenHeight, double screenWidth, dynamic weather) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1,
          vertical: screenHeight * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBar(controller: controller),
              SizedBox(height: screenHeight * 0.02),
              LocationInfo(weather: weather),
              SizedBox(height: screenHeight * 0.015),
              RainChanceText(weather: weather),
              SizedBox(height: screenHeight * 0.03),
              TemperatureSection(
                weather: weather,
                screenHeight: screenHeight,
                controller: controller,
              ),
              SizedBox(height: screenHeight * 0.08),
              HourlyForecastSection(),
            ],
          ),
        ),
      ),
    );
  }
}

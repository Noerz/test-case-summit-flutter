import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/data/repositories/weather_repository.dart';
import 'package:weather_app/app/data/models/weather_model.dart';
import 'package:weather_app/app/core/utils/location_service.dart';

class HomeController extends GetxController {
  final WeatherRepository _weatherRepository = Get.find<WeatherRepository>();
  final LocationService _locationService = LocationService(); // Add LocationService instance

  final count = 0.obs;
  final weatherData = Rxn<Weather>(); // Update type to Weather
  final isLoading = false.obs; // To track loading state

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String getIconUrl() {
    if (weatherData.value?.weather.isNotEmpty ?? false) {
      return 'https://openweathermap.org/img/wn/${weatherData.value!.weather[0].icon}@2x.png';
    }
    return ''; // Return empty string if weather list is empty
  }

  Future<void> fetchWeatherByCity(String city) async {
    isLoading.value = true;
    try {
      final data = await _weatherRepository.getWeatherByCity(
        city,
      ); // Fetch raw data from API
      print('API Response: $data'); // Debug log for API response
      weatherData.value = Weather.fromJson(
        data,
      ); // Use fromJson method for mapping
      print(
        'Parsed Weather Data: ${weatherData.value}',
      ); // Debug log for parsed data
    } catch (e) {
      print('Error fetching weather: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<Position> getDeviceLocation(BuildContext context) async {
    return await _locationService.getCurrentLocation(context);
  }

  Future<void> fetchWeatherByCoordinates(double lat, double lon) async {
    isLoading.value = true;
    try {
      final data = await _weatherRepository.getWeatherByCoordinates(lat, lon);
      print('API Response: $data'); // Debug log for API response
      weatherData.value = Weather.fromJson(data); // Use fromJson method for mapping
      print('Parsed Weather Data: ${weatherData.value}'); // Debug log for parsed data
    } catch (e) {
      print('Error fetching weather: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

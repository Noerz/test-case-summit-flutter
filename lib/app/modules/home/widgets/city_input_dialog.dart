import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

class CityInputDialog extends StatelessWidget {
  final HomeController controller;

  const CityInputDialog({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter City Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: 'City Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      final cityName = cityController.text.trim();
                      if (cityName.isEmpty) {
                        Get.snackbar(
                          'Invalid Input',
                          'City name cannot be empty. Please enter a valid city name.',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }

                      try {
                        controller.fetchWeatherByCity(cityName);
                        print('Fetching weather for city: $cityName'); // Debug log for city name
                        Navigator.of(context).pop();
                      } catch (e) {
                        Get.snackbar(
                          'Error',
                          'Failed to fetch weather data: $e',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Search'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

class CustomBottomBar extends StatelessWidget {
  final VoidCallback onLogout;
  final HomeController controller;

  const CustomBottomBar({required this.onLogout, Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBottomBarIcon(Icons.home, () {}),
          _buildBottomBarIcon(Icons.search, () => _showCityInputDialog(context)),
          _buildBottomBarIcon(Icons.logout, onLogout),
        ],
      ),
    );
  }

  Widget _buildBottomBarIcon(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white70, size: 28),
    );
  }

  void _showCityInputDialog(BuildContext context) {
    final TextEditingController cityController = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Enter City Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      hintText: 'City Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          final cityName = cityController.text.trim();
                          if (cityName.isNotEmpty) {
                            controller.fetchWeatherByCity(cityName);
                          }
                          Navigator.of(context).pop();
                        },
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

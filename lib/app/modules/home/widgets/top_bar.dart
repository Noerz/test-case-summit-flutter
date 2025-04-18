import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

class TopBar extends StatelessWidget {
  final HomeController controller;

  const TopBar({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang !',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              '${TimeOfDay.now().format(context)}',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.gps_fixed, color: Colors.white),
          onPressed: () async {
            try {
              final position = await controller.getDeviceLocation(context);
              await controller.fetchWeatherByCoordinates(
                position.latitude,
                position.longitude,
              );
            } catch (e) {
              Get.snackbar(
                'Error',
                'Failed to get location: $e',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
        ),
      ],
    );
  }
}

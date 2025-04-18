import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';
import 'package:weather_app/app/modules/home/widgets/city_input_dialog.dart';

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
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CityInputDialog(controller: controller),
    );
  }
}

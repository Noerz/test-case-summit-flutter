import 'package:flutter/material.dart';

class LocationInfo extends StatelessWidget {
  final dynamic weather;

  const LocationInfo({required this.weather, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      weather.name,
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.1,
      ),
      textAlign: TextAlign.center,
    );
  }
}

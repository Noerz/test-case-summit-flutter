import 'package:flutter/material.dart';

class RainChanceText extends StatelessWidget {
  final dynamic weather;

  const RainChanceText({required this.weather, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rainChance = weather.rain?.the1H != null
        ? (weather.rain!.the1H * 100).toStringAsFixed(0)
        : '0';
    return Text(
      'Chance of Rain: $rainChance%',
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

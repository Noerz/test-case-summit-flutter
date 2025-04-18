import 'package:flutter/material.dart';
import 'package:weather_app/app/data/models/weather_model.dart';

class RainChanceText extends StatelessWidget {
  final dynamic weather;

  const RainChanceText({required this.weather, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String estimateRainChance(Weather weather) {
      if (weather.rain?.the1H != null && weather.rain!.the1H! > 1.0) {
        return "90%";
      } else if (weather.rain?.the1H != null && weather.rain!.the1H! > 0.1) {
        return "60%";
      } else if (weather.weather.first.main.toLowerCase().contains("rain")) {
        return "30%";
      } else {
        return "0%";
      }
    }

    return Text(
      'Chance of Rain: ${estimateRainChance(weather)}',
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

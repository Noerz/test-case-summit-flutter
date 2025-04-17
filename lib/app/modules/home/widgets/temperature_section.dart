import 'package:flutter/material.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

class TemperatureSection extends StatelessWidget {
  final dynamic weather;
  final double screenHeight;
  final HomeController controller;

  const TemperatureSection({
    required this.weather,
    required this.screenHeight,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${weather.main.temp.toInt()}',
                  style: TextStyle(
                    fontSize: screenHeight * 0.2,
                    fontWeight: FontWeight.w800,
                    color: Colors.white.withOpacity(0.9),
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
                Text(
                  '°',
                  style: TextStyle(
                    fontSize: screenHeight * 0.08,
                    fontWeight: FontWeight.w800,
                    color: Colors.white.withOpacity(0.9),
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: screenHeight * -0.08,
          left: screenHeight * -0.1,
          child: Image.network(
            controller.getIconUrl(),
            width: screenHeight * 0.4,
            height: screenHeight * 0.3,
            fit: BoxFit.contain,
            opacity: const AlwaysStoppedAnimation(1),
          ),
        ),
      ],
    );
  }
}

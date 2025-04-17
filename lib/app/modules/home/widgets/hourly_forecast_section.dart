import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class HourlyForecastSection extends StatelessWidget {
  const HourlyForecastSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final times = ['2:00 AM', '4:00 AM', '8:00 AM'];
    final temps = [32, 30, 29];
    final icons = [
      WeatherIcons.day_cloudy,
      WeatherIcons.thunderstorm,
      WeatherIcons.day_cloudy_high,
    ];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: times.length,
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemBuilder: (context, index) {
          return HourlyForecastItem(
            time: times[index],
            temp: temps[index],
            icon: icons[index],
          );
        },
      ),
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final int temp;
  final IconData icon;

  const HourlyForecastItem({
    required this.time,
    required this.temp,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 8),
          Text(
            '$temp°',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

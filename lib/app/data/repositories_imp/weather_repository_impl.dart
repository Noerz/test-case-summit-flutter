import 'package:dio/dio.dart';
import 'package:weather_app/app/core/const/endpoints.dart';
import 'package:weather_app/app/data/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final Dio client;
  WeatherRepositoryImpl({required this.client});

  @override
  Future<Map<String, dynamic>> getWeatherByCity(String city) async { // Fixed method name
    const String apiKey =
        '0c84ddef01b14a37bbef19dd3be6a4b0'; // Replace with your OpenWeatherMap API key
    try {
      final response = await client.get(
        Endpoints.weather,
        options: Options(headers: {'Content-Type': 'application/json'}),
        queryParameters: {'q': city, 'appid': apiKey, 'units': 'metric'},
      );
      if (response.statusCode == 200) {
        return response.data; // Return the response data
      } else if (response.statusCode == 404) {
        throw Exception('City not found: $city');
      } else {
        throw Exception('Failed to fetch weather data: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data for city "$city": $e');
    }
  }

  Future<Map<String, dynamic>> getWeatherByCoordinates(double lat, double lon) async {
    const String apiKey =
        '0c84ddef01b14a37bbef19dd3be6a4b0'; // Replace with your OpenWeatherMap API key
    try {
      final response = await client.get(
        Endpoints.weather,
        options: Options(headers: {'Content-Type': 'application/json'}),
        queryParameters: {'lat': lat, 'lon': lon, 'appid': apiKey, 'units': 'metric'},
      );
      if (response.statusCode == 200) {
        return response.data; // Return the response data
      } else if (response.statusCode == 404) {
        throw Exception('Coordinates not found: lat=$lat, lon=$lon');
      } else {
        throw Exception('Failed to fetch weather data: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data for coordinates (lat=$lat, lon=$lon): $e');
    }
  }
}

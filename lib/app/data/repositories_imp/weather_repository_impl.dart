import 'package:dio/dio.dart';
import 'package:weather_app/app/core/const/endpoints.dart';
import 'package:weather_app/app/data/repositories/weather_repository.dart';

/// Implementasi dari [WeatherRepository] untuk mengambil data cuaca.
/// Menggunakan library Dio untuk melakukan permintaan HTTP.
class WeatherRepositoryImpl extends WeatherRepository {
  final Dio client;

  /// Konstruktor untuk [WeatherRepositoryImpl].
  /// [client] adalah instance Dio yang digunakan untuk melakukan permintaan HTTP.
  WeatherRepositoryImpl({required this.client});

  /// Mengambil data cuaca berdasarkan nama kota.
  /// [city] adalah nama kota yang ingin dicari datanya.
  @override
  Future<Map<String, dynamic>> getWeatherByCity(String city) async {
    const String apiKey =
        '0c84ddef01b14a37bbef19dd3be6a4b0'; // Ganti dengan API key OpenWeatherMap Anda
    try {
      final response = await client.get(
        Endpoints.weather,
        options: Options(headers: {'Content-Type': 'application/json'}),
        queryParameters: {'q': city, 'appid': apiKey, 'units': 'metric'},
      );
      if (response.statusCode == 200) {
        return response.data; // Mengembalikan data respons
      } else if (response.statusCode == 404) {
        throw Exception('Kota tidak ditemukan: $city');
      } else {
        throw Exception('Gagal mengambil data cuaca: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Gagal mengambil data cuaca untuk kota "$city": $e');
    }
  }

  /// Mengambil data cuaca berdasarkan koordinat geografis.
  /// [lat] adalah lintang, dan [lon] adalah bujur lokasi yang ingin dicari datanya.
  Future<Map<String, dynamic>> getWeatherByCoordinates(double lat, double lon) async {
    const String apiKey =
        '0c84ddef01b14a37bbef19dd3be6a4b0'; // Ganti dengan API key OpenWeatherMap Anda
    try {
      final response = await client.get(
        Endpoints.weather,
        options: Options(headers: {'Content-Type': 'application/json'}),
        queryParameters: {'lat': lat, 'lon': lon, 'appid': apiKey, 'units': 'metric'},
      );
      if (response.statusCode == 200) {
        return response.data; // Mengembalikan data respons
      } else if (response.statusCode == 404) {
        throw Exception('Koordinat tidak ditemukan: lat=$lat, lon=$lon');
      } else {
        throw Exception('Gagal mengambil data cuaca: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Gagal mengambil data cuaca untuk koordinat (lat=$lat, lon=$lon): $e');
    }
  }
}

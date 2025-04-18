/// Abstraksi untuk repositori cuaca.
/// Digunakan untuk mendefinisikan metode yang harus diimplementasikan oleh kelas turunan.
abstract class WeatherRepository {
  /// Mengambil data cuaca berdasarkan nama kota.
  Future<Map<String, dynamic>> getWeatherByCity(String city);

  /// Mengambil data cuaca berdasarkan koordinat geografis.
  /// [lat] adalah lintang, dan [lon] adalah bujur lokasi yang ingin dicari datanya.
  Future<Map<String, dynamic>> getWeatherByCoordinates(double lat, double lon);
}

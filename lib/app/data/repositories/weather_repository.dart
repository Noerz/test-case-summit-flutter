abstract class WeatherRepository {
  Future<Map<String, dynamic>> getWeatherByCity(String city); // Fixed method name
  Future<Map<String, dynamic>> getWeatherByCoordinates(double lat, double lon);
  // Future<List<WeatherModel>> getWeatherList(List<String> cities);
}

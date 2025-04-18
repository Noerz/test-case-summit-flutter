import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/utils/dio_utils.dart';
import 'package:weather_app/app/data/repositories/weather_repository.dart';
import 'package:weather_app/app/data/repositories_imp/weather_repository_impl.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';
import 'package:weather_app/app/modules/splash/controllers/splash_controller.dart';

/// Kelas `InitialBindings` digunakan untuk mengatur dependensi awal aplikasi.
class InitialBindings extends Bindings {
  /// Fungsi `dependencies` digunakan untuk mendaftarkan semua dependensi yang diperlukan
  /// oleh aplikasi menggunakan GetX Dependency Injection.
  @override
  void dependencies() async {
    // Inisialisasi dan daftarkan instance Dio dengan base URL dari environment.
    Get.put<Dio>(
      DioUtils.initDio(
        dotenv.env['BASE_URL'] ?? const String.fromEnvironment('BASE_URL'),
      ),
      permanent: true,
    );

    // Daftarkan repository cuaca.
    Get.put<WeatherRepository>(WeatherRepositoryImpl(client: Get.find<Dio>()));

    // Catatan: Controller lainnya dapat didaftarkan di sini jika diperlukan.
    // Get.put(SplashController(), permanent: true);
    // Get.put(LoginController(), permanent: true);
    // Get.put(HomeController(), permanent: true);
  }
}

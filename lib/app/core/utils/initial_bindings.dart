import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/utils/dio_utils.dart';
import 'package:weather_app/app/data/repositories/weather_repository.dart';
import 'package:weather_app/app/data/repositories_imp/weather_repository_impl.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';
import 'package:weather_app/app/modules/login/controllers/login_controller.dart';
import 'package:weather_app/app/modules/splash/controllers/splash_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put<Dio>(
      DioUtils.initDio(
        dotenv.env['BASE_URL'] ?? const String.fromEnvironment('BASE_URL'),
      ),
      permanent: true,
    );
    Get.put<WeatherRepository>(WeatherRepositoryImpl(client: Get.find<Dio>()));
    Get.put(SplashController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}

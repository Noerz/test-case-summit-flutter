import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

/// Kelas untuk mengatur rute aplikasi.
/// - Menyediakan rute awal dan daftar rute yang tersedia.
class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH; // Rute awal aplikasi

  /// Daftar rute aplikasi.
  /// - Setiap rute memiliki nama, halaman, dan binding.
  static final routes = [
    GetPage(
      name: _Paths.HOME, // Nama rute
      page: () => HomeView(), // Halaman yang ditampilkan
      binding: HomeBinding(), // Binding untuk halaman ini
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}

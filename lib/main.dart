import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/core/utils/initial_bindings.dart';

import 'app/routes/app_pages.dart';

/// Fungsi utama aplikasi.
/// - Memastikan widget binding telah diinisialisasi.
/// - Memuat file konfigurasi `.env`.
/// - Menjalankan aplikasi Flutter.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

/// Widget utama aplikasi.
/// - Menggunakan `GetMaterialApp` untuk mendukung navigasi dan state management.
/// - Menentukan tema aplikasi dan rute awal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App", // Judul aplikasi
      initialBinding: InitialBindings(), // Binding awal untuk dependency injection
      initialRoute: AppPages.INITIAL, // Rute awal aplikasi
      getPages: AppPages.routes, // Daftar rute aplikasi

      // Menentukan mode tema aplikasi
      themeMode:
          ThemeMode.system, // Menyesuaikan dengan mode perangkat (light/dark)
    );
  }
}

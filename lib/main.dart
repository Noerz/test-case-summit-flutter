import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/core/utils/initial_bindings.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Presensi School",
      initialBinding: InitialBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      // // Implementasi deteksi theme mode pada perangkat
      // theme: AppTheme.lightAppTheme, // Theme untuk mode terang
      // darkTheme: AppTheme.darkAppTheme, // Theme untuk mode gelap
      themeMode:
          ThemeMode.system, // Menyesuaikan dengan mode perangkat (light/dark)
    );
  }
}

import 'package:get/get.dart';
import 'package:weather_app/app/routes/app_pages.dart';

/*LoginController adalah controller untuk halaman LoginView. 
 Controller ini mengatur animasi ikon awan, validasi input, dan proses login.*/
class LoginController extends GetxController {
  final cloudAnim = false.obs;
  final buttonScale = 1.0.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    startCloudAnimation();
  }

  void startCloudAnimation() {
    cloudAnim.value = true;
  }

  // handleLogin menangani proses login, termasuk animasi tombol dan navigasi ke halaman Home.
  void handleLogin() async {
    isLoading.value = true;
    buttonScale.value = 0.95;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    buttonScale.value = 1.0;
    Get.offAllNamed(Routes.HOME);
  }

  // validateEmail dan validatePassword adalah metode untuk memvalidasi input email dan password.
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}

import 'package:get/get.dart';
import 'package:weather_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final logoVisible = false.obs;
  final titleVisible = false.obs;
  final descVisible = false.obs;
  final buttonVisible = false.obs;
  final showSkip = true.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimations();
  }

  void startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    logoVisible.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    titleVisible.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    descVisible.value = true;
    await Future.delayed(const Duration(milliseconds: 200));
    buttonVisible.value = true;
  }

  void goToNext() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offAllNamed(Routes.HOME);
  }

  void skip() {
    showSkip.value = false;
    print("Perintah skip dijalankan");
  }
}
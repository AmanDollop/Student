import 'dart:async';

import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SocialLoginController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () => clickOnGoogleButton());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void clickOnGoogleButton() {
    Get.offNamed(Routes.LOGIN);
  }
}

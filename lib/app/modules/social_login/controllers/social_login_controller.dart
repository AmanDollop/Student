import 'dart:async';

import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SocialLoginController extends GetxController {
  final count = 0.obs;

  final userToken = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // await CommonMethods.setString(key: 'userToken',value: '');
    userToken.value = await CommonMethods.getString(key: 'userToken')??'';
    // print('user:::::::::::::::::::   $userToken');
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
    if(userToken.value != '' && userToken.value.isNotEmpty){
      Get.offNamed(Routes.HOME);
    }else{
      Get.offNamed(Routes.LOGIN);
    }
  }
}

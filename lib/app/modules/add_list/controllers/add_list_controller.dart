import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddListController extends GetxController {

  final count = 0.obs;
  final addClassController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
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

  void clickOnAddClassButton() {
    if(key.currentState!.validate()){
      Get.back();
    }
  }
}

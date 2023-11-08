import 'dart:convert';

import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddListController extends GetxController {

  final count = 0.obs;
  // final id = ''.obs;
  final addClassController = TextEditingController();
  final key = GlobalKey<FormState>();

  Map<String, dynamic> bodyParamsForRegistrationApi = {};
  Map<String, dynamic> apiResponseMap = {};
  final checkApiResponseValue = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // id.value = await CommonMethods.getString(key: 'id') ?? '';
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

  Future<void> clickOnAddClassButton() async {
    if(key.currentState!.validate()){
      checkApiResponseValue.value = true;
      await addClassApiCalling();
    }
  }

  Future<void> addClassApiCalling() async {
    try {
      checkApiResponseValue.value = true;
      bodyParamsForRegistrationApi = {
        'className': addClassController.text.trim().toString(),
        // 'teacherId':id.value.toString()
      };
      http.Response? response = await ApiIntegration.addClassApi(bodyParams: bodyParamsForRegistrationApi, context: Get.context!);
      if (response != null && response.statusCode==200) {
        print('response.statusCode::::::::::::::   ${response.statusCode}');
        apiResponseMap = jsonDecode(response.body);
        Get.back();
      } else {
        checkApiResponseValue.value = false;
      }
    } catch (e) {
      checkApiResponseValue.value = false;
    }
  }

}

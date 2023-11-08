import 'dart:convert';

import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/my_http/my_http.dart';
import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {

  final count = 0.obs;
  final key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final subjectController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Map<String, dynamic> bodyParamsForRegistrationApi = {};
  Map<String, dynamic> apiResponseMap = {};
  final checkApiResponseValue = false.obs;

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

  Future<void> clickOnLogInButton() async {
    if(key.currentState!.validate()){

      await registrationApiCalling();
    }
  }

  Future<void> registrationApiCalling() async {
    try {
      checkApiResponseValue.value = true;
      bodyParamsForRegistrationApi = {
        'teacherName': nameController.text.trim().toString(),
        'email': emailController.text.trim().toString(),
        'password': passwordController.text.trim().toString(),
        'mobileNumber': mobileNumberController.text.trim().toString(),
        'subjectName': subjectController.text.trim().toString(),
      };
      http.Response? response = await ApiIntegration.registrationApi(bodyParams: bodyParamsForRegistrationApi, context: Get.context!);
      if (response != null && response.statusCode==200) {
        apiResponseMap = jsonDecode(response.body);

        if(apiResponseMap["auth"] != null ){
          await CommonMethods.setString(key: 'userToken', value: apiResponseMap["auth"].toString());
          await CommonMethods.setString(key: 'teacherName', value: apiResponseMap['teacherData']["teacherName"].toString());
          await CommonMethods.setString(key: 'email', value: apiResponseMap['teacherData']["email"].toString());
          await CommonMethods.setString(key: 'mobileNumber', value: apiResponseMap['teacherData']["mobileNumber"].toString());
          await CommonMethods.setString(key: 'subjectName', value: apiResponseMap['teacherData']["subjectName"].toString());
          Get.offAllNamed(Routes.HOME);
        }else{
          checkApiResponseValue.value = false;
        }

      } else {
          checkApiResponseValue.value = false;
      }
    } catch (e) {
        checkApiResponseValue.value = false;
    }
  }



}

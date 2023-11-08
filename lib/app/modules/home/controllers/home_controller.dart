import 'dart:io';

import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/class_model.dart';
import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final count = 0.obs;

  // final id = ''.obs;

  final classModel = Rxn<ClassModel>();
  List<ClassData>? classData;
  Map<String, dynamic> queryParametersForClass = {};

  final inAsyncCall = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    // id.value = await CommonMethods.getString(key: 'id') ?? '';
    // print('id::::::::::::::::   $id');
    await getClassApi();
    inAsyncCall.value = false;
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

  Future<void> clickOnProfile() async {
    await Get.toNamed(Routes.PROFILE);
    onInit();
  }

  willPop() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CommonDialog.commonAlertDialogBox(
          leftButtonOnPressed: () {
            Navigator.pop(context);
          },
          rightButtonOnPressed: () {
            exit(0);
          },
          title: 'Close App',
          content: "Are you sure you want to exit the application",
          leftButtonTitle: 'Cancel',
          rightButtonTitle: 'Exit',
          context: context,
        );
      },
    );
  }

  Future<void> clickOnClass({required int index}) async {
    await Get.toNamed(Routes.STUDENT_LIST,arguments: [classData?[index].classId]);
    onInit();
  }

  Future<void> clickOnAddClass() async {
    await Get.toNamed(Routes.ADD_LIST);
    onInit();
  }

  Future<void> getClassApi() async {
    try {
      classModel.value = await ApiIntegration.getClassListApi(context: Get.context!,);
      if (classModel.value != null) {
        classData = classModel.value?.classData;
        inAsyncCall.value=false;
      }
    } catch (e) {
      inAsyncCall.value=false;
      print('ApiError::::   $e');
    }
  }




}

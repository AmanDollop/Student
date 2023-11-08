import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/student_model.dart';
import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class StudentListController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = true.obs;
  String? classId;
  final studentModel = Rxn<StudentModel>();
  List<StudentData>? studentData;
  Map<String, dynamic> queryParametersForClass = {};
  final attendance=true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    classId = Get.arguments[0];
    await getStudentApi();
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

  Future<void> clickOnStudent({required int index}) async {
    await Get.toNamed(Routes.STUDENT_DETAILS, arguments: [studentData?[index].studentId]);
    onInit();
  }

  Future<void> clickOnStartAttendanceButton() async {
    await Get.toNamed(Routes.START_ATTENDANCE, arguments: [classId]);
    onInit();
  }

  Future<void> clickOnAddStudentButton() async {
    await Get.toNamed(Routes.ADD_STUDENT_LIST, arguments: [classId]);
    onInit();
  }

  Future<void> getStudentApi() async {
    try {
      studentModel.value = await ApiIntegration.getStudentListApi(
          context: Get.context!,
          queryParameters: {
            'classId': classId.toString(),
          });
      if (studentModel.value != null) {
        studentData = studentModel.value?.studentData;
        attendance.value = studentModel.value?.isAtendanceRemaining??true;
        inAsyncCall.value = false;
      }
    } catch (e) {
      inAsyncCall.value = false;
      if (kDebugMode) {
        print('ApiError:  :::   $e');
      }
    }
  }
}

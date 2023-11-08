import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/student_detail_model.dart';
import 'package:get/get.dart';

class StudentDetailsController extends GetxController {
  final count = 0.obs;

  DateTime? dateTime;
  List attendType = ["P", "A"];

  final inAsyncCall = true.obs;

  String? studentId;

  final studentDetailModel = Rxn<StudentDetailModel>();
  List<AttendanceData>? attendanceData;
  AttendanceData? attendanceDataDate;
  Map<String, dynamic> queryParametersForClass = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    studentId = Get.arguments[0];
    print('studentId:::::::::   $studentId');
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

  Future<void> getStudentApi() async {
    try {
      studentDetailModel.value = await ApiIntegration.getStudentDetailApi(
          context: Get.context!,
          queryParameters: {
            'studentId': studentId.toString(),
          });
      if (studentDetailModel.value != null) {
        attendanceData = studentDetailModel.value?.attendanceData;

        inAsyncCall.value = false;
      }
    } catch (e) {
      inAsyncCall.value = false;
      print('ApiError:  :::   $e');
    }
  }
}

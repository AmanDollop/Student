import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/student_model.dart';
import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:get/get.dart';

class StudentListController extends GetxController {

  final count = 0.obs;
  final inAsyncCall =true.obs;
  String? classId;
  final studentModel = Rxn<StudentModel>();
  List<StudentData>? studentData;
  Map<String, dynamic> queryParametersForClass = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    classId = Get.arguments[0];
    print('classId::::  ${classId}');
    await getStudentApi();
    inAsyncCall.value=false;
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

  void clickOnStudent({required int index}) {
    Get.toNamed(Routes.STUDENT_DETAILS);}

  void clickOnStartAttendanceButton() {
    Get.toNamed(Routes.START_ATTENDANCE,arguments: [classId]);
  }

  Future<void> clickOnAddStudentButton() async {
    print('classId  :Student::::::::::::   $classId');
    await Get.toNamed(Routes.ADD_STUDENT_LIST,arguments: [classId]);
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
        inAsyncCall.value=false;
        print('studentsList::::   $studentData');
      }
    } catch (e) {
      inAsyncCall.value=false;
      print('ApiError:  :::   $e');
    }
  }

}

import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/class_model.dart';
import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:get/get.dart';

class StudentListController extends GetxController {

  final count = 0.obs;
  int? classId;
  final classModel = Rxn<ClassModel>();
  List<Data>? data;
  List<Students>? students;
  Map<String, dynamic> queryParametersForClass = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    classId= Get.arguments[0];
    print('classId::::::   $classId');
    await getStudentApi();
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
    Get.toNamed(Routes.START_ATTENDANCE);
  }

  void clickOnAddStudentButton() {
    Get.toNamed(Routes.ADD_STUDENT_LIST,arguments: classId);
  }

  Future<void> getStudentApi() async {
    try {
      classModel.value = await ApiIntegration.getStudentListApi(
          context: Get.context!,
          queryParameters: {
            'classId': classId.toString(),
          });
      if (classModel.value != null) {
        data = classModel.value?.data;
        print('data::::   $data');
        data?.forEach((element) {
         /* if(classId == element.classId){
            students?.addAll(element.students??[]);
            print('students:::::::::::::::   ${students?.length}');
          }else{
            students?.addAll(element.students??[]);
          }*/
          students?.addAll(element.students??[]);
        });
      }
    } catch (e) {
      print('ApiError:  :::   $e');
    }
  }

}

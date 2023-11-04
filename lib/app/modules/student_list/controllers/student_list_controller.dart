import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:get/get.dart';

class StudentListController extends GetxController {

  final count = 0.obs;

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

  void clickOnStudent({required int index}) {
    Get.toNamed(Routes.STUDENT_DETAILS);}

  void clickOnStartAttendanceButton() {
    Get.toNamed(Routes.START_ATTENDANCE);
  }

  void clickOnAddStudentButton() {
    Get.toNamed(Routes.ADD_STUDENT_LIST);
  }


}

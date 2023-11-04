import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  void clickOnClass({required int index}) {
    Get.toNamed(Routes.STUDENT_LIST);
  }

  void clickOnAddClass() {
    Get.toNamed(Routes.ADD_LIST);
  }
}

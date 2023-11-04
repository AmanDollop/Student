import 'package:get/get.dart';

class StartAttendanceController extends GetxController {

  final count = 0.obs;
  List studentName =['Aman','Manish','Mahi','Sapan','Abhi'];
  List attendType =['P','A'];

  List studentAttendanceList = [].obs;


  @override
  void onInit() {
    super.onInit();
    studentName.forEach((element) {
      studentAttendanceList.add('');
    });
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

  void clickOnSubmitAttendance() {}
}

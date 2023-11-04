import 'package:get/get.dart';

class StudentDetailsController extends GetxController {

  final count = 0.obs;
  List studentName =['Aman','Manish','Mahi','Sapan','Abhi'];
  List attendType =['P','A'];

  List studentAttendanceList = [
    'P',
    'A',
    'A',
    'P',
    'P',
  ].obs;


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
}

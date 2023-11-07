import 'package:get/get.dart';

class StudentDetailsController extends GetxController {

  final count = 0.obs;
  List studentName =['01-02-2023','02-02-2023','03-02-2023','04-02-2023','05-02-2023'];
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

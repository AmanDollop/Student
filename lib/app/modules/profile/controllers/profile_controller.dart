import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final count = 0.obs;

  final teacherName = 'Teacher Name'.obs;
  final subjectName = 'Subject Name'.obs;
  final email = 'abc@gmail.com'.obs;
  final mobileNumber = '0123456789'.obs;

  final inAsyncCall = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value= true;
    teacherName.value = await CommonMethods.getString(key: 'teacherName')??'';
    subjectName.value = await CommonMethods.getString(key: 'subjectName')??'';
    email.value = await CommonMethods.getString(key: 'email')??'';
    mobileNumber.value = await CommonMethods.getString(key: 'mobileNumber')??'';
    inAsyncCall.value= false;
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

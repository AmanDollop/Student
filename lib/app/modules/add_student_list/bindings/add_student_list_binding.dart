import 'package:get/get.dart';

import '../controllers/add_student_list_controller.dart';

class AddStudentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddStudentListController>(
      () => AddStudentListController(),
    );
  }
}

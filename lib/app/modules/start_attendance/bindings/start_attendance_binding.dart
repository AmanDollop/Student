import 'package:get/get.dart';

import '../controllers/start_attendance_controller.dart';

class StartAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartAttendanceController>(
      () => StartAttendanceController(),
    );
  }
}

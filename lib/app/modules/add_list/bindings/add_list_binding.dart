import 'package:get/get.dart';

import '../controllers/add_list_controller.dart';

class AddListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddListController>(
      () => AddListController(),
    );
  }
}

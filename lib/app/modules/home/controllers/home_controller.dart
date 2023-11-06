import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/class_model.dart';
import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  final id = ''.obs;
  final classModel = Rxn<ClassModel>();
  List<Data>? data;
  Map<String, dynamic> queryParametersForClass = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    id.value = await CommonMethods.getString(key: 'id') ?? '';
    print('id::::::::::::::::   $id');
    await getClassApi();
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
    Get.toNamed(Routes.STUDENT_LIST,arguments: [data?[index].classId]);
  }

  Future<void> clickOnAddClass() async {
    await Get.toNamed(Routes.ADD_LIST);
    onInit();
  }

  Future<void> getClassApi() async {
    try {
      classModel.value = await ApiIntegration.getClassListApi(
          context: Get.context!,
          queryParameters: {
            'id': id.value.toString(),
          });
      if (classModel.value != null) {
        data = classModel.value?.data;
        print('data::::::   $data');
      }
    } catch (e) {
      print('ApiError::::   $e');
    }
  }
}

import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/class_model.dart';
import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final count = 0.obs;

  // final id = ''.obs;

  final classModel = Rxn<ClassModel>();
  List<ClassData>? classData;
  Map<String, dynamic> queryParametersForClass = {};

  final inAsyncCall = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    // id.value = await CommonMethods.getString(key: 'id') ?? '';
    // print('id::::::::::::::::   $id');
    await getClassApi();
    inAsyncCall.value = false;
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

  Future<void> clickOnProfile() async {
    await Get.toNamed(Routes.PROFILE);
    onInit();
  }

  void clickOnClass({required int index}) {
    print('data?[index].classId::::::::::::    ${classData?[index].classId}');
    Get.toNamed(Routes.STUDENT_LIST,arguments: [classData?[index].classId]);
  }

  Future<void> clickOnAddClass() async {
    await Get.toNamed(Routes.ADD_LIST);
    onInit();
  }

  Future<void> getClassApi() async {
    try {
      classModel.value = await ApiIntegration.getClassListApi(
          context: Get.context!,
          /*queryParameters: {
            'id': id.value.toString(),
          }*/queryParameters: {});
      if (classModel.value != null) {
        classData = classModel.value?.classData;
        inAsyncCall.value=false;
        print('data::::::   $classData');
      }
    } catch (e) {
      inAsyncCall.value=false;
      print('ApiError::::   $e');
    }
  }


}

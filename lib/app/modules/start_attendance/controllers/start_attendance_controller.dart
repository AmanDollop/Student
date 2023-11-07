import 'dart:convert';

import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/student_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StartAttendanceController extends GetxController {

  final count = 0.obs;
  List studentName =['Aman','Manish','Mahi','Sapan','Abhi'];
  List attendType =['P','A'];

  List studentAttendanceList = [].obs;
  List<Map<String,dynamic>> studentAttendanceListMap = [];
  Map<String, dynamic>test1= {};


  final inAsyncCall =true.obs;
  int? classId;
  final studentModel = Rxn<StudentModel>();
  List<StudentsList>? studentsList;
  Map<String, dynamic> queryParametersForClass = {};

  Map<String, dynamic> bodyParamsForRegistrationApi = {};
  Map<String, dynamic> apiResponseMap = {};
  final checkApiResponseValue = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    classId = Get.arguments[0];
    await getStudentApi();
    inAsyncCall.value=false;
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

  Future<void> getStudentApi() async {
    try {
      studentModel.value = await ApiIntegration.getStudentListApi(
          context: Get.context!,
          queryParameters: {
            'classId': classId.toString(),
          });
      if (studentModel.value != null) {
        studentsList = studentModel.value?.students;
        studentsList?.forEach((element) {
          studentAttendanceList.add('');
        });
        inAsyncCall.value=false;
        print('studentsList::::   $studentsList');
      }
    } catch (e) {
      inAsyncCall.value=false;
      print('ApiError:  :::   $e');
    }
  }

  void clickOnSubmitAttendance() {
    if(studentAttendanceListMap.isNotEmpty){
      print('hsdjfhjshdjhsfkd');
      startStudentAttendanceApiCalling();
    }
  }

  Future<void> startStudentAttendanceApiCalling() async {
    try {
      checkApiResponseValue.value = true;
      bodyParamsForRegistrationApi = {
        'attandance': studentAttendanceListMap,
        'classId':classId
      };
      http.Response? response = await ApiIntegration.startStudentAttendanceApi(bodyParams: bodyParamsForRegistrationApi, context: Get.context!);
      if (response != null && response.statusCode==200) {
        apiResponseMap = jsonDecode(response.body);
        Get.back();
      } else {
        checkApiResponseValue.value = false;
      }
    } catch (e) {
      checkApiResponseValue.value = false;
      print('e::::::::::::::::::: $e');
    }
  }

}

import 'dart:convert';

import 'package:attendance_application/app/data/api_working/api/api_intrigation.dart';
import 'package:attendance_application/app/data/api_working/api_models/student_model.dart';
import 'package:attendance_application/app/data/api_working/my_http/my_http.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StartAttendanceController extends GetxController {

  final count = 0.obs;
  List attendType =['P','A'];

  List studentAttendanceList = [].obs;
  List<Map<String,dynamic>> studentAttendanceListMap = [];

  Map<String,List<Map<String, dynamic>>> allStudentAttendance ={};


  final inAsyncCall =true.obs;
  String? classId;
  final studentModel = Rxn<StudentModel>();
  List<StudentData>? studentData;
  Map<String, dynamic> queryParametersForClass = {};

  Map<String, dynamic> bodyParamsForRegistrationApi = {};
  Map<String, dynamic> apiResponseMap = {};
  final checkApiResponseValue = false.obs;

  Map<String, dynamic>studentAttendanceData={};

  final studentNameLength = 0.obs ;

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
        studentData = studentModel.value?.studentData;
        studentNameLength.value = studentData?.length ?? 0;

        studentData?.forEach((element) {
          studentAttendanceList.add('');
        });

        inAsyncCall.value=false;
      }
    } catch (e) {
      inAsyncCall.value=false;
      if (kDebugMode) {
        print('ApiError:  :::   $e');
      }
    }
  }

  void clickOnPresent({required int index}) {

    if(attendType.contains(studentAttendanceList[index])){

      studentAttendanceList[index] = 'P';
      studentAttendanceData = {"${studentData?[index].studentId}": true};
      studentAttendanceListMap[index] = studentAttendanceData;

    }else{


      studentAttendanceList[index] = 'P';
      studentAttendanceData = {"${studentData?[index].studentId}": true};
      studentAttendanceListMap.add(studentAttendanceData);
    }

    if (kDebugMode) {
      print('True:::   $studentAttendanceListMap');
    }

  }

  void clickOnAbsent({required int index}) {

    if(attendType.contains(studentAttendanceList[index])){

      studentAttendanceList[index] = 'A';
      studentAttendanceData = {"${studentData?[index].studentId}": false};
      studentAttendanceListMap[index] = studentAttendanceData;

    }
    else{

      studentAttendanceList[index] = 'A';
      studentAttendanceData = {"${studentData?[index].studentId}": false};
      studentAttendanceListMap.add(studentAttendanceData);
    }

    if (kDebugMode) {
      print('True:::   $studentAttendanceListMap');
    }

  }

  Future<void> clickOnSubmitAttendance() async {
    if(studentAttendanceListMap.length == studentNameLength.value){
      allStudentAttendance={"status":studentAttendanceListMap};
      await startStudentAttendanceApiCalling();

    }else{
      MyHttp.showSnackBar(message: 'Please Fill All Attendance.', context: Get.context!,);
    }
  }

  Future<void> startStudentAttendanceApiCalling() async {
    try {
      checkApiResponseValue.value = true;
      bodyParamsForRegistrationApi = {
        'attandance': json.encode(allStudentAttendance),
        'classId': classId
      };
      http.Response? response = await ApiIntegration.startStudentAttendanceApi(bodyParams: bodyParamsForRegistrationApi, context: Get.context!);
      if (response != null && response.statusCode==200) {
        apiResponseMap = jsonDecode(response.body);
        checkApiResponseValue.value = false;
        Get.back();
      } else {
        checkApiResponseValue.value = false;
      }
    } catch (e) {
      checkApiResponseValue.value = false;
    }
  }

}

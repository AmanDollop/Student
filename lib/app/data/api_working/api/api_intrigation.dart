// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:attendance_application/app/data/api_working/api_models/class_model.dart';
import 'package:attendance_application/app/data/api_working/api_models/student_model.dart';
import 'package:attendance_application/app/data/api_working/my_http/my_http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiUrlConst {
  static String baseUrl = 'https://8153-182-70-241-61.ngrok-free.app/';
  static String endPointGetForParam = '8153-182-70-241-61.ngrok-free.app';

  static String endPointAddTeacher = '${baseUrl}teacher/addTeacher';
  static String endPointAddClass = '${baseUrl}teacher/addClass';
  static String endPointAddStudent = '${baseUrl}teacher/addStudent';
  static String endPointAddAttendance = '${baseUrl}teacher/addAttendance';

  static String endPointGetAllClasses = '/teacher/getAllClasses';
  static String endPointStudentList = '/teacher/getClassById';

  static String endPointGetStudentAttendance = '/teacher/getStudentAttandance';



}

class ApiIntegration {

  static Future<http.Response?> registrationApi({
    required Map<String, dynamic> bodyParams,
    required BuildContext context,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConst.endPointAddTeacher,
      bodyParams: bodyParams,
      context: context,
    );
    if (response != null) {
      if (await MyHttp.checkResponse(
          response: response,
          wantInternetFailResponse: true,
          wantShowFailResponse: true,
          context: context)) {
        return response;
      } else {
        if (kDebugMode) {
          print("res:::  ${response.statusCode}");
        }
        return null;
      }
    } else {
      if (kDebugMode) {
        print("res:::  ${response?.body}");
      }
      return null;
    }
  }

  static Future<http.Response?> addClassApi({
    required Map<String, dynamic> bodyParams,
    required BuildContext context,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConst.endPointAddClass,
      bodyParams: bodyParams,
      context: context,
    );
    if (response != null) {
      if (await MyHttp.checkResponse(
          response: response,
          wantInternetFailResponse: true,
          wantShowFailResponse: true,
          context: context)) {
        return response;
      } else {
        if (kDebugMode) {
          print("res:::  ${response.statusCode}");
        }
        return null;
      }
    } else {
      if (kDebugMode) {
        print("res:::  ${response?.body}");
      }
      return null;
    }
  }

  static Future<http.Response?> addStudentApi({
    required Map<String, dynamic> bodyParams,
    required BuildContext context,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConst.endPointAddStudent,
      bodyParams: bodyParams,
      context: context,
    );
    if (response != null) {
      if (await MyHttp.checkResponse(
          response: response,
          wantInternetFailResponse: true,
          wantShowFailResponse: true,
          context: context)) {
        return response;
      } else {
        if (kDebugMode) {
          print("res:::  ${response.statusCode}");
        }
        return null;
      }
    } else {
      if (kDebugMode) {
        print("res:::  ${response?.body}");
      }
      return null;
    }
  }


  static Future<http.Response?> startStudentAttendanceApi({
    required Map<String, dynamic> bodyParams,
    required BuildContext context,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConst.endPointAddAttendance,
      bodyParams: bodyParams,
      context: context,
    );
    if (response != null) {
      if (await MyHttp.checkResponse(
          response: response,
          wantInternetFailResponse: true,
          wantShowFailResponse: true,
          context: context)) {
        return response;
      } else {
        if (kDebugMode) {
          print("res:::  ${response.statusCode}");
        }
        return null;
      }
    } else {
      if (kDebugMode) {
        print("res:::  ${response?.body}");
      }
      return null;
    }
  }

  static Future<ClassModel?> getClassListApi(
      {required BuildContext context,
      required Map<String, dynamic> queryParameters}) async {
    ClassModel? classModel;

    http.Response? response = await MyHttp.getMethodForParams(
        endPointUri: ApiUrlConst.endPointGetAllClasses,
        context: context,
        queryParameters: queryParameters,
        baseUri: ApiUrlConst.endPointGetForParam);
    if (response != null) {
      if (await MyHttp.checkResponse(response: response, context: context)) {
        classModel = ClassModel.fromJson(jsonDecode(response.body));
        return classModel;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<StudentModel?> getStudentListApi(
      {required BuildContext context,
      required Map<String, dynamic> queryParameters}) async {
    StudentModel? studentModel;

    http.Response? response = await MyHttp.getMethodForParams(
        endPointUri: ApiUrlConst.endPointStudentList,
        context: context,
        queryParameters: queryParameters,
        baseUri: ApiUrlConst.endPointGetForParam);
    if (response != null) {
      if (await MyHttp.checkResponse(response: response, context: context)) {
        studentModel = StudentModel.fromJson(jsonDecode(response.body));
        return studentModel;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<StudentModel?> getStudentDetailApi(
      {required BuildContext context,
      required Map<String, dynamic> queryParameters}) async {
    StudentModel? studentModel;

    http.Response? response = await MyHttp.getMethodForParams(
        endPointUri: ApiUrlConst.endPointGetStudentAttendance,
        context: context,
        queryParameters: queryParameters,
        baseUri: ApiUrlConst.endPointGetForParam);
    if (response != null) {
      if (await MyHttp.checkResponse(response: response, context: context)) {
        studentModel = StudentModel.fromJson(jsonDecode(response.body));
        return studentModel;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

}

// ignore_for_file: use_build_context_synchronously

import 'package:attendance_application/app/data/api_working/my_http/my_http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiIntegration{
  static Future<http.Response?> registrationApi({
    required Map<String, dynamic> bodyParams,
    required BuildContext context,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: 'ApiConstants.endPointSignUpApi',
      bodyParams: bodyParams,
      context: context,
    );
    if (response != null) {
      if (await MyHttp.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true, context: context)) {
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

}
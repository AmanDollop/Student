import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

class MyHttp {
  static Future<http.Response?> getMethod(
      {required String url,
        Map<String, String>? token,
        required BuildContext context}) async {
    if (kDebugMode) print("CALLING:: $url");
    try {
      http.Response? response = await http.get(
        Uri.parse(url),
        headers: token,
      );
      if (kDebugMode) print("CALLING:: ${response.body}");
      // MyLogger.logger.w("CALLING:: ${response.body}");
      return response;
    } catch (e) {
      if (kDebugMode) print("CALLING:: Server Down");
      // MyLogger.logger.e("CALLING:: Server Down");
      //MyCommonMethod.serverDownShowSnackBar(context: context);
      return null;
    }
  }

  static Future<http.Response?> postMethod(
      {required String url,
        required Map<String, dynamic> bodyParams,
        Map<String, String>? token,
        required BuildContext context}) async {
    if (kDebugMode) print("CALLING:: $url");
    if (kDebugMode) print("BODY PARAMS:: $bodyParams");
    try {
      http.Response? response =
      await http.post(Uri.parse(url), body: bodyParams, headers: token);
      if (kDebugMode) print("CALLING:: ${response.body}");
      return response;
    } catch (e) {
      if (kDebugMode) print("ERROR:: $e");
      if (kDebugMode) print("CALLING:: Server Down");
      // MyLogger.logger.e("CALLING:: Server Down");
      //MyCommonMethod.serverDownShowSnackBar(context: context);
      return null;
    }
  }





  static Future<http.Response?> getMethodForParams(
      {Map<String, String>? authorization,
        required Map<String, dynamic> queryParameters,
        required String baseUri,
        required String endPointUri,
        required BuildContext context}) async {
    try {
      Uri uri = Uri.http(baseUri, endPointUri, queryParameters);
      if (kDebugMode) print("CALLING:: $uri");
      http.Response? response = await http.get(uri, headers: authorization);
      if (kDebugMode) print("CALLING:: ${response.body}");
      if (response != null) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) print("ERROR:: $e");
      if (kDebugMode) print("CALLING:: Server Down");
      // MyLogger.logger.e("CALLING:: Server Down");
      //MyCommonMethod.serverDownShowSnackBar(context: context);
      return null;
    }
  }




  static Future<http.Response?> deleteMethod(
      {required String url,
        required Map<String, dynamic> bodyParams,
        Map<String, String>? token,
        required BuildContext context}) async {
    if (kDebugMode) print("CALLING:: $url");
    if (kDebugMode) print("BODY PARAMS:: $bodyParams");
    try {
      http.Response? response =
      await http.delete(Uri.parse(url), body: bodyParams, headers: token);
      if (kDebugMode) print("CALLING:: ${response.body}");
      return response;
    } catch (e) {
      if (kDebugMode) print("ERROR:: $e");
      if (kDebugMode) print("CALLING:: Server Down");
      // MyLogger.logger.e("CALLING:: Server Down");
      //MyCommonMethod.serverDownShowSnackBar(context: context);
      return null;
    }
  }

  static Future<bool> checkResponse(
      {required http.Response response,
        required BuildContext context,
        bool wantShowSuccessResponse = false,
        bool wantShowFailResponse = false,
        bool wantInternetFailResponse = false}) async {
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    if (response.statusCode == StatusCodeConstant.OK) {
      if (wantShowSuccessResponse) {
        // ignore: use_build_context_synchronously
        showSnackBar(message: responseMap['message'], context: context);
      }
      return true;
    } else if (response.statusCode == StatusCodeConstant.BAD_REQUEST) {
      if (wantShowFailResponse) {
        // ignore: use_build_context_synchronously
        showSnackBar(
            message: responseMap['message'], context: context);
      }
      return false;
    } else if (response.statusCode == StatusCodeConstant.BAD_GATEWAY) {
      /*MyCommonMethod.showSnackBar(
            message: "Something went wrong", context: context);*/
      return false;
    } else if (response.statusCode == StatusCodeConstant.REQUEST_TIMEOUT) {
      /*MyCommonMethod.showSnackBar(
            message: "Something went wrong", context: context);*/
      return false;
    } else if (response.statusCode == StatusCodeConstant.NOT_FOUND) {
      /*MyCommonMethod.showSnackBar(
            message: "Something went wrong", context: context);*/
      return false;
    } else {
      /*MyCommonMethod.showSnackBar(
            message: "Something went wrong", context: context);*/
      return false;
    }
  }

  static void showSnackBar({
    required String message,
    required BuildContext context,
    Duration? duration,
    double? width,
    bool widthValue = true,
  }) {
    SnackBar snackBar;
    if(widthValue){
      snackBar = SnackBar(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.px),
        ),
        content: Text(message),
        margin: EdgeInsets.only(left: 4.w, right: 3.w, bottom: 6.h),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        duration: duration ?? const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      );
    }else{
      snackBar = SnackBar(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.px),
        ),
        width: width,
        content: Text(message,textAlign: TextAlign.center),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        duration: duration ?? const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

class StatusCodeConstant {
  // Note: Only the widely used HTTP status codes are documented

  // Informational

  static int CONTINUE = 100;
  static int SWITCHING_PROTOCOLS = 101;
  static int PROCESSING = 102;            // RFC2518

  // Success

  /*
   * The request has succeeded
   */
  static int OK = 200;

  /*
   * The server successfully created a new resource
   */
  static  int CREATED = 201;
  static  int ACCEPTED = 202;
  static  int NON_AUTHORITATIVE_INFORMATION = 203;

  /*
   * The server successfully processed the request, though no content is returned
   */
  static  int NO_CONTENT = 204;
  static  int RESET_CONTENT = 205;
  static  int PARTIAL_CONTENT = 206;
  static  int MULTI_STATUS = 207;          // RFC4918
  static  int ALREADY_REPORTED = 208;      // RFC5842
  static  int IM_USED = 226;               // RFC3229

  // Redirection

  static int MULTIPLE_CHOICES = 300;
  static int MOVED_PERMANENTLY = 301;
  static int FOUND = 302;
  static int SEE_OTHER = 303;

  /*
   * The resource has not been modified since the last request
   */
  static int NOT_MODIFIED = 304;
  static int USE_PROXY = 305;
  static int RESERVED = 306;
  static int TEMPORARY_REDIRECT = 307;
  static int PERMANENTLY_REDIRECT = 308;  // RFC7238

  // Client Error

  /*
   * The request cannot be fulfilled due to multiple errors
   */
  static int BAD_REQUEST = 400;

  /*
   * The user is unauthorized to access the requested resource
   */
  static int UNAUTHORIZED = 401;
  static int PAYMENT_REQUIRED = 402;

  /*
   * The requested resource is unavailable at this present time
   */
  static int FORBIDDEN = 403;

  /*
   * The requested resource could not be found
   *
   * Note: This is sometimes used to mask if there was an UNAUTHORIZED (401) or
   * FORBIDDEN (403) error, for security reasons
   */
  static int NOT_FOUND = 404;

  /*
   * The request method is not supported by the following resource
   */
  static int METHOD_NOT_ALLOWED = 405;

  /*
   * The request was not acceptable
   */
  static int NOT_ACCEPTABLE = 406;
  static int PROXY_AUTHENTICATION_REQUIRED = 407;
  static int REQUEST_TIMEOUT = 408;

  /*
   * The request could not be completed due to a conflict with the current state
   * of the resource
   */
  static int CONFLICT = 409;
  static int GONE = 410;
  static int LENGTH_REQUIRED = 411;
  static int PRECONDITION_FAILED = 412;
  static int REQUEST_ENTITY_TOO_LARGE = 413;
  static int REQUEST_URI_TOO_LONG = 414;
  static int UNSUPPORTED_MEDIA_TYPE = 415;
  static int REQUESTED_RANGE_NOT_SATISFIABLE = 416;
  static int EXPECTATION_FAILED = 417;
  static int I_AM_A_TEAPOT = 418;                                               // RFC2324
  static int UNPROCESSABLE_ENTITY = 422;                                        // RFC4918
  static int LOCKED = 423;                                                      // RFC4918
  static int FAILED_DEPENDENCY = 424;                                           // RFC4918
  static int RESERVED_FOR_WEBDAV_ADVANCED_COLLECTIONS_EXPIRED_PROPOSAL = 425;   // RFC2817
  static int UPGRADE_REQUIRED = 426;                                            // RFC2817
  static int PRECONDITION_REQUIRED = 428;                                       // RFC6585
  static int TOO_MANY_REQUESTS = 429;                                           // RFC6585
  static int REQUEST_HEADER_FIELDS_TOO_LARGE = 431;                             // RFC6585

  // Server Error

  /*
   * The server encountered an unexpected error
   *
   * Note: This is a generic error message when no specific message
   * is suitable
   */
  static int INTERNAL_SERVER_ERROR = 500;

  /*
   * The server does not recognise the request method
   */
  static int NOT_IMPLEMENTED = 501;
  static int BAD_GATEWAY = 502;
  static int SERVICE_UNAVAILABLE = 503;
  static int GATEWAY_TIMEOUT = 504;
  static int VERSION_NOT_SUPPORTED = 505;
  static int VARIANT_ALSO_NEGOTIATES_EXPERIMENTAL = 506;                        // RFC2295
  static int INSUFFICIENT_STORAGE = 507;                                        // RFC4918
  static int LOOP_DETECTED = 508;                                               // RFC5842
  static int NOT_EXTENDED = 510;                                                // RFC2774
  static int NETWORK_AUTHENTICATION_REQUIRED = 511;

}
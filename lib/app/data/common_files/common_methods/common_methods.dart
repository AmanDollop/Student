import 'package:attendance_application/app/data/api_working/my_http/my_http.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonMethods extends GetxController{
  static final isConnect = false.obs;
  Connectivity connectivity = Connectivity();

  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<String?> getString({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(key, value);
  }

  static Future<bool?> getBool({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key);
  }

  static Future<bool> setBool(
      {required String key, required bool value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool(key, value);
  }



  static Future<void> getNetworkConnectionType() async {
    ConnectivityResult connectivityResult;
    CommonMethods commonMethods = CommonMethods();
    try {
      connectivityResult =
      await (commonMethods.connectivity.checkConnectivity());
      return commonMethods.updateConnectionState(connectivityResult);
      // ignore: empty_catches
    } on PlatformException catch (e) {
      // handle e here
    }
  }
  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
  static checkNetworkConnection() {
    CommonMethods commonMethods = CommonMethods();
    final networkConnection = false.obs;
    return commonMethods.connectivity.onConnectivityChanged.listen((event) async {
      // ignore: void_checks
      networkConnection.value =
      await internetConnectionCheckerMethod();
      if (networkConnection.value) {
        isConnect.value = true;
      } else {
        isConnect.value = false;
        MyHttp.showSnackBar(
          message: "Check Your Internet Connection",
          context: Get.context!,
          duration: const Duration(seconds: 5),
        );
      }
      return commonMethods.updateConnectionState(event);
    });
  }

  void updateConnectionState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        update();
        break;
      case ConnectivityResult.mobile:
        update();
        break;
      case ConnectivityResult.none:
        update();
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

}

class CommonDialog{


  static commonAlertDialogBox(
      {required String title,
        required String content,
        required String leftButtonTitle,
        required String rightButtonTitle,
        required BuildContext context,
        required VoidCallback leftButtonOnPressed,
        required VoidCallback rightButtonOnPressed}) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: TextStyle(fontSize: 14.px,color: Colors.black),
      ),
      content: Text(
        content,
        style: TextStyle(fontSize: 16.px,color: Colors.black),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: leftButtonOnPressed,
          child: Text(
            leftButtonTitle,
            style: TextStyle(fontSize: 14.px,color: Colors.grey),
          ),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: rightButtonOnPressed,
          child: Text(
            rightButtonTitle,
            style: TextStyle(fontSize: 14.px,color: Colors.blue),
          ),
        ),
      ],
      insetAnimationDuration: const Duration(seconds: 1),
    );
  }

}
import 'package:attendance_application/app/data/common_files/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/social_login_controller.dart';

class SocialLoginView extends GetView<SocialLoginController> {
  const SocialLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Social LogIn",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 34.px,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25.px),
                Text(
                  'Click On Google Button',
                  style: TextStyle(color: Colors.black, fontSize: 20.px),
                ),
                SizedBox(height: 5.px),
                CommonWidgets.myElevatedButton(
                    child: Image.asset('assets/google_image.png',height: 25.px, width: 25.px),
                    onPressed: () {},
                    backgroundColor: Colors.blue.withOpacity(.5),
                    width: 120.px,
                    height: 35.px)
              ],
            ),
          ),
        ),
      );
    });
  }
}

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
          child:  Center(
            child:SizedBox(
              height: 200.px,
              width: 200.px,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/svc_logo.jpeg'),
              ),
            )
          ),
        ),
      );
    });
  }
}


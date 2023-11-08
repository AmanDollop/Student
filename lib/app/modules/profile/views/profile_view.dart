import 'package:attendance_application/app/data/common_files/common_methods/Progress_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Obx(() {
        controller.count.value;
        return ProgressBarForChat(
          inAsyncCall: controller.inAsyncCall.value,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150.px,
                  width: 150.px,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/svc_logo.jpeg'),
                        fit: BoxFit.contain,
                      ),
                      shape: BoxShape.circle),
                ),
                SizedBox(height: 50.px),
                commonWidget(title: 'Teacher Name', subTitle: '${controller.teacherName}'),
                SizedBox(height: 20.px),
                commonWidget(title: 'Subject Name', subTitle: '${controller.subjectName}'),
                SizedBox(height: 20.px),
                commonWidget(title: 'Mobile No.', subTitle: '${controller.mobileNumber}'),
                SizedBox(height: 20.px),
                commonWidget(title: 'Email', subTitle: '${controller.email}'),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget commonWidget({required String title, required String subTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(width: 15.px),
        const Text(
          '-:',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.end,
        ),
        SizedBox(width: 15.px),
        Expanded(
          flex: 6,
          child: Text(
            subTitle,
            style: const TextStyle(fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

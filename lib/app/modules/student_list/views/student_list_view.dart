import 'package:attendance_application/app/data/common_files/common_methods/Progress_bar.dart';
import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/data/common_files/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/student_list_controller.dart';

class StudentListView extends GetView<StudentListController> {
  const StudentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        centerTitle: true,
      ),
      body: Obx(() {
        controller.count.value;
        return CommonMethods.isConnect.value
            ? ProgressBarForChat(
                inAsyncCall: controller.inAsyncCall.value,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    controller.studentModel.value != null
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 80.px),
                            child: controller.studentData != null &&
                                    controller.studentData!.isNotEmpty
                                ? ListView.builder(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.px, vertical: 18.px),
                                    itemBuilder: (context, index) => Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 4.px),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(8.px),
                                          ),
                                          child: InkWell(
                                            onTap: () => controller
                                                .clickOnStudent(index: index),
                                            borderRadius:
                                                BorderRadius.circular(8.px),
                                            splashColor:
                                                Colors.blue.withOpacity(.2),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.px),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Student Name -:',
                                                    style: TextStyle(
                                                        fontSize: 16.px,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(width: 25.px),
                                                  Text(
                                                    '${controller.studentData?[index].studentName}',
                                                    style: TextStyle(
                                                        fontSize: 14.px,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.studentData?.length)
                                : Center(
                                    child: Text(
                                      controller.inAsyncCall.value
                                          ? ''
                                          : 'No Student Found!',
                                      style: TextStyle(
                                          fontSize: 20.px, color: Colors.black),
                                    ),
                                  ),
                          )
                        : Center(
                            child: Text(
                              controller.inAsyncCall.value
                                  ? ''
                                  : 'Something Went Wrong',
                              style: TextStyle(fontSize: 20.px, color: Colors.black),
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (controller.attendance.value)
                            if (controller.studentData != null && controller.studentData!.isNotEmpty)
                              CommonWidgets.myElevatedButton(
                                  onPressed: () => controller.clickOnStartAttendanceButton(),
                                  text: 'Start Attendance',
                                  width: 42.w,
                                  backgroundColor: Colors.orange),
                          if (controller.attendance.value)
                            if (controller.studentData != null && controller.studentData!.isNotEmpty)
                              SizedBox(width: 20.px),
                          if (controller.attendance.value)
                            CommonWidgets.myElevatedButton(
                                onPressed: () => controller.clickOnAddStudentButton(),
                                text: 'Add Student',
                                width: 42.w,
                                backgroundColor: Colors.red),
                          if (!controller.attendance.value)
                            Text(
                              'You will add student next day.',
                              style: TextStyle(fontSize: 22.px, color: Colors.black),

                            ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: Text(
                  controller.inAsyncCall.value ? '' : 'No Internet Connection',
                  style: TextStyle(fontSize: 22.px, color: Colors.black),
                ),
              );
      }),
    );
  }
}

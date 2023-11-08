import 'package:attendance_application/app/data/common_files/common_methods/Progress_bar.dart';
import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/data/common_files/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/start_attendance_controller.dart';

class StartAttendanceView extends GetView<StartAttendanceController> {
  const StartAttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Attendance'),
        centerTitle: true,
      ),
      body: Obx(() {
        controller.count.value;
        return ProgressBarForChat(
          inAsyncCall: controller.inAsyncCall.value,
          child:CommonMethods.isConnect.value? controller.studentModel.value != null
              ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 10.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Student Name',
                                  style: TextStyle(
                                      fontSize: 18.px,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800)),
                              Text('Present',
                                  style: TextStyle(
                                      fontSize: 18.px,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800)),
                              Text('Absent',
                                  style: TextStyle(
                                      fontSize: 18.px,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800)),
                            ],
                          ),
                        ),
                        controller.studentData != null && controller.studentData!.isNotEmpty
                            ? Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 80.px),
                                  child: Obx(() {
                                    controller.count.value;
                                    return ListView.builder(
                                        padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 18.px),
                                        itemBuilder: (context, index) => Padding(padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 5.px),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          '${controller.studentData?[index].studentName}',
                                                          style: TextStyle(
                                                              fontSize: 14.px,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w800),
                                                        ),
                                                      ),
                                                      Obx(() {
                                                        controller.count.value;
                                                        return Expanded(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              Container(
                                                                width: 30.px,
                                                                height: 30.px,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    border: Border.all(color: Colors.grey, width: 2.px)),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(2.px),
                                                                  child: InkWell(
                                                                    onTap: ()=>controller.clickOnPresent(index:index),
                                                                    child: Container(
                                                                      width: 25.px,
                                                                      height: 25.px,
                                                                      decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: controller.studentAttendanceList[index] == 'P'? Colors.green: Colors.transparent,
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child: Text(
                                                                          controller.attendType[0].toString(),
                                                                          style: TextStyle(
                                                                              fontSize: 12.px,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w800),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 25.w),
                                                              Container(
                                                                width: 30.px,
                                                                height: 30.px,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    border: Border.all(color: Colors.grey, width: 2.px)),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(2.px),
                                                                  child: InkWell(
                                                                    onTap: () => controller.clickOnAbsent(index:index),
                                                                    child: Container(
                                                                      width: 25.px,
                                                                      height: 25.px,
                                                                      decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: controller.studentAttendanceList[index] == 'A'? Colors.red: Colors.transparent,
                                                                      ),
                                                                      child: Center(
                                                                        child: Text(
                                                                          controller.attendType[1].toString(),
                                                                          style: TextStyle(fontSize: 12.px, color: Colors.black, fontWeight: FontWeight.w800),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      })
                                                    ],
                                                  ),
                                                ),
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: controller.studentData?.length);
                                  }),
                                ),
                              )
                            : Center(
                                child: Text(
                                  controller.inAsyncCall.value
                                      ? ''
                                      : 'Data Not Found!',
                                  style: TextStyle(
                                      fontSize: 20.px, color: Colors.black),
                                ),
                              ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.px, vertical: 24.px),
                      child: CommonWidgets.myElevatedButton(
                        onPressed: !controller.checkApiResponseValue.value?() => controller.clickOnSubmitAttendance():() => null,
                        text: 'Submit Attendance',
                        progressBarValue: controller.checkApiResponseValue.value
                      ),
                    )
                  ],
                )
              : Center(
                  child: Text(
                    controller.inAsyncCall.value ? '' : 'Something Went Wrong',
                    style: TextStyle(fontSize: 20.px, color: Colors.black),
                  ),
                )
              : Center(
            child: Text(
              controller.inAsyncCall.value?'':'No Internet Connection',
              style: TextStyle(fontSize: 22.px, color: Colors.black),
            ),
          ),
        );
      }),
    );
  }
}

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
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12.px, vertical: 10.px),
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 80.px),
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.px, vertical: 18.px),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.px, vertical: 5.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${controller.studentName[index]}',
                                  style: TextStyle(
                                      fontSize: 14.px,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30.px,
                                      height: 30.px,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.grey,
                                              width: 2.px)),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.px),
                                        child: InkWell(
                                          onTap: () {
                                            controller.studentAttendanceList[index] = 'P';
                                            print('controller.studentAttendanceList[index]::::::::::::::::::::     ${controller.studentAttendanceList}');
                                          },
                                          child: Container(
                                            width: 25.px,
                                            height: 25.px,
                                            decoration:  BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:controller.studentAttendanceList[index] == 'P' ?Colors.green:Colors.transparent,
                                            ),
                                            child: Center(
                                              child: Text(
                                                controller.attendType[0].toString(),
                                                style: TextStyle(
                                                    fontSize: 12.px,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800),),
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
                                          onTap: () {
                                            controller.studentAttendanceList[index] = 'A';
                                          },
                                          child: Container(
                                            width: 25.px,
                                            height: 25.px,
                                            decoration:  BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: controller.studentAttendanceList[index] == 'A' ?Colors.red:Colors.transparent,
                                            ),
                                            child: Center(
                                              child: Text(
                                                controller.attendType[1].toString(),
                                                style: TextStyle(
                                                    fontSize: 12.px,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.studentName.length),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
              child: CommonWidgets.myElevatedButton(
                  onPressed: () => controller.clickOnSubmitAttendance(),
                  text: 'Submit Attendance'),
            )
          ],
        );
      }),
    );
  }
}

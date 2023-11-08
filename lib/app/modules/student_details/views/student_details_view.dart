import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/student_details_controller.dart';

class StudentDetailsView extends GetView<StudentDetailsController> {
  const StudentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        centerTitle: true,
      ),
      body: Obx(() {
        controller.count.value;
        return CommonMethods.isConnect.value?
        Stack(
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
                      Text('Date',
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
                          padding: EdgeInsets.symmetric(vertical: 5.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  '${controller.studentName[index]}',
                                  style: TextStyle(
                                      fontSize: 14.px,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    SizedBox(width: 25.w),
                                    Container(
                                      width: 30.px,
                                      height: 30.px,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.grey, width: 2.px)),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.px),
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
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 5.px),
              height: 60.px,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Presents',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.px,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        '03',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18.px,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Absents',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.px,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        '02',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18.px,
                            color: Colors.red),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Total Days',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.px,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        '05',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18.px,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ):
        Center(
          child: Text(
            'No Internet Connection',
            style: TextStyle(fontSize: 22.px, color: Colors.black),
          ),
        );
      }),
    );
  }
}

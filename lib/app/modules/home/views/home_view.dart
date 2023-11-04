import 'package:attendance_application/app/data/common_files/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Classes'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 80.px),
            child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.px, vertical: 18.px),
                itemBuilder: (context, index) => Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 4.px),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.px)),
                      child: InkWell(
                        onTap: () => controller.clickOnClass(index: index),
                        borderRadius: BorderRadius.circular(8.px),
                        splashColor: Colors.blue.withOpacity(.2),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.px),
                          child: Row(
                            children: [
                              Text(
                                'Class Name -:',
                                style: TextStyle(
                                    fontSize: 16.px,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 25.px),
                              Text(
                                'Class Name',
                                style: TextStyle(
                                    fontSize: 14.px,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                physics: const BouncingScrollPhysics(),
                itemCount: 50),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
            child: CommonWidgets.myElevatedButton(onPressed: () => controller.clickOnAddClass(), text: 'Add Class'),
          )
        ],
      ),
    );
  }
}
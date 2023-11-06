import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/data/common_files/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/add_list_controller.dart';

class AddListView extends GetView<AddListController> {
  const AddListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Obx(() {
     controller.count.value;
     return Scaffold(
       appBar: AppBar(
         title: const Text('Add Your Class'),
         centerTitle: true,
       ),
       body: GestureDetector(
         onTap: () => CommonMethods.unFocsKeyBoard(),
         child: Stack(
           alignment: Alignment.bottomCenter,
           children: [
             Form(
               key: controller.key,
               child: ListView(
                 padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
                 children: [

                   SizedBox(height: 30.px),
                   CommonWidgets.myTextField(
                     labelText: 'Enter Class Name',
                     hintText: 'Enter Class Name',
                     iconVisible: true,
                     controller: controller.addClassController,
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter class name';
                       }
                       return null;
                     },
                   ),
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
               child: CommonWidgets.myElevatedButton(
                   text: 'Add Class',
                   onPressed: !controller.checkApiResponseValue.value?() => controller.clickOnAddClassButton():() => null,
                   progressBarValue: controller.checkApiResponseValue.value
               ),
             ),
           ],
         ),
       ),
     );
   });
  }
}

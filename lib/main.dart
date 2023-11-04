import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/routes/app_pages.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ResponsiveSizer(
      builder: (
          buildContext,
          orientation,
          screenType,
      )=> GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  ),);
}

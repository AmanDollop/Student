import 'dart:async';

import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CommonMethods.getNetworkConnectionType();
  StreamSubscription streamSubscription =
      CommonMethods.checkNetworkConnection();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      ResponsiveSizer(
        builder: (
          buildContext,
          orientation,
          screenType,
        ) =>
            GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
                TargetPlatform.values,
                value: (dynamic _) => const FadeUpwardsPageTransitionsBuilder(), //applying old animation
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  });
}

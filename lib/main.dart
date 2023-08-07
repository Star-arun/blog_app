import 'package:blog_app/home_screen/home_screen_binding.dart';
import 'package:blog_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ABC a = ABC();
    // Styles b = Styles();
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: HomeScreenBinding(),
        initialRoute: "/homeScreen",
        getPages: Routes.routes,
      );
    });
  }
}

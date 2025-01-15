import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lenus1/controllers/Layout/navigation_bar_model.dart';
import 'package:lenus1/views/layouts/layout.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';

void main() {
  Get.put(NavigationBarTabsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(448, 997.33),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Bible App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Montserrat'),
          home: Homescreen(),
          // Define your routes here
          getPages: [
            GetPage(name: '/', page: () => Homescreen()),
            // Add other routes
          ],
        );
      },
      child: Homescreen(),
    );
  }
}

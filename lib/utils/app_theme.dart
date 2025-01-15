import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: const Color(0xFFf16b26),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.deepOrange),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFA6A3A0)),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 19.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(fontSize: 15, color: Colors.grey),
      titleLarge: TextStyle(fontSize: 12),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
  );
}

class AppConstants {
  const AppConstants._();

  //Use for height
  static double ph2 = 2.h;
  static double ph4 = 4.h;
  static double ph6 = 6.h;
  static double ph8 = 8.h;
  static double ph10 = 10.h;
  static double ph12 = 12.h;
  static double ph14 = 14.h;
  static double ph16 = 16.h;

  //Use for width
  static double pw2 = 2.w;
  static double pw4 = 4.w;
  static double pw6 = 6.w;
  static double pw8 = 8.w;
  static double pw10 = 10.w;
  static double pw12 = 12.w;
  static double pw14 = 14.w;
  static double pw16 = 16.w;

  //Use for font size
  static double fs8 = 8.sp;
  static double fs10 = 10.sp;
  static double fs12 = 12.sp;
  static double fs14 = 14.sp;
  static double fs16 = 16.sp;

  //Use for App Text
  static String appBarMainText = 'Chat with \nyour friends';
}

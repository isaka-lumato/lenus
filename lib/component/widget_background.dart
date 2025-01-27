
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lenus1/utils/app_theme.dart';

Widget widgetBG(
    {Widget? child,
    double height = 300,
    double marginh = 12,
    double margint = 0,
    double marginb = 0,
    double radius = 15,
    double blur = 20,
    double borderwidth = 1,
    double paddingh = 0,
    double paddingv = 0,
    int colorBG1 = 0xff85A0FF,
    int colorBG2 = 0xff88c9FF,
    int colorBL1 = 0xff85A0FF,
    int colorBL2 = 0xff83E9FF}) {
  return GlassmorphicContainer(
      margin: EdgeInsets.only(left: marginh.w, right: marginh.w,top: margint.h ,bottom: marginb.h),
      padding: EdgeInsets.symmetric(horizontal: paddingh.w, vertical: paddingv.w),
      width: AppConstants.fullWidth(),
      height: height,
      borderRadius: radius.r,
      blur: blur,
      alignment: Alignment.bottomCenter,
      border: borderwidth.r,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
                  Color(colorBG2).withAlpha(51),
                  Color(colorBG1).withAlpha(51),
                  ],
          stops: const [
            0.1,
            1
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
              Color(colorBL1).withAlpha(51),
              Color(colorBL2).withAlpha(77),
            ],),
      child: child);}

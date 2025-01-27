  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lenus1/component/app_background.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/images.dart';

bgGlass() {
    return Row(
      children: [
        _buildFractalGlass(),
        _buildFractalGlass(),
        _buildFractalGlass(),
        _buildFractalGlass(),
        _buildFractalGlass(),
        _buildFractalGlass(),
        _buildFractalGlass(),
        _buildFractalGlass(),
      ],
    );
  }

  _buildFractalGlass() {
    var fractalColors = [
      const Color(0xFFFFFFFF).withAlpha(51),
      const Color(0xFF4B5377).withAlpha(51),
      const Color(0xFFFFFFFF).withAlpha(51),
    ];
    return GlassmorphicContainer(
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
      width: 46.w,
      height: AppConstants.fullHeight() * 0.7,
      borderRadius: 1,
      blur: 16,
      alignment: Alignment.bottomCenter,
      border: 0.2.r,
      linearGradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: fractalColors,
          stops: const [
            0.1,
            0.7,
            1,
          ]),
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(255, 255, 255, 0.2),
          Color.fromRGBO(255, 255, 255, 0.2),
        ],
      ),
    );
  }

stackedBG (dynamic context){return appBackground(
        
        child: Stack(
          children: [
            Positioned(
                bottom: 150.h,
                child: Image.asset(
                  r1login,
                  width: ScreenUtil().screenWidth * 0.6,
                )),
            Positioned(
              right: 0.w,
              top: 130.h,
              child: Image.asset(
                r2login,
                width: ScreenUtil().screenWidth * 0.4,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                r3login,
                width: ScreenUtil().screenWidth * 0.6,
              ),
            ),
            Positioned(left: -20.w, child: bgGlass()),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ]),
          ],
        ),
      );
  }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lenus1/component/app_background.dart';
import 'package:lenus1/utils/app_color.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/colors.dart';
import 'package:lenus1/utils/images.dart';
import 'package:lenus1/views/auth_screen/signup.dart';
import 'package:velocity_x/velocity_x.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Delayed navigation to LoginScreen after 3 seconds
    Future.delayed(const Duration(seconds: 30), () {
      if (mounted) {
        Get.off(() => const SignUp());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return appBackground(
      customColors: [
        AppColor.primaryColor,
        Colors.white,
        AppColor.darkOrange,
      ],
      child: SizedBox(
        height: AppConstants.fullHeight(),
        child: Column(
          children: [
            _buildImageContainer(),
            _buildDescParagragh(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBotton(),
    );
  }
}

Widget _buildImageContainer() {
  return Container(
    margin: EdgeInsets.all(AppConstants.pw8),
    padding: EdgeInsets.symmetric(horizontal: AppConstants.ph20),
    width: AppConstants.fullWidth(),
    height: AppConstants.fullHeight() * 0.55,
    decoration: BoxDecoration(
        image: const DecorationImage(
            colorFilter: ColorFilter.srgbToLinearGamma(),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            image: AssetImage(getStarted)),
        borderRadius: BorderRadius.all(Radius.circular(25.r))),
    //child:
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //       "Effortless Shopping \nUnbounded Possibilities \nShop with Ease."
    //      .text.semiBold.white.size(36.sp).make()
    //   ],
    // )
  );
}

Widget _buildDescParagragh() {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: AppConstants.fullHeight() * 0.02, horizontal: AppConstants.pw16+AppConstants.pw4),
    child: Text(
      "Unlock seamless selling and limitless possibilities on REX Trends Seller App. Explore a wide range of selling opportunities, effortlessly manage your products.",
      style: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget _buildBotton() {
  return GlassmorphicContainer(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
          width: AppConstants.fullHeight(),
          height: 70.h,
          borderRadius: 20.r,
          blur: 20,
          alignment: Alignment.bottomCenter,
          border: 0.2.r,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: const [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                        const Color(0xFFffffff).withAlpha(230),
                        const Color(0xFFffffff).withAlpha(230),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignUp());
                },
                child: GlassmorphicContainer(
                    width: 65.w,
                    height: 65.h,
                    borderRadius: 18.r,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 0.3.r,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                            darkBlueColor.withAlpha(102),
                            blueColor.withAlpha(102),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withAlpha(230),
                        Colors.lightBlueAccent,
                      ],
                    ),
                    child: Center(
                        child: const Icon(
                      Icons.arrow_upward,
                      color: whiteColor,
                    ).rotate45())),
              )
            ],
          ).marginSymmetric(horizontal: 2.5.w, vertical: 2.5.h))
      .px(12.w)
      .marginOnly(bottom: 12.h);
}

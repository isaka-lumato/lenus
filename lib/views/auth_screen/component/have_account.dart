import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lenus1/utils/strings.dart';
import 'package:lenus1/utils/styles.dart';
import 'package:lenus1/views/auth_screen/signup.dart';
import 'package:velocity_x/velocity_x.dart';

alreadyHaveAccount() {
  return
      //already Have Account
      RichText(
          text: TextSpan(children: [
    TextSpan(
        text: "already have account ",
        style: TextStyle(
          fontFamily: semibold,
          color: Colors.black,
        )),
    TextSpan(
        text: APPCONST.signin,
        style: TextStyle(
          fontFamily: semibold,
          color: Colors.blueAccent,
        )),
  ])).onTap(() {
    Get.to(() => const SignUp());
  });
}

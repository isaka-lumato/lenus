import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lenus1/controllers/auth/auth_controller.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/strings.dart';
import 'package:lenus1/views/Authentication/signin.dart';
import 'package:velocity_x/velocity_x.dart';

class Headertext extends StatelessWidget {
  const Headertext({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(top: AppConstants.ph6, left: AppConstants.pw16),
          child: Text(
           AppConstants.appBarMainText,
            style: TextStyle(
                fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ).onTap(() async {
          await Get.put(AuthController()).signoutMethod(context);
          Get.offAll(() => SignIn());
          VxToast.show(context, msg: APPCONST.loggedOut);
        }),
      ],
    );
  }
}

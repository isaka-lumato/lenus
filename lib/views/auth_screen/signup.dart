import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lenus1/component/app_background.dart';
import 'package:lenus1/component/hide_keyboard.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/views/auth_screen/component/background.dart';
import 'package:lenus1/views/auth_screen/component/logo_auth.dart';
import 'package:lenus1/views/auth_screen/component/sign_up_form.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return appBackground(
      child: SizedBox(
        height: AppConstants.fullHeight(),
        child: hideKeyboard(
              context: context,
              child:Stack(
          children: [
            stackedBG(context),
            Positioned(left: -20.w, child: bgGlass()),
            Positioned(left: ScreenUtil().screenWidth * 0.05, bottom: ScreenUtil().screenHeight * 0.18, child: 
             Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    authLogo(),
                    75.h.heightBox,
                    _buildLoginContainer(),
                  ]),),
            
          ],),
        ),
      ),
    );
  }

  Widget _buildLoginContainer() {
    return GlassmorphicContainer(
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
      width: ScreenUtil().screenWidth * 0.9,
      height: ScreenUtil().screenHeight * 0.6,
      borderRadius: 20.h,
      blur: 16,
      alignment: Alignment.bottomCenter,
      border: 0.2.r,
      linearGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            const Color(0xFFFFFFFF).withAlpha(51),
            const Color(0xFF040914).withAlpha(51),
            const Color(0xFFFFFFFF).withAlpha(51),
          ],
          stops: const [
            0.1,
            0.7,
            1,
          ]),
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x33FFFFFF),
          Color(0x33FFFFFF),
        ],
      ),
      child: SignUpForm()
    );
  }
}

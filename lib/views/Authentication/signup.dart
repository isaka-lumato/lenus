import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lenus1/controllers/auth/auth_controller.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/views/Authentication/components/my_button.dart';
import 'package:lenus1/views/Authentication/components/my_textfield.dart';
import 'package:lenus1/views/Authentication/forgetpassword.dart';
import 'package:lenus1/views/Authentication/signin.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  SignUp({super.key});

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppConstants.fullHeight(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/image/bg_auth.jpg",
                width: AppConstants.fullWidth(),
                height: AppConstants.fullHeight(),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: AppConstants.ph100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppConstants.fullHeight() * 0.05),
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: AppConstants.fullHeight() * 0.26),
                    const Text("Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: AppConstants.fullHeight() * 0.02),
                    ClipRect(
                      child: BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 0, 0, 0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          width: AppConstants.fullWidth() * 0.94,
                          //margin: EdgeInsets.only(bottom: AppConstants.fullHeight() * 0.2),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    "Look like you don't have an account. Let's create a new account",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 30),
                                MyTextField(
                                  controller: authController.nameController,
                                  hintText: 'Name',
                                  obscureText: false,
                                ),
                                SizedBox(height: AppConstants.ph10),
                                MyTextField(
                                  controller: authController.emailController,
                                  hintText: 'Email',
                                  obscureText: false,
                                ),
                                SizedBox(height: AppConstants.ph10),
                                MyPasswordTextField(
                                  controller:
                                      authController.passwordController,
                                  hintText: 'Password',
                                  obscureText: true,
                                ),
                                SizedBox(height: AppConstants.ph10),
                                MyPasswordTextField(
                                  controller: authController
                                      .confirmPasswordController,
                                  hintText: 'Confirm Password',
                                  obscureText: true,
                                ),
                                const SizedBox(height: 30),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: '',
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                'By selecting Agree & Continue below, I agree to our ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          TextSpan(
                                              text:
                                                  'Terms of Service and Privacy Policy',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 71, 233, 133),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    MyButtonAgree(
                                      text: "Agree and Sign Up",
                                      onTap: () {
                                        authController.signupMethod(
                                          context: context,
                                          name: authController
                                              .nameController.text,
                                          email: authController
                                              .emailController.text,
                                          password: authController
                                              .passwordController.text,
                                          retypePassword: authController
                                              .confirmPasswordController.text,
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 10),

                                    // not a member? register now
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                'Don\'t have an account?',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                textAlign: TextAlign.start,
                                              ),
                                              const SizedBox(width: 4),
                                              const Text(
                                                'Sign In',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 71, 233, 133),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ).onTap(
                                                () {
                                                  Get.to(() => SignIn());
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  AppConstants.fullHeight() *
                                                      0.01),
                                          const Text('Forgot Password?',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 71, 233, 133),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                  textAlign: TextAlign.start)
                                              .onTap(
                                            () {
                                              Get.to(() => ForgetPassword());
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

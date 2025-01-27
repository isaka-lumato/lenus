
import 'package:flutter/material.dart';
import 'package:lenus1/utils/app_theme.dart';

Widget appBackground(
    {Widget? child,
    Widget? bottomNavigationBar,
    List<Color> customColors = const [
      Color(0xffF4F4F4),
      Color(0xffdcebff),
      Color(0xffF4F4F4),
    ],
    Widget? floatingActionButton}) {
  return Container(
      height: AppConstants.fullHeight(),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: customColors,
        tileMode: TileMode.mirror,
        stops: const [0, 0.5, 1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: child,
      ));
}

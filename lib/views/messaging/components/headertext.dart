import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lenus1/utils/app_theme.dart';

class Headertext extends StatelessWidget {
  const Headertext({Key? key}) : super(key: key);

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
        ),
      ],
    );
  }
}

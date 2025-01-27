import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lenus1/utils/colors.dart';
import 'package:lenus1/utils/images.dart';

authLogo() {
    return SvgPicture.asset(svgLogo,
        width: ScreenUtil().screenWidth - 200.w,
        colorFilter: const ColorFilter.mode(blueColor, BlendMode.srcIn),
        semanticsLabel: 'REX trends logo');
  }
import 'package:lenus1/component/extentions.dart';
import 'package:lenus1/utils/const.dart';

Widget ourButton(
    {onTap,
    List<Color> color = const [Color(0xFF85A0FF), Color(0xFF83E9FF)],
    List<Color> colorBorder = const [Color(0xFF85A0FF), Color(0xFF83E9FF)],
    List<double> colorArr = const [0.1, 1],
    textColor = textDark,
    required String title,
    fontFamily = medium,
    border = 14.0}) {
  return GlassmorphicContainer(
    padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
    width: ScreenUtil().screenWidth,
    height: 60.h,
    borderRadius: border,
    blur: 30.r,
    alignment: Alignment.bottomCenter,
    border: 0.5.r,
    linearGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight,
        colors: color,
        stops: colorArr),
    borderGradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: colorBorder,
    ),
    child: title.text
        .size(24.sp)
        .color(textColor)
        .fontFamily(medium)
        .fontWeight(FontWeight.w900)
        .makeCentered(),
  ).ripple(onTap);
}

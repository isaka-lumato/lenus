import 'package:lenus1/component/extentions.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/const.dart';

Widget appSreenTitleBar({
  String title = "",
  IconData iconR = Icons.edit,
  bool isNoIconR = false,
  onTap,
  bool isFav = false,
  textColor
}) {
  return SafeArea(
    child: SizedBox(
      height: 70.h,
      width: ScreenUtil().screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIcon(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () {
                Get.back();
              }),
          _buildPageTitle(title: title , textColor: textColor),
          isNoIconR == true
              ? Container(
                  width: 40,
                )
              : Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        right: -80.w,
                        child: Container()
                            .p(45)
                            .box
                            .roundedFull
                            .border(
                                color: const Color(0xFFBFDDFF).withAlpha(90),
                                width: 1.5.h)
                            .make()
                            .p(25.w)
                            .box
                            .roundedFull
                            .border(
                                color: const Color(0xFFBFDDFF).withAlpha(70),
                                width: 1.5.h)
                            .make()
                            .p(25.w)
                            .box
                            .roundedFull
                            .border(
                                color: const Color(0xFFBFDDFF).withAlpha(30),
                                width: 1.5.h)
                            .make()),
                    _buildIcon(icon: iconR, onTap: onTap),
                  ],
                ),
        ],
      ),
    ),
  );
}

Widget _buildIcon({required IconData icon, required Function onTap, colors = const[blueColor,Color(0xFF73B3FC)], iconColor = textDark }) {
  return GlassmorphicContainer(
    padding: AppTheme.padding,
    width: 40.w,
    height: 40.h,
    borderRadius: 20,
    blur: 40,
    alignment: Alignment.bottomCenter,
    border: 0.5.r,
    linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
        stops: const [0.08, 0.92],
        tileMode: TileMode.clamp,
        transform: const GradientRotation(180)),
    borderGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFFFFFFFF).withAlpha(1),
        const Color(0xFF73B3FC).withAlpha(4),
      ],
    ),
    child: Center(
      child: Icon(
        icon,
        size: 18.sp,
        color: iconColor,
      ),
    ),
  ).ripple(onTap);
}

Widget _buildPageTitle({required String title , textColor }) {
  return title.text
      .textStyle(AppTheme.h1Style)
      .color(textColor)
      .make();
}

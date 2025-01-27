
import 'package:lenus1/component/core/app_text.dart';
import 'package:lenus1/utils/const.dart';

Widget dashBoardButton({
  required String imagePath,
  required String text1,
  required String text2,
}) {
  return Container(
    decoration: BoxDecoration(
      color: LightColor.background,
      borderRadius: BorderRadius.circular(15.r),
      boxShadow: const [
        BoxShadow(color: Color(0x0C3C7FFD), blurRadius: 40, spreadRadius: 5),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TitleText1(
                text: text1,
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                fontFamily: bold,
              ),
              TitleText1(
                text: text2,
                fontSize: 22.sp,
                color: const Color(0xff282cff),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 20.h,
                left: 20.w,
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: const Color(0xff282cff).withAlpha(30),
                ),
              ),
              Image.asset(
                imagePath,
                height: 45.h,
                width: 45.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

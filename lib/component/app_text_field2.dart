
import '../utils/const.dart';

Widget textField(
    {labelText,
    hintText,
    controller,
    onPressed,
    suffixIcon,
    multline = false,
    keyboardType}) {
  bool isMultline = false;
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    // Email
    labelText
        .toString()
        .text
        .capitalize
        .size(16.sp)
        .fontFamily(medium)
        .make()
        .py(4.h),
    SizedBox(
      height: isMultline == multline ? 40.h : 80.h,
      child: TextFormField(
        maxLines: isMultline == multline ? 1 : 5,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: multline,
          fillColor: blueColor.withAlpha(10),
          contentPadding: isMultline == multline
              ? EdgeInsets.symmetric(vertical: 14.h)
              : EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              suffixIcon,
              size: 14.sp,
            ),
          ),
        ),
      ),
    ),
    20.h.heightBox,
  ]);
}

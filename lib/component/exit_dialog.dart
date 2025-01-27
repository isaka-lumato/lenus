import 'package:flutter/services.dart';
import 'package:lenus1/component/our_button.dart';
import 'package:lenus1/utils/const.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkBlueColor).make(),
        10.heightBox,
        "Are sure you want to exit?"
            .text
            .fontFamily(bold)
            .size(16.sp)
            .color(darkBlueColor)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                color: [
                  const Color(0xFF85A0FF).withOpacity(0.2),
                  const Color(0xFF83E9FF).withOpacity(0.2),
                ],
                onTap: () {
                  SystemNavigator.pop();
                },
                textColor: whiteColor,
                title: "Confirm"),
            ourButton(
                color: [
                  const Color(0xFF85A0FF).withOpacity(0.2),
                  const Color(0xFF83E9FF).withOpacity(0.2),
                ],
                onTap: () {
                  Navigator.pop(context);
                },
                textColor: whiteColor,
                title: "Cancel"),
          ],
        )
      ],
    ).box.color(whiteColor).roundedSM.p16.make(),
  );
}

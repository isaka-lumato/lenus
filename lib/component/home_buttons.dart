
import 'package:lenus1/utils/const.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 26),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkBlueColor).make()
    ],
  ).box.rounded.white.size(width, height).make();
}

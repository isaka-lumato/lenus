import 'package:lenus1/utils/const.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        APPCONST.signup.text
            .fontFamily(bold)
            .fontWeight(FontWeight.w700)
            .lineHeight(1.5)
            .color(textDark)
            .size(32.sp)
            .make()
      ],
    );
  }
}

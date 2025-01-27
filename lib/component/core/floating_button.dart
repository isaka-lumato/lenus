
import 'package:lenus1/utils/const.dart';

Widget appFloatingActionButton({required onPress}) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        elevation: 1,
        backgroundColor: blueColor.withAlpha(210),
        hoverColor: blueColor,
        onPressed: onPress,
        child: const Icon(Icons.add, color: whiteColor),
      ),
    );
  }
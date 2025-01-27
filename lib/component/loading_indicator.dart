
import 'package:lenus1/utils/const.dart';

Widget loadingIndicator({circleColor = darkPurpleColor}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(circleColor),
      ),
    ),
  );
}

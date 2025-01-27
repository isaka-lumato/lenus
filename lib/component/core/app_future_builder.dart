import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lenus1/component/loading_indicator.dart';
import 'package:lenus1/component/widget_background.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/const.dart';

class AppFutureBuilder extends StatelessWidget {
  final Future<QuerySnapshot<Object?>>? future;
  final Widget Function(AsyncSnapshot<QuerySnapshot<Object?>>)? builder;
  const AppFutureBuilder(
      {super.key, required this.future, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error! ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return widgetBG(
              child: Center(
                child: loadingIndicator(),
              ),
            );
          }

          if (snapshot.hasData == false) {
            return widgetBG(
                child: loadingIndicator(), height: AppConstants.fullHeight() * 0.6);
          }

          if (!snapshot.hasData) {
            return widgetBG(
              child: "No order yet"
                  .text
                  .color(darkBlueColor)
                  .size(20.sp)
                  .makeCentered(),
              height: AppConstants.fullHeight() * 0.6,
            );
          }
          // build UI using updated datas
          return builder!(snapshot);
        });
  }
}

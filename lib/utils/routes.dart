import 'package:get/get.dart';
import 'package:lenus1/views/Authentication/signin.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';

class Routes {
  static const String home = '/home';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String chat = '/chat';
  static const String profile = '/profile';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => Messaging(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.signin,
      page: () => SignIn(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.signup,
      page: () => SignIn(),
      transition: Transition.fadeIn,
    ),
  ];
}

import 'package:get/get.dart';
import 'package:lenus1/views/auth_screen/signup.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';
import 'package:lenus1/views/get_started/get_started_screen.dart';
import 'package:lenus1/views/profile/profile_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String getStarted = '/get-started';
  static const String home = '/home';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String chat = '/chat';
  static const String profile = '/profile';

  static String getGetStarted() => getStarted;
  static String getInitial() => initial;
  static String getHome() => home;
  static String getSignin() => signin;
  static String getSignup() => signup;
  static String getChat() => chat;
  static String getProfile() => profile;


  static List<GetPage> routes = [
    GetPage(
      name: RouteHelper.initial,
      page: () => SignUp(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteHelper.getStarted,
      page: () => SignUp(),
      transition: Transition.fadeIn,
    ),

    //As for now messaging screen is the home screen
    GetPage(
      name: RouteHelper.home,
      page: () => Messaging(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteHelper.signin,
      page: () => SignUp(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteHelper.signup,
      page: () => SignUp(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteHelper.chat,
      page: () => ChatPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteHelper.profile,
      page: () => ProfileScreen(),
      transition: Transition.fadeIn,
    ),




  ];
}

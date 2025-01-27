import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show runApp;
import 'package:lenus1/controllers/Layout/navigation_bar_model.dart';
<<<<<<< HEAD
import 'package:lenus1/controllers/auth/auth_controller.dart';
import 'package:lenus1/controllers/profile/profile_controller.dart';
import 'package:lenus1/firebase_options.dart';
import 'package:lenus1/utils/const.dart'
    show BuildContext, Get, GetMaterialApp, Inst, ScreenUtilInit, Size, State, StatefulWidget, ThemeData, VisualDensity, Widget, WidgetsFlutterBinding, darkBlueColor;
=======
import 'package:lenus1/views/layouts/layout.dart';
>>>>>>> 955a3562acbffc14b1b4722d1a5a6bb65b73f226

import 'package:lenus1/utils/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    Get.put(AuthController());
    Get.put(ProfileController());
    Get.put(NavigationBarTabsController());

    runApp(const MyApp());
  } catch (e) {
    // Handle the error appropriately (e.g., log, display error message)
    if (kDebugMode) {
      print('//////////////display error message $e///////////////');
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedin = false;

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        setState(() {
          isLoggedin = false;
        });
        if (kDebugMode) {
          print('User is currently signed out!');
        }
      } else {
        setState(() {
          isLoggedin = true;
        });
        if (kDebugMode) {
          print('User is signed in!');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(448, 997.33),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lenus Super App',
          theme: ThemeData(
            primaryColor: darkBlueColor,
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Montserrat',
          ),
          initialRoute: isLoggedin
              ? RouteHelper.getGetStarted()
              : RouteHelper.getInitial(),
          getPages: RouteHelper.routes,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenus1/controllers/Layout/navigation_bar_model.dart';
import 'package:lenus1/views/layouts/component/navigation_bar.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';
import 'package:lenus1/views/profile/profile_screen.dart';

class AppLayouts extends GetView<NavigationBarTabsController> {
  const AppLayouts({super.key});

  static List<Widget> tabPages = [
    //pages
    Messaging(),
    ChatPage(), Messaging(), ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
            top: false,
            child:
                tabPages[NavigationBarTabsController.to.selectedIndex.value]),
      ),
      bottomNavigationBar: const NavigationBarView(),
    );
  }
}

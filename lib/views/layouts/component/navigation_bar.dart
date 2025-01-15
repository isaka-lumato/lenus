import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lenus1/controllers/Layout/navigation_bar_model.dart';
import 'package:lenus1/utils/app_color.dart';

class NavigationBarView extends GetView<NavigationBarTabsController> {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeIndex,
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: AppColor.secondaryColor,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 0
                    ? const Icon(Icons.home_rounded,
                        color: AppColor.primaryColor)
                    : const Icon(Icons.home_rounded,
                        color: AppColor.secondaryColor),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 1
                    ? const Icon(Icons.vertical_shades_closed,
                        color: AppColor.primaryColor)
                    : const Icon(Icons.vertical_shades_closed,
                        color: AppColor.secondaryColor),
                label: 'Reels',
              ),
              BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 2
                    ? const Icon(Icons.layers, color: AppColor.primaryColor)
                    : const Icon(Icons.layers, color: AppColor.secondaryColor),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 3
                    ? const Icon(Icons.videocam, color: AppColor.primaryColor)
                    : const Icon(Icons.videocam,
                        color: AppColor.secondaryColor),
                label: 'Profile',
              ),
            ]));
  }
}

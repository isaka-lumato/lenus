import 'package:get/get.dart';

class NavigationBarTabsController extends GetxController {
  static NavigationBarTabsController get to => Get.find();

  final RxInt selectedIndex = 0.obs;
  final RxInt selectedtabIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }
}

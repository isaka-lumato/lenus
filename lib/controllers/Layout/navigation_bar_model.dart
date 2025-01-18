import 'package:get/get.dart';

// Define a controller class that extends GetxController for state management
class NavigationBarTabsController extends GetxController {
  // Static getter to easily access the controller instance using Get.find()
  static NavigationBarTabsController get to => Get.find();

  // Observable integer to track the selected index of the navigation bar
  final RxInt selectedIndex = 0.obs;
  
  // Observable integer to track the selected tab index (if different from selectedIndex)
  final RxInt selectedtabIndex = 0.obs;

  // Method to change the selected index, updating the observable variable
  void changeIndex(int index) {
    selectedIndex(index);
  }
}

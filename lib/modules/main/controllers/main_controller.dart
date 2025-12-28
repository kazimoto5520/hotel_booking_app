import 'package:get/get.dart';

class MainController extends GetxController {
  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void goToHome() => changeTab(0);
  void goToBookings() => changeTab(1);
  void goToFavorites() => changeTab(2);
  void goToSettings() => changeTab(3);
}
import 'package:get/get.dart';

class AppSearchController extends GetxController {
  Rx<int> selectedTab = 0.obs;

  changeTab(int index) {
    selectedTab = Rx(index);
    update();
  }
}
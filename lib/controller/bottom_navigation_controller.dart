import 'package:get/get.dart';

import '../view/Profile/profile_page.dart';
import '../view/home_page/Home_Page.dart';

class BottomNavigationController extends GetxController {
  RxList screenList = [HomePage(), ProfilePage()].obs;
  RxInt screenIndex = 0.obs;

  void indexChange({required int index}) {
    screenIndex.value = index;
  }
}

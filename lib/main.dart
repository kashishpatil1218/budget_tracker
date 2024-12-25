import 'package:budget_tracker_app/view/Profile/edite_profile.dart';

import 'package:budget_tracker_app/view/bottom_navigation/bottom_navigation_bar.dart';

import 'package:budget_tracker_app/view/home_page/search_page.dart';
import 'package:budget_tracker_app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BudgetTracker());
}

class BudgetTracker extends StatelessWidget {
  const BudgetTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/bottom',
          page: () => BottomNavigation(),
        ),
        GetPage(
          name: '/editPro',
          page: () => const EditProfile(),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchPage(),
        ),
      ],
    );
  }
}

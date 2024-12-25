import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/bottom_navigation_controller.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  var bottomNavigationController = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => bottomNavigationController
            .screenList[bottomNavigationController.screenIndex.value],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                bottomNavigationController.indexChange(index: 0);
              },
              icon: Icon(
                Icons.home,
                color: Colors.blue,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                bottomNavigationController.indexChange(index: 1);
              },
              icon: Icon(
                Icons.person,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: Icon(
            Icons.add,
            size: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

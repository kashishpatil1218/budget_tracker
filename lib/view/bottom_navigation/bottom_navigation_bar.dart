import 'package:budget_tracker_app/view/home_page/Home_Page.dart';
import 'package:budget_tracker_app/view/home_page/component/insert_dialogueBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_navigation_controller.dart';
import '../../controller/user_controller.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  final bottomNavigationController = Get.put(BottomNavigationController());

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
            Obx(() => IconButton(
              onPressed: () {
                bottomNavigationController.indexChange(index: 0);
              },
              icon: Icon(
                Icons.home,
                color: bottomNavigationController.screenIndex.value == 0
                    ? Colors.blue
                    : Colors.grey,
                size: 40,
              ),
            )),
            const SizedBox(
              width: 10,
            ),
            Obx(() => IconButton(
              onPressed: () {
                bottomNavigationController.indexChange(index: 1);

              },
              icon: Icon(
                Icons.person,
                color: bottomNavigationController.screenIndex.value == 1
                    ? Colors.blue
                    : Colors.grey,
                size: 40,
              ),
            )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          insertBox(context);
          controller.txtCategory.clear();
          controller.txtAmount.clear();
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: const Icon(
            Icons.add,
            size: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

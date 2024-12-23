import 'package:budget_tracker_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'component/filterWise_data.dart';
import 'component/insert_dialogueBox.dart';
import 'component/smart_card.dart';

var controller = Get.put(HomeController());
var bottomNavController = Get.put(BottomNavController());


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title:
            Text('Hi,Kashish Patil...', style: TextStyle(color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                controller.filterBySearch(value);
              },
              controller: controller.txtSearch,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
            ),
          ),
        ),
        //TODO
      ),
      // bottom: PreferredSize(
      //     preferredSize: const Size(double.infinity, 30),
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextField(
      //         onChanged:(value){
      //           controller.filterBySearch(value);
      //         },
      //         controller: controller.txtSearch,
      //         decoration: InputDecoration(
      //             hintText: 'Search',
      //             suffixIcon: IconButton(
      //                 onPressed: () {
      //                   controller.filterBySearch(controller.txtSearch.text);
      //                 },
      //                 icon: const Icon(
      //                   Icons.search,
      //                   color: Colors.black,
      //                 )),
      //             hintStyle: const TextStyle(color: Colors.black)),
      //       ),
      //     )),

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ////TODO for show the container
          smartCard(),
          filterWiseData(),
          SizedBox(
            height: 10,
          ),
          // Obx(
          //   () => Expanded(
          //     child: ListView.builder(
          //         itemCount: controller.budgetList.length,
          //         itemBuilder: (context, index) => Card(
          //               color: controller.budgetList[index].isIncome == 1
          //                   ? Colors.green.shade100
          //                   : Colors.red.shade100,
          //               child: ListTile(
          //                 leading: Text(
          //                   controller.budgetList[index].id.toString(),
          //                 ),
          //                 title: Text(
          //                   controller.budgetList[index].amount.toString(),
          //                 ),
          //                 subtitle: Text(
          //                     controller.budgetList[index].category! +
          //                         " - ${controller.budgetList[index].date!}"),
          //                 trailing: Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     IconButton(
          //                       onPressed: () {
          //                         editBox(
          //                             context, controller.budgetList[index]);
          //                       },
          //                       icon: Icon(Icons.edit),
          //                     ),
          //                     IconButton(
          //                       onPressed: () {
          //                         controller.deleteData(
          //                             controller.budgetList[index].id!);
          //                       },
          //                       icon: Icon(Icons.delete),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             )),
          //   ),
          // ),
           Obx(() {
            // Dynamically update the body based on selected index
            switch (bottomNavController.selectedIndex.value) {
              case 0:
                return HomePage();
              // case 1:
              //   return BalancePage();
              // case 2:
              //   return ProfilePage();
              // case 3:
              //   return SettingsPage();
              default:
                return HomePage();
            }
          }),
        ],
      ),
      bottomNavigationBar:  GNav(
        backgroundColor: Colors.grey.shade900,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade800,
        color: Colors.white,
        gap: 8,
        onTabChange: (index){

        },
        padding: EdgeInsets.all(20),
        tabs: [
          GButton(icon: Icons.home,
          text: 'Home',
          ),
          GButton(icon: Icons.money,
            text: 'Balance',
          ),
          GButton(icon: Icons.person,
            text: 'Profile',
          ),
          GButton(icon: Icons.settings,
            text: 'settings',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          insertBox(context);
          controller.txtCategory.clear();
          controller.txtAmount.clear();
          //controller.insertData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

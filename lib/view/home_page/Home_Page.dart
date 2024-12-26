import 'package:budget_tracker_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        backgroundColor: Colors.blue,
        title:
            Text('Hi,Kashish Patil...', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/search');
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ////TODO for show the container
          smartCard(),
          filterWiseData(),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                  itemCount: controller.budgetList.length,
                  itemBuilder: (context, index) => Card(
                        color: controller.budgetList[index].isIncome == 1
                            ? Colors.cyan.shade100
                            : Color(0xFFB3C8CF),
                        child: ListTile(
                          leading: Text(
                            controller.budgetList[index].id.toString(),style: TextStyle(fontSize: 19),
                          ),
                          title: Text(
                            controller.budgetList[index].amount.toString(),style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              controller.budgetList[index].category! +
                                  " - ${controller.budgetList[index].date!}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  editBox(
                                      context, controller.budgetList[index]);
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.deleteData(
                                      controller.budgetList[index].id!);
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ),

        ],
      ),
      
    );
  }
}

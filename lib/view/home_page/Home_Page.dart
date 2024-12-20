import 'package:budget_tracker_app/Helper/db_helper.dart';
import 'package:budget_tracker_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/insert_dialogueBox.dart';

var controller = Get.put(HomeController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Hi,Kashish Patil...',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.budgetList.length,
            itemBuilder: (context, index) => Card(
                  color: controller.budgetList[index].isIncome == 1
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                  child: ListTile(
                    leading: Text(controller.budgetList[index].id.toString()),
                    title: Text(controller.budgetList[index].amount.toString()),
                    subtitle: Text(controller.budgetList[index].category!),
                    trailing: IconButton(onPressed: () {
                      controller.deleteData(controller.budgetList[index].id!);
                    }, icon: Icon(Icons.delete)),
                  ),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          insertBox(context);
          //controller.insertData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



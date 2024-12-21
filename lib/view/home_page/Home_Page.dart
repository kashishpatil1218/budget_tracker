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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: Colors.green.shade100,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Income',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Text('${controller.income}/-',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                letterSpacing: 1)),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Colors.red.shade100,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Expance',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Text('${controller.expance}/-',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                letterSpacing: 1)),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.grey.shade400,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Balance',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Text('${controller.balance}/-',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                letterSpacing: 1)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    controller.fetchData();
                  },
                  child: const Text('All'),
                ),
                OutlinedButton(
                  onPressed: () {
                    controller.filterByCategory(1);
                  },
                  child: const Text('Income'),
                ),
                OutlinedButton(
                  onPressed: () {
                    controller.filterByCategory(0);
                  },
                  child: const Text('Expance'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                  itemCount: controller.budgetList.length,
                  itemBuilder: (context, index) => Card(
                        color: controller.budgetList[index].isIncome == 1
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                        child: ListTile(
                          leading: Text(
                            controller.budgetList[index].id.toString(),
                          ),
                          title: Text(
                            controller.budgetList[index].amount.toString(),
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

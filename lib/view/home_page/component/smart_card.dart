import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/user_controller.dart';
import '../Home_Page.dart';

Widget smartCard() {

  final income = 5000.0.obs;
  final expense = 2000.0.obs;
  final balance = 3000.0.obs;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: BackdropFilter(
      filter:  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade400.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            // Profile Avatar
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    height: 72,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      image: const DecorationImage(
                        image: AssetImage('asset/img/AI-Profile-Picture.jpg'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                 Obx(
                   () =>  Text(
                    (usercontroller.userList[0].name!),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                                   ),
                 )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Obx(
                      () =>  Text(
                        'Income : ${controller.income.value}/-',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20,top:5,left:1),
                    child: Obx(
                      () =>  Text(
                        'Expanse : ${controller.expance.value}/-',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),

              // Pie Chart
              Expanded(
                child: Obx(
                      () => Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 80,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: income.value,
                              color: Colors.green,
                              title: 'Income\n${controller.income.value}/-',
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              radius: 35,
                            ),
                            PieChartSectionData(
                              value: expense.value,
                              color: Colors.red,
                              title: 'Expense\n${controller.expance.value}/-',
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              radius: 35,
                            ),
                            PieChartSectionData(
                              value: balance.value,
                              color: Colors.grey,
                              title: 'Balance\n${controller.balance.value}/-',
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              radius: 35,
                            ),
                          ],
                          centerSpaceRadius: 40,
                          sectionsSpace: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],),
            SizedBox(height: 45,),
            // Legends
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildLegend('Income', Colors.green),
                buildLegend('Expense', Colors.red),
                buildLegend('Balance', Colors.grey),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}


Widget buildLegend(String label, Color color) {
  return Row(
    children: [
      Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      const SizedBox(width: 5),
      Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    ],
  );
}

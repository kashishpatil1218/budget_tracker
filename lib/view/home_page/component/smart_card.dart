// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../Home_Page.dart';
//
// Row smartCard() {
//   return Row(
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(20),
//         child: Card(
//           color: Colors.green.shade100,
//           margin: EdgeInsets.all(5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Income',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Obx(
//                     () => Text('${controller.income}/-',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         letterSpacing: 1)),
//               )
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(15),
//         child: Card(
//           color: Colors.red.shade100,
//           margin: EdgeInsets.all(5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Expance',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Obx(
//                     () => Text('${controller.expance}/-',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         letterSpacing: 1)),
//               )
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(10),
//         child: Card(
//           color: Colors.grey.shade400,
//           margin: EdgeInsets.all(5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Balance',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Obx(
//                     () => Text('${controller.balance}/-',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         letterSpacing: 1)),
//               )
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
//TODO------------------------------------------2nd
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../Home_Page.dart';
//
// Widget smartCard() {
//   final income = 5000.0.obs;
//   final expense = 2000.0.obs;
//   final balance = 3000.0.obs;
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       height: 300,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 260,top: 15),
//             child: CircleAvatar(
//               radius: 38,
//               backgroundImage: AssetImage('asset/img/AI-Profile-Picture.jpg'),
//             ),
//           ),
//
//         ],
//       ),
//     ),
//   );
// }
//TODo ---------------------------------------------------------------------3rd
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Home_Page.dart';

Widget smartCard() {
  // Mock data for income, expense, and balance
  final income = 5000.0.obs;
  final expense = 2000.0.obs;
  final balance = 3000.0.obs;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 250, // Adjust height to accommodate the chart
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Profile Avatar
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Container(
                  height: 72,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      image: const DecorationImage(
                          image: AssetImage('asset/img/AI-Profile-Picture.jpg'),),),

                ),
              ),
              const SizedBox(width: 20,),
              const Text('kashish patil',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))
            ],
          ),

          // Pie Chart
          Obx(
            () => SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(left:170,bottom: 20),
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: income.value,
                        color: Colors.green.shade300,
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
                        color: Colors.red.shade300,
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
                        color: Colors.grey.shade400,
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
          const SizedBox(height:16),

          // Legends
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildLegend('Income', Colors.green.shade300),
              buildLegend('Expense', Colors.red.shade300),
              buildLegend('Balance', Colors.grey.shade400),
            ],
          ),
        ],
      ),
    ),
  );
}

// Helper widget for the legend
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

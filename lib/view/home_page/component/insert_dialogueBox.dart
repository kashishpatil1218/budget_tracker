import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Home_Page.dart';


Future<void> insertBox(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) =>  AlertDialog(
      title: const Text('Add Record'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller.txtAmount,
            decoration: const InputDecoration(
              hintText: 'Amount',
            ),
          ),
          TextField(
            controller: controller.txtCategory,
            decoration: const InputDecoration(
              hintText: 'category',
            ),
          ),
          Obx(() => SwitchListTile(title:Text('Income'),value: controller.isIncome.value, onChanged: (value) {
            controller.switchOfIsIncome(value);
          },),)
        ],
      ),
      actions: [
        TextButton(onPressed: () {
          Get.back();
        }, child: Text('Cancle')),
        TextButton(onPressed: () {
          int isIncome = controller.isIncome.value?1:0;
          controller.insertData(double.parse(controller.txtAmount.text),controller.txtCategory.text,isIncome);
          Get.back();
        }, child: Text('Add'))
      ],
    ),
  );
}
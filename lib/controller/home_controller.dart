import 'package:budget_tracker_app/Helper/db_helper.dart';
import 'package:budget_tracker_app/modal/budget_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../view/home_page/Home_Page.dart';

class HomeController extends GetxController{

  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtCategory = TextEditingController();

  RxList<Budget> budgetList = <Budget>[].obs;
  RxBool isIncome = false.obs;//for dialogue box switch--------------------------------------------
  @override
  void onInit()
  {
    // implement onInit----------------------------------------------------------
    DbHelper.dbHelper.database;
    fetchData();
    super.onInit();
  }
// for dialogue box switch---------------------------------------------------------------------------
  void switchOfIsIncome(bool value)
  {
          isIncome.value = value;
  }

  Future<void> insertData(double amount,String category,int isIncome)
  async {
    await DbHelper.dbHelper
        .insertRecords(amount, category, DateTime.now().toString(), isIncome);
    controller.fetchData();
  }

  //for delete---------------------------------------------------------------------
  Future<void> deleteData(int id)
  async {
    await  DbHelper.dbHelper.deleteRecord(id);
    fetchData();
  }
//--------------------------
  Future<void> fetchData()
  async {
     List records = await DbHelper.dbHelper.fetchRecords();
     budgetList.value = records.map((e)=>Budget.fromMap(e)).toList();
  }
}
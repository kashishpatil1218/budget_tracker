

import 'package:budget_tracker_app/Helper/db_helper.dart';
import 'package:budget_tracker_app/modal/budget_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../view/home_page/Home_Page.dart';

class HomeController extends GetxController {
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtSearch = TextEditingController();

  RxList<Budget> budgetList = <Budget>[].obs;
  RxBool isIncome = false.obs; // todo: for dialogue box switch
  RxDouble income = 0.0.obs;
  RxDouble expance = 0.0.obs;
  RxDouble balance = 0.0.obs;
  RxList user = [].obs;
  @override
  void onInit() {
    /// todo: implement onInit----------------------------------------------
    DbHelper.dbHelper.database;
    fetchData();

    super.onInit();
  }



  /// todo: for dialogue box switch----------------------------------------------
  void switchOfIsIncome(bool value) {
    isIncome.value = value;
  }

  Future<void> insertData(double amount, String category, int isIncome) async {
    DateTime date = DateTime.now();
    await DbHelper.dbHelper
        .insertRecords(amount, category, '${date.day}-${date.month}-${date.year}', isIncome);
    controller.fetchData();
  }

  /// todo: for delete----------------------------------------------
  Future<void> deleteData(int id) async {
    await DbHelper.dbHelper.deleteRecord(id);
    await fetchData();
  }

  /// todo: fetch data----------------------------------------------
  Future<void> fetchData() async {
    List records = await DbHelper.dbHelper.fetchRecords();
    budgetList.value = records.map((e) => Budget.fromMap(e)).toList();
    calculateBalance();
  }

  Future<void> updateData(int id,isIncome, double amount,category)
  async {
    DateTime date = DateTime.now();
    await DbHelper.dbHelper.updateRecord(id, isIncome, amount, '${date.day}-${date.month}-${date.year}', category);
    await fetchData();
  }

  // TODO : for filtretion of category--------------------------------
  Future<void> filterByCategory(int isIncome)
  async {
    List records = await DbHelper.dbHelper.filterCategory(isIncome);
    budgetList.value = records.map((e) => Budget.fromMap(e)).toList();
  }

  // TODO filter by search------------------------------------------------------------------

  Future<void> filterBySearch(String search)
  async {
    List data = await DbHelper.dbHelper.filterBySearch(search);
    budgetList.value = data.map((e)=> Budget.fromMap(e)).toList();
  }

  Future<void>  calculateBalance()
  async {
   income.value = 0;
   expance.value = 0;
   balance.value = 0;


    for(var record in budgetList)
      {
         if(record.isIncome==1)
           {
             income.value += record.amount!;
           }
         else
           {
             expance.value += record.amount!;
           }

      }
    balance.value = income.value - expance.value;
  }







}


class BottomNavController extends GetxController {

  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

// TODO radio----------------
class GenderController extends GetxController {

  var selectedGender = ''.obs;


  void setGender(String gender) {
    selectedGender.value = gender;
  }
}


import 'package:budget_tracker_app/Helper/user_db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

var usercontroller = Get.put(UserController());

class UserController extends GetxController{

  var txtName= TextEditingController();
  var txtEmail= TextEditingController();
  var txtPhone= TextEditingController();
  var txtAge= TextEditingController();

  @override
  void onInit()
  {
      super.onInit();
      UserDbHelper.userDbHelper.database;
  }


  Future<void> registerUser(String name,email,phone,age)
  async {
     await UserDbHelper.userDbHelper.insertData(name, email, phone,age);
  }
}
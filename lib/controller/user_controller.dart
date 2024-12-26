import 'dart:typed_data';

import 'package:budget_tracker_app/Helper/user_db_helper.dart';
import 'package:budget_tracker_app/modal/user_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

var usercontroller = Get.put(UserController());

class UserController extends GetxController {
  var txtName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPhone = TextEditingController();
  var txtAge = TextEditingController();

  RxList<UserModal> userList = <UserModal>[].obs;
  Uint8List?  image;
  RxBool isImage = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserdata();
    UserDbHelper.userDbHelper.database;
  }

  Future<void> registerUser(String name, email, phone, age) async {
    await UserDbHelper.userDbHelper.insertData(name, email, phone, age);
  }

  void updateUser(
      {required String name,
      required String email,
      required String phone,
      required String age,
      required Uint8List img})
  {
    UserDbHelper.userDbHelper.upadteData(name, email, phone, age, img);
    fetchUserdata();
  }

  Future<void> fetchUserdata() async {
    List data = await UserDbHelper.userDbHelper.fetchUserData();
    userList.value = data.map((e) => UserModal.fromMap(e)).toList();
  }
}

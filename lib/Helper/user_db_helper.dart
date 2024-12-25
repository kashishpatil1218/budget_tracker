import 'package:budget_tracker_app/Helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class UserDbHelper
{
  UserDbHelper._();
  static UserDbHelper userDbHelper = UserDbHelper._();
  Database? _database;

  Future<Database?> get  database async => _database ?? await  DbHelper.dbHelper.createDatabase();

  Future<void> insertData(String name,email,phone,age)
  async {
    Database? db = await database;
    String sql ="INSERT INTO user(name,email,phone,age) VALUES(?,?,?,?)";
    List args = [name,email,phone];
    await  db!.rawInsert(sql,args);

  }
}
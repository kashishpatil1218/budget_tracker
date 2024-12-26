

import 'dart:typed_data';


import 'package:budget_tracker_app/Helper/db_helper.dart';
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
    List args = [name,email,phone,age];
    await db!.rawQuery(sql,args);

  }

  Future<void> upadteData(String name,email,phone,age,Uint8List img)
  async {
    Database? db = await database;
    String sql = "UPDATE user SET name=?,email=?, phone=?,age=?,img=? WHERE id=1";
    List args = [name,email,phone,age,img];
    await db!.rawUpdate(sql,args);
  }

  Future<List<Map<String, Object?>>> fetchUserData()
  async {
    Database? db= await database;
    String sql = '''SELECT * FROM user''';
    return await db!.rawQuery(sql);
  }
} 
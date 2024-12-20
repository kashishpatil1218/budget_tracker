import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper
{
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();

  Database? _database;
 final  String  _tableName= "budget";

  Future<Database?> get database async => _database ?? await createDatabase();

  Future<Database?> createDatabase()
  async{
    var dbPath = await getDatabasesPath();
    var path = join(dbPath,'budget.db');

    _database = await openDatabase(path,version: 1,onCreate: (db, version) async{

      String query = ''' CREATE TABLE budget(
      id iNTEGER PRIMARY KEY AUTOINCREMENT,
      amount REAL,
      isIncome INTEGER,
      date TEXT,
      category TEXT
      )''';

      await db.execute(query);
    });
    return _database;
  }
// for Insert the data------------------------------------------------------------------------------------------------------------
 Future<void> insertRecords(double amount,String category,String date,int isIncome)
  async{
    Database? db = await database;
    String query = '''INSERT INTO $_tableName (amount,category,date,isIncome)
    VALUES(?,?,?,?)
    ''';
    List args = [amount,category,date,isIncome];
    await db!.rawInsert(query,args);
  }

  // read / fethch the data------------------------------------------------------------------------------------------------
   Future<List<Map<String, Object?>>> fetchRecords()
   async {
       Database? db = await database;
       String query = '''SELECT * FROM $_tableName''';
       return await db!.rawQuery(query);
   }

   // delete the data----------------------------------------------------------------------------------------
Future<void> deleteRecord(int id )
async {
  Database? db = await database;
  String query= '''DELETE FROM $_tableName WHERE id = ?''';
  List args = [id];
  await db!.rawDelete(query,args);
}

}
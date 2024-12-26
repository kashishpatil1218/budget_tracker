


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

      String query = ''' CREATE TABLE $_tableName(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      amount REAL,
      isIncome INTEGER,
      date TEXT,
      category TEXT
      )''';
// TODO second table---------------------------------------
      String userQuery = '''CREATE TABLE user(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      phone TEXT,
      age TEXT,
      img BLOB
      )''';

      await db.execute(query);
      await db.execute(userQuery);
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
// TODO : foe upadte the data
Future<void> updateRecord(int id,isIncome, double amount,String date,category)
async {
    Database? db = await database;
    String query = '''UPDATE $_tableName SET amount = ?,category = ?, IsIncome = ?, date = ? WHERE id = ?''';
    List args = [amount,category,isIncome,date,id];
    await db!.rawUpdate(query,args);
}

Future<List<Map<String, Object?>>> filterCategory(int isIncome)
async {
    Database? db = await  database;
    String query = "SELECT * FROM $_tableName WHERE isIncome=?";
    List args = [isIncome];
   return await  db!.rawQuery(query,args);
}

//TODO for search category-------------------------------------------------------------
Future<List<Map<String, Object?>>> filterBySearch(String search)
async {
      Database? db = await database;
      String query = "SELECT * FROM $_tableName WHERE category LIKE '$search%'";
      //List args = [search];
     return await db!.rawQuery(query);
}


}
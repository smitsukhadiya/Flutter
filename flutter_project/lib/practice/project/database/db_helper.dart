import 'package:flutter_practical/practice/project/model/category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  static final String dbName = 'shoppio.db';

  static int dbVersion = 1;

  static final String tableCategory = 'category';

  static final String _id = 'id';
  static final String _title = 'title';
  static final String _desc = 'description';
  static final String _image = 'imagePath';
  static final String _date = 'date';

  static Database? database;

  Future<Database?> getDatabase() async {
    if(database == null){
     database = await createDatabase();
    }
    return database;
  }

  Future<Database> createDatabase() async {

    //var path = await getDatabasesPath();
  var path = join(await getDatabasesPath(),dbName);
    return await openDatabase(
        path,
        version: dbVersion,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $tableCategory('
              '$_id INTEGER PRIMARY KEY AUTOINCREMENT'
              '$_title TEXT,'
              '$_desc TEXT,'
              '$_image TEXT,'
              '$_date INTEGER)'
        );
      },
    );
  }

  Future<int?> insert(Category category) async {
    final db = await getDatabase();
    return await db?.insert(tableCategory,category.toMap());
  }
}
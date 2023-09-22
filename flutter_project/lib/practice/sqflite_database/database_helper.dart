import 'package:flutter_practical/practice/sqflite_database/item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String dbName = 'item.db';

  static int dbVirsion = 1;

  static final String dbTable = 'itemTable';

  static final String _id = 'id';
  static final String _name = 'name';
  static final String _email = 'email';
  static final String _number = 'number';

  static Database? database;

  Future<Database?> getDatabase() async {
    if (database == null) {
      database = await createDatabase();
    }
    return database;
  }

  createDatabase() async {
    var path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      version: dbVirsion,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $dbTable('
            '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$_name TEXT,'
            '$_email TEXT,'
            '$_number TEXT)');
      },
    );
  }

  Future<int?> insert(ItemModel itemModel) async {
    final db = await getDatabase();
    return await db?.insert(dbTable, itemModel.toMap());
  }

  Future<List<ItemModel>?> getItem() async {
    final db = await getDatabase();
    var result = await db?.query(dbTable);
    return result?.map((e) => ItemModel.fromMap(e)).toList();
  }

  Future<int?> update(ItemModel itemModel) async {
    final db = await getDatabase();
    return await db?.update(dbTable,
        itemModel.toMap(),
        where: 'id = ?',
        whereArgs: [itemModel.id]
    );
  }

  Future<int?> delete(int id) async {
    final db = await getDatabase();
    return await db?.delete(dbTable,
        where: 'id = ?',
        whereArgs: [id]
    );
  }
}

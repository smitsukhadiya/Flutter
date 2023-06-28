import 'package:flutter_sqlite_database/Database/Model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  // database name and version
  static const _dbname = "contact.db";
  static const _dbversion = 1;

  //table name

  static const _tableUser = "user";

  //column name

  static const _columnID = "id";
  static const _columnName = "name";
  static const _columnEmail = "email";
  static const _columnContact = "contact";
  static const _columnAge = "age";

  DatabaseHelper._init();

  static final DatabaseHelper instance = DatabaseHelper._init();

  //only have a single app-wide reference to the database
  static Database? _database;

  Future<Database?>get database async {
    if(_database!=null)return _database;
    _database = await _initDatabase();
    return _database;
  }
  Future<Database>_initDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath,_dbname);

  return await openDatabase(
      path,
      version: _dbversion,
    onCreate: (db, version) {
      db.execute('''
      create table $_tableUser(
      $_columnID integer primary key autoincrement,
      $_columnName text not null,
      $_columnEmail text not null,
      $_columnContact text not null,
      $_columnAge integer not null
      )
      ''');
    },
  );
  }
  Future<int?>intsertUser(User user)async{
    Database? db = await database;
  return await  db?.insert(_tableUser, user.toMap(),conflictAlgorithm:ConflictAlgorithm.replace);
  }
  Future<List<User>> getUserList() async {
    Database? db = await database;
   List<Map<String,dynamic?>> list = await db!.query(_tableUser);
   List<User>userList = List.generate(list.length, (index) => User.fromMap(list[index])).toList();
    return userList;
  }

  Future<int> updateUser(User user)
  async {
    Database? db = await  database;
   return await db!.update(_tableUser, user.toMap(),where:"$_columnID = ?",whereArgs: [user.id] );
  }
  Future<int>deleteUser(int? id) async {
    Database? db = await database;
    return await db!.delete(_tableUser,where:"$_columnID = ?",whereArgs:[id]);
  }
  Future<User> getUserbyId(int id) async {
    Database? db = await database;
   var list = await db!.query(_tableUser,where:"$_columnID = ?",whereArgs:[id]);
   var userList = list.map((e) => User.fromMap(e)).toList();
   return userList[0];
  }

 /* Future<List<User>> readUserList()async{
    Database? db = await database;
    //db!.rawQuery("select * from $_tableUser");
    //query tablefor all the user.
    final List<Map<String,Object?>>? maps = await db?.query(_tableUser);
    
    //Convert the List<Map<String,dynamic> into a List<User>.
   return  List.generate(maps!.length, (i) =>
    User(
        id: maps[i]['id'] as int,
        name:maps[i]['name'] as String,
        email: maps[i]['email'] as String,
        contact:maps[i]['contact'] as String,
        age: maps[i]['age'] as int
    ),
    );
  }*/
}
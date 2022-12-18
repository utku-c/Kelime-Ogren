import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/kelime_model.dart';

class MyDatabaseHelper {
  static const _databaseName = "kelimeDb2";
  static const _databaseVersion = 1;
  static const _tableName = "kelime_table";
  static const columnId = "id";
  static const columnEng = "engKelime";
  static const columnTr = "trKelime";
  static const columnKayit = "kaydedilsinMi";

  MyDatabaseHelper._myPrivateConstructor();
  static final MyDatabaseHelper instance =
      MyDatabaseHelper._myPrivateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = (await _initDatabase()) as Database?;
    return null;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tableName(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnEng TEXT NOT NULL,
      $columnTr TEXT NOT NULL,
      $columnKayit INTEGER NOT NULL
    )
    ''');
  }

  Future<int?> insert(KelimeModel kelimeModel) async {
    Database? db = await instance.database;

    return await db?.insert(_tableName, {
      "engKelime": kelimeModel.engKelime,
      "trKelime": kelimeModel.trKelime,
      "kaydedilsinMi": kelimeModel.kaydedilsinMi,
    });
  }

  Future<int?> update(KelimeModel kelimeModel) async {
    Database? db = await instance.database;

    int id = kelimeModel.toMap()["id"];
    return await db?.update(
      _tableName,
      kelimeModel.toMap(),
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }

  Future<int?> delete(int id) async {
    Database? db = await instance.database;
    return await db?.delete(
      _tableName,
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>?> queryRows(String name) async {
    Database? db = await instance.database;
    return await db?.query(_tableName, where: "$columnTr LIKE '%$name%'");
  }

  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    if (db != null && db.isOpen == true) {
      return await db.query(_tableName);
    } else {
      return null;
    }
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
      await db!.rawQuery("SELECT COUNT(*) FROM $_tableName"),
    );
  }
}

import 'dart:async';

import 'package:flutter_all_in_one/modules/sqlite/model_class.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  late Database _database;
  List<ModelClass> list = [];

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "my_db.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE model(id INTEGER PRIMARY KEY autoincrement, name TEXT)",
      );
    });
    return _database;
  }

  Future insertModel(ModelClass model) async {
    await openDb();
    return await _database.insert('model', model.toJson());
  }

  Future<List<ModelClass>> getModelList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('model');

    return List.generate(maps.length, (i) {
      return ModelClass(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
    // return maps
    //     .map((e) => Model(
    //         id: e["id"], fruitName: e["fruitName"], quantity: e["quantity"]))
    //     .toList();
  }

  Future<List<Map<String, dynamic>>> getModel(String name) async {
    await openDb();
    List<Map<String, dynamic>> listOfMap =
        await _database.query('model', where: "name = ?", whereArgs: [name]);
    return listOfMap;
  }

  Future<int> updateModel(ModelClass model) async {
    await openDb();
    return await _database.update('model', model.toJson(),
        where: "id = ?", whereArgs: [model.id]);
  }

  Future<void> deleteModel(ModelClass model) async {
    await openDb();
    await _database.delete('model', where: "name = ?", whereArgs: [model.name]);
  }
}

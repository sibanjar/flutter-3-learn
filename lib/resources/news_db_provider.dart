import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter_learn_377/model/item_model.dart';
import 'news_repository.dart';
import 'dart:io';

class NewsDbProvider implements Source,Cache{
  late Database db;

  NewsDbProvider(){
    init();
  }

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'items.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb,int version){
        newDb.execute(
            '''CREATE TABLE Items (
                id INTEGER NOT NULL PRIMARY KEY,
                type TEXT,
                by INTEGER,
                time INTEGER,
                text TEXT,
                parent INTEGER,
                kids BLOB,
                dead INTEGER,
                deleted INTEGER,
                url TEXT,
                score INTEGER,
                title TEXT,
                descendants INTEGER
              );
            ''');
      }
    );
  }

  // Todo - store and fetch top ids
  @override
  Future<List<int>>? fetchTopIds(){
    return null;
  }

  @override
  Future<ItemModel?> fetchItem(int id) async{
    final maps = await db.query(
        'Items',
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );
    if (maps.isNotEmpty){
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  @override
  Future<int> addItem(ItemModel item){
    return db.insert('Items', item.toMapForDb(item));
  }
}

final newsDbProvider = NewsDbProvider();
// sqflite dont like opening same db of instance multiple time so, we will will this instance every time

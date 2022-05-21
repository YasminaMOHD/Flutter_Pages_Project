import 'dart:io';

import 'package:api_project/models/productresponse.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static final dbHelper = DbHelper._();
  Database database;

  static final String dbName = 'ecommerce.db';
  static final String tableName = 'productfavorite';
  static final String table2Name = 'productcart';

  static final String columnId = 'id';
  static final String columnTitle = 'title';
  static final String columnPrice = 'price';
  static final String columnImage = 'image';
  static final String columnCategory = 'category';
  static final String columnDescription = 'description';

  intDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$dbName';
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, v) {
        db.execute(
            '''CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY , $columnTitle TEXT,$columnImage TEXT,$columnCategory Text,$columnDescription Text,$columnPrice INTEGER)''');
        db.execute(
            '''CREATE TABLE $table2Name ($columnId INTEGER PRIMARY KEY , $columnTitle TEXT,$columnImage TEXT,$columnCategory Text,$columnDescription Text,$columnPrice INTEGER,quantity INTEGER)''');
      },
      onOpen: (db) => print('DB is opened'),
    );

    return database;
  }

  insertFavoriteProduct(ProductResponse productResponse) async {
    Map map = productResponse.ttoJson();
    map.remove('quantity');

    int numRaw = await database.insert(tableName, map);
    print(numRaw);
  }

  insertCartProduct(ProductResponse productResponse) async {
    int numRaw = await database.insert(table2Name, productResponse.ttoJson());
    print(numRaw);
  }

  Future<List<ProductResponse>> getAllCartProduct() async {
    List<Map<String, Object>> results = await database.query(table2Name);
    List<ProductResponse> products = results.map((e) {
      return ProductResponse.ffromJson(e);
    }).toList();
    return products;
  }

  Future<List<ProductResponse>> getAllFavoriteProduct() async {
    List<Map<String, Object>> results = await database.query(tableName);
    List<ProductResponse> products = results.map((e) {
      return ProductResponse.ffromJson(e);
    }).toList();
    return products;
  }

  deleteProductFromCart(int id) async {
    database.delete(table2Name, where: 'id=?', whereArgs: [id]);
  }

  deleteProductFromFavorite(int id) async {
    database.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  // Future<int> numAllNotes() async {
  //   List<Map<String, Object>> results = await database.query(tableName);
  //   return results.length;
  // }

  // Future<Notes> getspecifiedNote(int id) async {
  //   List<Map<String, dynamic>> results =
  //       await database.query(tableName, where: 'id=?', whereArgs: [id]);
  //   Notes note = Notes.fromMap(results.first);
  //   return note;
  // }

  // deleteNote(int id) async {
  //   await database.delete(tableName, where: 'id=?', whereArgs: [id]);
  // }

  // updateNote(Notes note) async {
  //   await database
  //       .update(tableName, note.toMap(), where: 'id=?', whereArgs: [note.id]);
  // }

  Future<num> updateProductQuantityToIncrease(
      ProductResponse productResponse) async {
    // productResponse.quantity = productResponse.quantity++;

    productResponse.quantity = (productResponse.quantity) + 1;

    database.update(table2Name, productResponse.ttoJson(),
        where: 'id=?', whereArgs: [productResponse.id]);
    return productResponse.quantity;
  }

  Future<num> updateProductQuantityTodecrease(
      ProductResponse productResponse) async {
    // productResponse.quantity = productResponse.quantity++;

    productResponse.quantity = (productResponse.quantity) - 1;

    database.update(table2Name, productResponse.ttoJson(),
        where: 'id=?', whereArgs: [productResponse.id]);
    return productResponse.quantity;
  }
}

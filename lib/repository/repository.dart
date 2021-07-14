import 'package:ecom_app/repository/db_connection.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection _connection;
  String _baseUrl = 'https://ecom-api.lutforrahman.com/api';
  var _headers = {
    "Content-type": "application/x-www-form-urlencoded",
    "Accept": "application/json"
  };

  Repository() {
    _connection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _connection.initDatabase();

    return _database;
  }

  httpGet(String api) async {
    return await http.get(_baseUrl + "/" + api);
  }

  httpGetById(String api, id) async {
    return await http.get(_baseUrl + "/" + api + "/" + id.toString());
  }

  httpPost(String api, data) async {
    return await http.post(_baseUrl + "/" + api, body: data);
  }

  getAllLocal(table) async {
    var conn = await database;
    return await conn.query(table);
  }

  saveLocal(table, data) async {
    var conn = await database;
    return await conn.insert(table, data);
  }

  updateLocal(table, columnName, data) async {
    var conn = await database;
    return await conn.update(table, data,
        where: '$columnName =?', whereArgs: [data['productId']]);
  }

  getLocalByCondition(table, columnName, conditionalValue) async {
    var conn = await database;
    return await conn.rawQuery(
        'SELECT * FROM $table WHERE $columnName=?', ['$conditionalValue']);
  }
}

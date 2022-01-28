import 'package:fruits/database/app_database.dart';
import 'package:fruits/models/fruit.model.dart';
import 'package:sqflite/sqflite.dart';

class FruitDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_value INTEGER)';
  static const String _tableName = 'fruits';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _value = 'value';

  Future<int> save(Fruit fruit) async {
    final Database db = await getDatabase();
    Map<String, dynamic> fruitMap = _toMap(fruit);
    return db.insert(_tableName, fruitMap);
  }

  Future<List<Fruit>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Fruit> fruits = _toList(result);
    return fruits;
  }

  Map<String, dynamic> _toMap(Fruit fruit) {
    final Map<String, dynamic> fruitMap = Map();
    fruitMap[_name] = fruit.name;
    fruitMap[_value] = fruit.value;
    return fruitMap;
  }

  List<Fruit> _toList(List<Map<String, dynamic>> result) {
    final List<Fruit> fruits = [];
    for (Map<String, dynamic> row in result) {
      final Fruit fruit = Fruit(
        row[_id],
        row[_name],
        row[_value],
      );
      fruits.add(fruit);
    }
    return fruits;
  }
}

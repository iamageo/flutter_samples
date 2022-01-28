import 'package:fruits/database/dao/fruit_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'fruits.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(FruitDao.tableSql);
    },
    version: 1,
  );
}
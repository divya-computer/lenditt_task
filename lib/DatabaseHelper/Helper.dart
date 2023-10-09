import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database database;

  Future<void> initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> registerUser(String username, String password) async {
    await database.insert(
      'users',
      {'username': username, 'password': password},
    );
  }

  Future<bool> loginUser(String username, String password) async {
    final List<Map<String, dynamic>> users = await database.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    return users.isNotEmpty;
  }
}

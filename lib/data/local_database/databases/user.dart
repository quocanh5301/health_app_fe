import 'package:health_app_flutter/data/local_database/local_database.dart';
import 'package:health_app_flutter/data/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase implements IDatabase<User> {
  static final UserDatabase _instance = UserDatabase._internal();
  static Database? _database;

  UserDatabase._internal();

  factory UserDatabase() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), AppDatabase.userDatabase);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
      )
    ''');
  }
  
  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future<List<User>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
  
  @override
  Future<User?> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
  
  @override
  Future<void> insert(User obj) {
    // TODO: implement insert
    throw UnimplementedError();
  }
  
  @override
  Future<void> update(User obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

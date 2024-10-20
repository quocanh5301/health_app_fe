import 'package:health_app_flutter/data/local_database/local_database.dart';
import 'package:health_app_flutter/data/model/run_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RunDatabase implements IDatabase<RunData> {
  static final RunDatabase _instance = RunDatabase._internal();
  static Database? _database;

  RunDatabase._internal();

  factory RunDatabase() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), AppDatabase.runDatabase);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE run (
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
  Future<List<RunData>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
  
  @override
  Future<RunData?> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
  
  @override
  Future<void> insert(RunData obj) {
    // TODO: implement insert
    throw UnimplementedError();
  }
  
  @override
  Future<void> update(RunData obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

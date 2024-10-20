import 'package:health_app_flutter/data/local_database/local_database.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AlarmDatabase implements IDatabase<AlarmModel> {
  static final AlarmDatabase _instance = AlarmDatabase._internal();
  static Database? _database;

  AlarmDatabase._internal();

  factory AlarmDatabase() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'alarms.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE alarms (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        note TEXT,
        dateTime TEXT NOT NULL,
        isActive INTEGER NOT NULL,
        repeatOption TEXT NOT NULL, 
        customDays TEXT
      )
    '''); //repeatOption : "daily", "monFri", "once", or "custom"
    
  }

  @override
  Future<int> insert(AlarmModel alarm) async {
    final db = await database;
    return await db.insert(
      'alarms',
      alarm.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace, //!qa replace?
    ); //returns id of the inserted row
  }

  @override
  Future<AlarmModel?> getById(int id) async {
    final db = await database;
    final maps = await db.query(
      'alarms',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return AlarmModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<bool> alarmExists(int id) async {
    final db = await database;
    final maps = await db.query(
      'alarms',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [id],
      limit: 1, // We only care if we get one result, no need for all data
    );

    return maps.isNotEmpty;
  }

  @override
  Future<List<AlarmModel>> getAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('alarms');

    return List.generate(maps.length, (i) {
      return AlarmModel.fromJson(maps[i]);
    });
  }

  @override
  Future<int> update(AlarmModel alarm) async {
    final db = await database;
    return await db.update(
      'alarms',
      alarm.toJson(),
      where: 'id = ?',
      whereArgs: [alarm.id],
    ); // returns number of updated rows
  }

  @override
  Future<int> delete(String id) async {
    final db = await database;
    return await db.delete(
      'alarms',
      where: 'id = ?',
      whereArgs: [id as int],
    ); // returns number of deleted rows
  }
}

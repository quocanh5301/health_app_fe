import 'dart:convert'; // For jsonEncode and jsonDecode
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
        volume REAL NOT NULL,  -- New field for volume
        loopAudio INTEGER NOT NULL,  -- New field for loopAudio (stored as 0/1)
        vibrate INTEGER NOT NULL,  -- New field for vibrate (stored as 0/1)
        audio TEXT NOT NULL,  -- New field for audio file path
        repeatOption TEXT NOT NULL,  -- Repeat option: "daily", "monFri", "once", or "custom"
        customDays TEXT  -- Stores custom days as a JSON string
      )
    ''');
  }

  @override
  Future<int> insert(AlarmModel alarm) async {
    final db = await database;
    return await db.insert(
      'alarms',
      {
        'title': alarm.title,
        'note': alarm.note,
        'dateTime': alarm.dateTime,
        'isActive': alarm.isActive ? 1 : 0, // Convert bool to 0/1
        'volume': alarm.volume,
        'loopAudio': alarm.loopAudio ? 1 : 0, // Convert bool to 0/1
        'vibrate': alarm.vibrate ? 1 : 0, // Convert bool to 0/1
        'audio': alarm.audio,
        'repeatOption': alarm.repeatOption
            .toString()
            .split('.')
            .last, // Store enum as string
        'customDays': jsonEncode(alarm.customDays), // Store list as JSON
      },
      conflictAlgorithm: ConflictAlgorithm.replace, // Overwrite if exists
    );
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
      return _fromDatabaseJson(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<AlarmModel>> getAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('alarms');
    return List.generate(maps.length, (i) {
      return _fromDatabaseJson(maps[i]);
    });
  }

  @override
  Future<int> update(AlarmModel alarm) async {
    final db = await database;
    return await db.update(
      'alarms',
      {
        'title': alarm.title,
        'note': alarm.note,
        'dateTime': alarm.dateTime,
        'isActive': alarm.isActive ? 1 : 0,
        'volume': alarm.volume,
        'loopAudio': alarm.loopAudio ? 1 : 0,
        'vibrate': alarm.vibrate ? 1 : 0,
        'audio': alarm.audio,
        'repeatOption': alarm.repeatOption.toString().split('.').last,
        'customDays': jsonEncode(alarm.customDays),
      },
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
      whereArgs: [int.parse(id)], // Convert id to int
    ); // returns number of deleted rows
  }

  Future<bool> alarmExists(int id) async {
    final db = await database;
    final maps = await db.query(
      'alarms',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [id],
      limit: 1, // Only check if it exists
    );

    return maps.isNotEmpty;
  }

  Future<void> dropTable() async {
    // await (await database).execute('DROP TABLE IF EXISTS alarms');
    // await (await database).execute('''
    //   CREATE TABLE alarms (
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     title TEXT NOT NULL,
    //     note TEXT,
    //     dateTime TEXT NOT NULL,
    //     isActive INTEGER NOT NULL,
    //     volume REAL NOT NULL,  -- New field for volume
    //     loopAudio INTEGER NOT NULL,  -- New field for loopAudio (stored as 0/1)
    //     vibrate INTEGER NOT NULL,  -- New field for vibrate (stored as 0/1)
    //     audio TEXT NOT NULL,  -- New field for audio file path
    //     repeatOption TEXT NOT NULL,  -- Repeat option: "daily", "monFri", "once", or "custom"
    //     customDays TEXT  -- Stores custom days as a JSON string
    //   )
    // ''');
    // print('Table alarms dropped');
  }

  // Helper to map from database query result to AlarmModel
  AlarmModel _fromDatabaseJson(Map<String, dynamic> json) {
    return AlarmModel(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      dateTime: json['dateTime'],
      isActive: json['isActive'] == 1, // Convert 1/0 to bool
      volume: json['volume'],
      loopAudio: json['loopAudio'] == 1, // Convert 1/0 to bool
      vibrate: json['vibrate'] == 1, // Convert 1/0 to bool
      audio: json['audio'],
      repeatOption: RepeatOption.values.firstWhere(
        (e) => e.toString().split('.').last == json['repeatOption'],
      ),
      customDays: List<int>.from(jsonDecode(json['customDays'])),
    );
  }
}

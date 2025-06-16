import 'dart:async';

import 'package:open_workout/core/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices {
  static final DatabaseServices _databaseServices =
      DatabaseServices._internal();
  factory DatabaseServices() => _databaseServices;
  DatabaseServices._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, AppConstants.databaseFileName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async* {
    await db.execute('''
      CREATE TABLE workout_routines (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT,
        focus TEXT,
        created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await db.execute('''
      CREATE TABLE exercises (
        id TEXT PRIMARY KEY,
        routine_id TEXT NULL,
        name TEXT NOT NULL,
        category TEXT,
        sets INTEGER NOT NULL,
        reps INTEGER NOT NULL,
        rpe INTEGER,
        notes TEXT,
        created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        images TEXT,
        videos TEXT,
        FOREIGN KEY (routine_id) REFERENCES workout_routines (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
CREATE TRIGGER update_workout_routines_updated_at
AFTER UPDATE ON workout_routines
FOR EACH ROW
BEGIN
    UPDATE workout_routines
    SET updated_at = CURRENT_TIMESTAMP
    WHERE id = OLD.id;
END;

''');
  }

  Future<void> closeDatabase() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
    }
  }
}

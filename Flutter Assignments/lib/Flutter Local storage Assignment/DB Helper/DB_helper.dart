// lib/db/db_helper.dart

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'notes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertNote(Map<String, dynamic> note) async {
    final db = await database;
    return await db.insert('notes', note);
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;
    return await db.query('notes');
  }

  static Future<int> updateNote(Map<String, dynamic> note, int id) async {
    final db = await database;
    return await db.update(
      'notes',
      note,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
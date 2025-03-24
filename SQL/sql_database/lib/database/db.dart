import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_database/model/note.dart';

class NotesDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert('notes', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Note>> getNotes() async {
    final db = await database;
    final maps = await db.query('notes');
    return maps.map((e) => Note.fromMap(e)).toList();
  }

  static Future<int> updateNote(Note note) async {
    final db = await database;
    return await db
        .update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  static Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor_database/model/note.dart';
import 'package:floor_database/model/note_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'db.g.dart'; // generated file

@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;
}

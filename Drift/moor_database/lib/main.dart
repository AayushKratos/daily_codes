import 'package:flutter/material.dart';
import 'package:moor_database/data/database.dart';
import 'package:moor_database/pages/HomePage.dart';

void main() {
  final db = AppDatabase();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final AppDatabase db;

  MyApp({required this.db});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moor Notes App',
      home: HomePage(dao: db.notesDao),
    );
  }
}

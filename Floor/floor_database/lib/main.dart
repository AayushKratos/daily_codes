import 'package:floor_database/database/db.dart';
import 'package:floor_database/pages/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('notes_database.db').build();

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Floor Notes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(noteDao: database.noteDao),
    );
  }
}

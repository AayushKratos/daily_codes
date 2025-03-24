import 'package:flutter/material.dart';
import 'package:hive_database/model/notes.dart';
import 'package:hive_database/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notesBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Notes',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

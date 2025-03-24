import 'package:flutter/material.dart';
import 'package:json/model/note.dart';

class NoteDetails extends StatelessWidget {
  final Note note;
  NoteDetails({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(note.body),
          ],
        ),
      ),
    );
  }
}

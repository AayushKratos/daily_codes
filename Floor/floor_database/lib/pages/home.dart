import 'package:floor_database/model/note.dart';
import 'package:floor_database/model/note_dao.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final NoteDao noteDao;

  const HomePage({super.key, required this.noteDao});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController contentCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    notes = await widget.noteDao.findAllNotes();
    setState(() {});
  }

  void showNoteDialog({Note? note}) {
    if (note != null) {
      titleCtrl.text = note.title;
      contentCtrl.text = note.content;
    } else {
      titleCtrl.clear();
      contentCtrl.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(note == null ? 'New Note' : 'Edit Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: titleCtrl,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: contentCtrl,
                decoration: InputDecoration(labelText: 'Content')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (note == null) {
                await widget.noteDao.insertNote(
                  Note(title: titleCtrl.text, content: contentCtrl.text),
                );
              } else {
                await widget.noteDao.updateNote(
                  Note(
                      id: note.id,
                      title: titleCtrl.text,
                      content: contentCtrl.text),
                );
              }
              Navigator.pop(context);
              loadNotes();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void deleteNote(Note note) async {
    await widget.noteDao.deleteNote(note);
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showNoteDialog(),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            onTap: () => showNoteDialog(note: note),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteNote(note),
            ),
          );
        },
      ),
    );
  }
}

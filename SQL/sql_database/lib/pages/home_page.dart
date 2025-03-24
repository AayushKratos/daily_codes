import 'package:flutter/material.dart';
import 'package:sql_database/database/db.dart';
import 'package:sql_database/model/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    notes = await NotesDatabase.getNotes();
    setState(() {});
  }

  void showNoteDialog({Note? note}) {
    if (note != null) {
      _titleController.text = note.title;
      _contentController.text = note.content;
    } else {
      _titleController.clear();
      _contentController.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(note == null ? 'Add Note' : 'Edit Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final title = _titleController.text.trim();
              final content = _contentController.text.trim();
              if (title.isEmpty || content.isEmpty) return;

              if (note == null) {
                await NotesDatabase.insertNote(
                    Note(title: title, content: content));
              } else {
                await NotesDatabase.updateNote(
                    Note(id: note.id, title: title, content: content));
              }

              Navigator.pop(context);
              loadNotes();
            },
            child: Text(note == null ? 'Add' : 'Update'),
          ),
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        ],
      ),
    );
  }

  void deleteNote(Note note) async {
    await NotesDatabase.deleteNote(note.id!);
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showNoteDialog(),
        child: Icon(Icons.add),
      ),
      body: notes.isEmpty
          ? Center(child: Text('No notes found'))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => showNoteDialog(note: note)),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteNote(note)),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

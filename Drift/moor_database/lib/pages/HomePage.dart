import 'package:flutter/material.dart';
import 'package:moor_database/data/dao.dart';
import 'package:moor_database/data/database.dart'; // contains AppDatabase and NotesDao
import 'package:moor_database/pages/NoteForm.dart';

class HomePage extends StatefulWidget {
  final NotesDao dao;

  HomePage({required this.dao});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Note>> _notes;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() {
    _notes = widget.dao.getAllNotes();
  }

  void _refresh() {
    setState(() => _loadNotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Moor Notes")),
      body: FutureBuilder(
        future: _notes,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          final notes = snapshot.data as List<Note>;
          return ListView.builder(
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
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                NoteForm(dao: widget.dao, note: note),
                          ),
                        );
                        _refresh();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await widget.dao.deleteNote(note);
                        _refresh();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NoteForm(dao: widget.dao),
            ),
          );
          _refresh();
        },
      ),
    );
  }
}

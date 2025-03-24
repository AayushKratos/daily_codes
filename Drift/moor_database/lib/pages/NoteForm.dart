import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:moor_database/data/dao.dart';
import 'package:moor_database/data/database.dart';

class NoteForm extends StatefulWidget {
  final NotesDao dao;
  final Note? note;

  NoteForm({required this.dao, this.note});

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController =
        TextEditingController(text: widget.note?.content ?? '');
  }

  void _saveNote() async {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final content = _contentController.text;

      if (widget.note == null) {
        await widget.dao.insertNote(
          NotesCompanion(
            title: drift.Value(title),
            content: drift.Value(content),
          ),
        );
      } else {
        await widget.dao.updateNote(
          widget.note!.copyWith(
            title: title,
            content: content,
          ),
        );
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: flutter.Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter title' : null,
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: 5,
                validator: (value) => value!.isEmpty ? 'Enter content' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveNote,
                child: Text(widget.note == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

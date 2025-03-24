import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/model/notes.dart';

class NoteFormPage extends StatefulWidget {
  final NoteModel? note;
  final int? index;

  NoteFormPage({this.note, this.index});

  @override
  _NoteFormPageState createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _title, _content;

  @override
  void initState() {
    super.initState();
    _title = widget.note?.title ?? '';
    _content = widget.note?.content ?? '';
  }

  void _saveNote() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final notesBox = Hive.box<NoteModel>('notesBox');
      if (widget.note != null && widget.index != null) {
        widget.note!.title = _title;
        widget.note!.content = _content;
        widget.note!.save();
      } else {
        notesBox.add(NoteModel(title: _title, content: _content));
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.note != null ? 'Edit Note' : 'Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                initialValue: _content,
                decoration: InputDecoration(labelText: 'Content'),
                validator: (value) => value!.isEmpty ? 'Enter content' : null,
                onSaved: (value) => _content = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveNote,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

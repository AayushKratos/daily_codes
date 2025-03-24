import 'package:drift/drift.dart';
import 'database.dart';

part 'dao.g.dart';

@DriftAccessor(tables: [Notes])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(AppDatabase db) : super(db);

  Future<List<Note>> getAllNotes() => select(notes).get();
  Stream<List<Note>> watchAllNotes() => select(notes).watch();
  Future insertNote(NotesCompanion note) => into(notes).insert(note);
  Future updateNote(Note note) => update(notes).replace(note);
  Future deleteNote(Note note) => delete(notes).delete(note);
}

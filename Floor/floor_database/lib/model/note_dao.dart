import 'package:floor/floor.dart';
import 'note.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM Note')
  Future<List<Note>> findAllNotes();

  @Query('SELECT * FROM Note WHERE id = :id')
  Future<Note?> findNoteById(int id);

  @insert
  Future<int> insertNote(Note note);

  @update
  Future<int> updateNote(Note note);

  @delete
  Future<int> deleteNote(Note note);
}

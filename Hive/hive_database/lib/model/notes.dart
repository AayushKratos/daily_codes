import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  NoteModel({required this.title, required this.content});
}

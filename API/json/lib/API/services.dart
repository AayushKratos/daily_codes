import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json/model/note.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<Note>> fetchNotes() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => Note.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:json/model/user_dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<User>> fetchUsers() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/users');

      List<dynamic> data = response.data;

      return data.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching users: $e');
      throw Exception('Failed to load users');
    }
  }
}

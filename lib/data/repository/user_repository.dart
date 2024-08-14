import 'package:http/http.dart' as http;
import 'package:palindrome_suitmedia/data/models/user_model.dart';
import 'package:palindrome_suitmedia/domain/users/user_entity.dart';
import 'dart:convert';

class UserRepository {
  final http.Client client;

  UserRepository({required this.client});

  Future<List<UserEntity>> getUsers() async {
    final response = await client
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['data']; // Access the "data" array

      return data.map((user) => User.fromJson(user).toEntity()).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
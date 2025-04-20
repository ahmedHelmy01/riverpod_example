import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';


class UserService {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final List list = json.decode(response.body);
    return list.map((json) => User.fromJson(json)).toList();
  }

  Future<User> fetchUserById(int id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
    return User.fromJson(json.decode(response.body));
  }
}

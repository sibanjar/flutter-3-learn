import 'dart:convert';

import 'package:flutter_learn_377/test_for_user_api/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {

  http.Client client;

  UserRepository(this.client);

  Future<User> getUser() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1')
    );

    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception('Some Error Occurred');
  }
}
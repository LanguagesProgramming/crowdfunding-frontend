import 'dart:convert';

import 'package:crowdfunding_frontend/model/db/const.dart';
import 'package:crowdfunding_frontend/model/schema/user.dart';
import 'package:crowdfunding_frontend/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserModelDB extends UserModel {
  @override
  Future<List<User>> getAllUsers() async {
    String url = Const.url;
    List<User> users = [];

    final response = await http.get(Uri.parse('$url/user'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> userList = data['data'] as List<dynamic>;

      for (final user in userList) {
        User finalUser = User.fromJson(user);
        users.add(finalUser);
      }
    }

    return users;
  }

  @override
  Future<User> getUser(String id) async {
    String url = Const.url;

    final response = await http.get(Uri.parse('$url/user/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      return User.fromJson(data['data']);
    }

    throw Exception("User not found");
  }
}

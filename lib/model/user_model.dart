import 'package:crowdfunding_frontend/model/schema/user.dart';

abstract class UserModel {
  Future<List<User>> getAllUsers();

  Future<User> getUser(String id);
}

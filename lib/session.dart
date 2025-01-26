import 'package:crowdfunding_frontend/model/schema/user.dart';

class UserManager {
  static final UserManager _instance = UserManager._internal();
  factory UserManager() => _instance;

  User? _user;

  User? get user => _user;

  void setUser(User user) {
    if (_user == null) {
      _user = user;
    }
  }

  UserManager._internal();
}

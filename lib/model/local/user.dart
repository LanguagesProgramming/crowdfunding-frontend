import 'package:crowdfunding_frontend/model/schema/user.dart';
import 'package:crowdfunding_frontend/model/user_model.dart';

class UserModelLocal extends UserModel {
  static List<User> users = [
    User(userId: '1', username: "unicef", campaigns: ['1']),
    User(userId: '2', username: 'Steve Madson', campaigns: ['2'])
  ];

  @override
  Future<List<User>> getAllUsers() async {
    return users;
  }

  @override
  Future<User> getUser(String id) async {
    for (int i = 0; i < users.length; i++) {
      User currentUser = users[i];

      if (currentUser.userId == id) {
        return currentUser;
      }
    }
    throw ("User not found");
  }
}

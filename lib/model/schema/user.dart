class User {
  String userId;
  String username;
  List<String> campaigns;

  User({required this.userId, required this.username, required this.campaigns});

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'email': String email,
        'name': String username,
      } =>
        User(
          userId: email,
          username: username,
          campaigns: ['1'],
        ),
      _ => throw const FormatException("Failed to load user"),
    };
  }
}

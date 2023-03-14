// ignore_for_file: non_constant_identifier_names

class User {
  int? user_id;
  String user_name;
  String user_email;
  String user_password;
  User({
    this.user_id,
    required this.user_name,
    required this.user_email,
    required this.user_password,
  });
  factory User.fromJson(Map<String, dynamic> parseJson) {
    return User(
        user_id: int.parse(parseJson['user_id']),
        user_name: parseJson['user_name'],
        user_email: parseJson['user_email'],
        user_password: parseJson['user_password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id.toString(),
      'user_name': user_name.toString(),
      'user_email': user_email.toString(),
      'user_password': user_password.toString(),
    };
  }
}

import 'package:palindrome_suitmedia/domain/users/user_entity.dart';

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
    );
  }
}

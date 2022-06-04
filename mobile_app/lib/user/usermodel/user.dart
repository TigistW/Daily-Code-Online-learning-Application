import 'dart:convert';

class User {
  String email;
  String password;
  String firstname;
  String lastname;
  String role;

  User(
      {required this.email,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      role: json['role'],
    );
  }
}

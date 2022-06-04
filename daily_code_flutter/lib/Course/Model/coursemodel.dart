import 'dart:convert';

class Course {
  final int? id;
  final String code;
  final String title;
  final String description;

  Course(
      {this.id,
      required this.code,
      required this.title,
      required this.description});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        id: json['id'],
        code: json['code'],
        title: json['title'],
        description: json['description']);
  }

  // String get title => title;

  // String get description => description;
}

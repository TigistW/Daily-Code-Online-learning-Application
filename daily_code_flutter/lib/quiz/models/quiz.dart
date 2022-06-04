import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Quiz extends Equatable {
  Quiz({
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;

  @override
  List<Object> get props => [id, name, description];

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

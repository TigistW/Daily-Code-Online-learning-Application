import 'dart:convert';
// import 'package:flutter_network/course/models/course.dart';
import 'package:http/http.dart' as http;

import '../models/quiz.dart';

class QuizDataProvider {
  QuizDataProvider();

  Future<Quiz> createQuiz(Quiz quiz) async {
    final response = await http.post(
      Uri.parse("http://localhost:8080/addQuiz"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': quiz.name,
        'description': quiz.description,
      }),
    );

    if (response.statusCode == 200) {
      return Quiz.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create quiz.');
    }
  }

  Future<Quiz> getQuizById(String id) async {
    final response =
        await http.get(Uri.parse("http://localhost:8080/getQuizById/$id"));

    if (response.statusCode == 200) {
      return Quiz.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Getting Course by id failed");
    }
  }

  Future<List<Quiz>> getQuizes() async {
    final response = await http.get(Uri.parse("http://localhost:8080/allQuiz"));

    if (response.statusCode == 200) {
      final quizes = jsonDecode(response.body) as List;
      return quizes.map((quiz) => Quiz.fromJson(quiz)).toList();
    } else {
      throw Exception('Failed to load quizes');
    }
  }

  Future<void> deleteQuiz(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://localhost:8080/deleteQuiz/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete quiz.');
    }
  }

  Future<Quiz> updateQuiz(String id, Quiz quiz) async {
    final http.Response response = await http.put(
      Uri.parse('http://localhost:8080/updateQuiz/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': quiz.id,
        'name': quiz.name,
        'description': quiz.description,
      }),
    );

    if (response.statusCode == 200) {
      return Quiz.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the quiz");
    }
  }
}

// import 'package:flutter_network/course/course.dart';

import '../data_provider/data_provider.dart';
import '../data_provider/quiz_data.dart';
import '../models/quiz.dart';

class QuizRepository {
  final QuizDataProvider dataProvider;

  QuizRepository(this.dataProvider);

  Future<Quiz> createQuiz(Quiz quiz) async {
    return await dataProvider.createQuiz(quiz);
  }

  Future<List<Quiz>> getQuizes() async {
    return await dataProvider.getQuizes();
  }

  Future<void> updateQuiz(String id, Quiz quiz) async {
    await dataProvider.updateQuiz(id, quiz);
  }

  Future<void> deleteQuiz(String id) async {
    await dataProvider.deleteQuiz(id);
  }

  Future<void> getQuizById(String id) async {
    await dataProvider.getQuizById(id);
  }
}

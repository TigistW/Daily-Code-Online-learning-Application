import 'package:equatable/equatable.dart';

import '../models/quiz.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizLoad extends QuizEvent {
  const QuizLoad();

  @override
  List<Object> get props => [];
}

class QuizCreate extends QuizEvent {
  final Quiz quiz;

  const QuizCreate(this.quiz);

  @override
  List<Object> get props => [quiz];

  @override
  String toString() => 'Quiz Created {quiz: $quiz}';
}

class QuizUpdate extends QuizEvent {
  final Quiz quiz;

  const QuizUpdate(this.quiz);

  @override
  List<Object> get props => [quiz];

  get id => null;

  @override
  String toString() => 'Quiz Updated {quiz: $quiz}';
}

class QuizDelete extends QuizEvent {
  final Quiz quiz;

  const QuizDelete(this.quiz);

  @override
  List<Object> get props => [quiz];

  String get id => id;

  @override
  toString() => 'Quiz Deleted {quiz: $quiz}';
}


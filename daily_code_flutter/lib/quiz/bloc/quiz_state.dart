import 'package:equatable/equatable.dart';

import '../models/quiz.dart';

class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizLoading extends QuizState {}

class QuizesLoadSuccess extends QuizState {
  final List<Quiz> quizes;

  QuizesLoadSuccess([this.quizes = const []]);

  @override
  List<Object> get props => [quizes];
}

class QuizOperationFailure extends QuizState {
  final Object error;

  const QuizOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}

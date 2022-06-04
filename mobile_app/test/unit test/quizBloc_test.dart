import 'package:bloc_test/bloc_test.dart';
import 'package:mobile_app/Course/Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Bloc/courseEvent.dart';
import 'package:mobile_app/Course/Bloc/courseState.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mobile_app/quiz/bloc/quiz_bloc.dart';
import 'package:mobile_app/quiz/bloc/quiz_state.dart';
import 'package:mobile_app/quiz/course.dart';
import 'package:mobile_app/quiz/repository/quiz_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAppService extends Mock implements QuizRepository {}

// ignore: deprecated_member_use
const loading = TypeMatcher<QuizLoading>();
const error = TypeMatcher<FailureOperation>();
const success = TypeMatcher<SuccessOperation>();
@GenerateMocks([CourseRepository])
void main() {
  MockAppService serviceMock = MockAppService();

  QuizBloc quizBloc = QuizBloc(quizRepository: serviceMock);

  tearDown(() {
    quizBloc.close();
  });

  test('course close does not emit new course state', () async {
    quizBloc.close();
    await expectLater(quizBloc.stream, emitsInOrder([emitsDone]));
  });

  test('course is in intial state', () {
    expect(quizBloc.state, success);
  });

  group('Bloc courseState', () {
    blocTest<QuizBloc, QuizState>(
      'emits [courseError] state',
      build: () {
        when(CourseLoading()).thenThrow(Error);
        return QuizBloc(quizRepository: serviceMock);
      },
      // act: (bloc) => bloc.add(CourseEvent());
      expect: () => [error, loading, success],
    );

    blocTest<QuizBloc, QuizState>(
      'emits [courseLoading] state',
      build: () {
        when(const CourseLoad()).thenAnswer((_) => const CourseLoad());
        return QuizBloc(quizRepository: serviceMock);
      },
      // act: (bloc) => bloc.add(CourseEvent());
      expect: () => [error, loading, success],
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:mobile_app/Course/Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/quiz/bloc/quiz_bloc.dart';
import 'package:mobile_app/quiz/models/models.dart';
import 'package:mobile_app/quiz/repository/quiz_repository.dart';
// import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockQuizRepository extends Mock implements QuizRepository {}
// @GenerateMocks([http.Client])

void main() {
  MockQuizRepository mockQuizRepository;

  setUp(() {
    mockQuizRepository = MockQuizRepository();
  });

  group('GetQuiz', () {
    Quiz quiz = Quiz(id: 1, name: 'title', description: 'description');
  });
  mockQuizRepository = MockQuizRepository();
  Quiz quiz = Quiz(id: 1, name: 'title', description: 'description');

  // test('get a', mockCourseRepository.create(course),
  //     expect(List<Courses>.length, 1));

  // test()
  test('update successful', () {
    when(mockQuizRepository.updateQuiz(quiz.id.toString(), quiz))
        .thenAnswer((_) async => quiz);
  });

  final bloc = QuizBloc(quizRepository: mockQuizRepository);
  // bloc.add(GetCourse('12'));

  // // group('GetCourse', () {
  // //   when(mockCourseRepository).thenAnswer((_) async => Course(code: '12', title: 'title', description: 'description'));
  // // });

  // emitsExactly(bloc, []);
}

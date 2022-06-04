import 'package:bloc_test/bloc_test.dart';
import 'package:mobile_app/Course/Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Bloc/courseEvent.dart';
import 'package:mobile_app/Course/Bloc/courseState.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAppService extends Mock implements CourseRepository {}

// ignore: deprecated_member_use
const loading = TypeMatcher<CourseLoading>();
const error = TypeMatcher<FailureOperation>();
const success = TypeMatcher<SuccessOperation>();
@GenerateMocks([CourseRepository])
void main() {
  MockAppService serviceMock = MockAppService();

  CourseBloc courseBloc = CourseBloc(courseRepository: serviceMock);

  tearDown(() {
    courseBloc.close();
  });

  test('course close does not emit new course state', () async {
    courseBloc.close();
    await expectLater(courseBloc.stream, emitsInOrder([emitsDone]));
  });

  test('course is in intial state', () {
    expect(courseBloc.state, success);
  });

  group('Bloc courseState', () {
    blocTest<CourseBloc, CourseState>(
      'emits [courseError] state',
      build: () {
        when(CourseLoading()).thenThrow(Error);
        return CourseBloc(courseRepository: serviceMock);
      },
      // act: (bloc) => bloc.add(CourseEvent());
      expect: () => [error, loading, success],
    );

    blocTest<CourseBloc, CourseState>(
      'emits [courseLoading] state',
      build: () {
        when(const CourseLoad()).thenAnswer((_) => const CourseLoad());
        return CourseBloc(courseRepository: serviceMock);
      },
      // act: (bloc) => bloc.add(CourseEvent());
      expect: () => [error, loading, success],
    );
  });
}

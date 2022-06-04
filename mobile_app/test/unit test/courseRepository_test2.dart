import 'package:bloc_test/bloc_test.dart';
import 'package:mobile_app/Course/Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mobile_app/main.dart';
// import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCourseRepository extends Mock implements CourseRepository {}
// @GenerateMocks([http.Client])

void main() {
  MockCourseRepository mockCourseRepository;

  setUp(() {
    mockCourseRepository = MockCourseRepository();
  });

  group('GetCourse', () {
    Course course =
        Course(code: '12', title: 'title', description: 'description');
  });
  mockCourseRepository = MockCourseRepository();
  Course course =
      Course(code: '12', title: 'title', description: 'description');

  // test('get a', mockCourseRepository.create(course),
  //     expect(List<Courses>.length, 1));

  // test()
  test('update successful', () {
    when(mockCourseRepository.update(course.id!.toInt(), course))
        .thenAnswer((_) async => course);
  });

  // bloc.add(GetCourse('12'));

  // // group('GetCourse', () {
  // //   when(mockCourseRepository).thenAnswer((_) async => Course(code: '12', title: 'title', description: 'description'));
  // // });

  // emitsExactly(bloc, []);
}

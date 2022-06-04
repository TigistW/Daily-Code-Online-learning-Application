import 'package:http/testing.dart';
import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

class MockCourseRepository extends Mock implements CourseDataProvider {}

@GenerateMocks([http.Client])
void main(List<String> args) {
  Course course = Course(
      id: 1,
      code: "201",
      title: "your title",
      description:
          "this lesson is to give studets to add abit knowlege on what the have....be focused on what u do!");
  group('create course', () async {
    setUp(() => {});
    test('returns course', () async {
      final client = MockClient((response) async => http.Response('ok', 200));

      when(client.post(
        Uri.parse('http://localhost:8080/addCourse'),
      )).thenAnswer((_) async => http.Response('ok', 200));

      expect(Object(), course);
    });
  });
}

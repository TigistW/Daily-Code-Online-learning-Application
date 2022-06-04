import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';

class CourseRepository {
  final CourseDataProvider dataProvider;
  CourseRepository(this.dataProvider);

  Future<Course> create(Course course) async {
    return dataProvider.create(course);
  }

  Future<Course> update(int id, Course course) async {
    return dataProvider.update(id, course);
  }

  Future<List<Course>> getAll() async {
    return dataProvider.getAll();
  }

  Future<void> delete(int id) async {
    dataProvider.delete(id);
  }
}

import 'package:equatable/equatable.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();
}

class CourseLoad extends CourseEvent {
  const CourseLoad();

  @override
  List<Object> get props => [];
}

class CreateCourse extends CourseEvent {
  final Course course;

  const CreateCourse(this.course);

  @override
  List<Object> get props => [course];

  @override
  String toString() => 'Course Created {course Id: ${course.id}}';
}

class UpdateCourse extends CourseEvent {
  final int id;
  final Course course;

  const UpdateCourse(this.id, this.course);

  @override
  List<Object> get props => [id, course];

  @override
  String toString() => 'Course Updated {course Id: ${course.id}}';
}

class DeleteCourse extends CourseEvent {
  final int id;

  const DeleteCourse(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Course Deleted {course Id: $id}';

  @override
  bool? get stringify => true;
}

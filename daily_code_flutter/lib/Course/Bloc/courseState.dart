import 'package:equatable/equatable.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseLoading extends CourseState {}

class SuccessOperation extends CourseState {
  final Iterable<Course> courses;

  const SuccessOperation([this.courses = const []]);

  @override
  List<Object> get props => [courses];
}

class FailureOperation extends CourseState {
  final Object error;

  const FailureOperation(this.error);
  @override
  List<Object> get props => [error];
}

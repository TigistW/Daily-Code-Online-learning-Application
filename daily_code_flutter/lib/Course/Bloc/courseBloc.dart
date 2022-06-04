import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/Course/Bloc/courseEvent.dart';
import 'package:mobile_app/Course/Bloc/courseState.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc({required this.courseRepository}) : super(CourseLoading()) {
    on<CourseLoad>((event, emit) async {
      emit(CourseLoading());
      try {
        final courses = await courseRepository.getAll();
        emit(SuccessOperation(courses));
      } catch (error) {
        emit(FailureOperation(error));
      }
    });

    on<CreateCourse>((event, emit) async {
      try {
        await courseRepository.create(event.course);
        final courses = await courseRepository.getAll();
        emit(SuccessOperation(courses));
      } catch (error) {
        emit(FailureOperation(error));
      }
    });

    on<UpdateCourse>((event, emit) async {
      try {
        await courseRepository.update(event.id, event.course);
        final courses = await courseRepository.getAll();
        emit(SuccessOperation(courses));
      } catch (error) {
        emit(FailureOperation(error));
      }
    });

    on<DeleteCourse>((event, emit) async {
      try {
        await courseRepository.delete(event.id);
        final courses = await courseRepository.getAll();
        emit(SuccessOperation(courses));
      } catch (error) {
        emit(FailureOperation(error));
      }
    });
  }
}

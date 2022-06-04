import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:f/quiz/bloc/quiz_event.dart';
// import 'package:flutter_network/quiz/bloc/quiz_state.dart';
import 'package:mobile_app/quiz/bloc/quiz_event.dart';
import 'package:mobile_app/quiz/bloc/quiz_state.dart';

import '../repository/quiz_repository.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepository quizRepository;

  QuizBloc({required this.quizRepository}) : super(QuizLoading()) {
    on<QuizLoad>((event, emit) async {
      emit(QuizLoading());
      try {
        final quizes = await quizRepository.getQuizes();
        emit(QuizesLoadSuccess(quizes));
      } catch (error) {
        emit(QuizOperationFailure(error));
      }
    });

    on<QuizCreate>((event, emit) async {
      try {
        // print("also here");
        await quizRepository.createQuiz(event.quiz);
        // print("hhhhhhhhhhhhhhhhh");
        final quizes = await quizRepository.getQuizes();

        emit(QuizesLoadSuccess(quizes));
        // print("bbbbbbbbbbbbbbbb");
      } catch (error) {
        // print("rrrrrrrrrrrrrrrrrrrrrrrr");
        emit(QuizOperationFailure(error));
      }
    });

    on<QuizUpdate>((event, emit) async {
      try {
        await quizRepository.updateQuiz(event.id, event.quiz);
        final quizes = await quizRepository.getQuizes();
        emit(QuizesLoadSuccess(quizes));
      } catch (error) {
        emit(QuizOperationFailure(error));
      }
    });

    on<QuizDelete>((event, emit) async {
      try {
        await quizRepository.deleteQuiz(event.id);
        final quizes = await quizRepository.getQuizes();
        emit(QuizesLoadSuccess(quizes));
      } catch (error) {
        emit(QuizOperationFailure(error));
      }
    });
  }

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
  // CourseBloc({@required this.courseRepository})
  //     : assert(courseRepository != null),
  //       super(CourseLoading());

//   @override
//   Stream<CourseState> mapEventToState(CourseEvent event) async* {
//     if (event is CourseLoad) {
//       yield CourseLoading();
//       try {
//         final courses = await courseRepository.getCourses();
//         yield CoursesLoadSuccess(courses);
//       } catch (_) {
//         yield CourseOperationFailure();
//       }
//     }

//     if (event is CourseCreate) {
//       try {
//         await courseRepository.createCourse(event.course);
//         final courses = await courseRepository.getCourses();
//         yield CoursesLoadSuccess(courses);
//       } catch (_) {
//         yield CourseOperationFailure();
//       }
//     }

//     if (event is CourseUpdate) {
//       try {
//         await courseRepository.updateCourse(event.course);
//         final courses = await courseRepository.getCourses();
//         yield CoursesLoadSuccess(courses);
//       } catch (_) {
//         yield CourseOperationFailure();
//       }
//     }

//     if (event is CourseDelete) {
//       try {
//         await courseRepository.deleteCourse(event.course.id);
//         final courses = await courseRepository.getCourses();
//         yield CoursesLoadSuccess(courses);
//       } catch (_) {
//         yield CourseOperationFailure();
//       }
//     }
//   }
// }
// }

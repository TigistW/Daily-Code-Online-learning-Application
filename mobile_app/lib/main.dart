// import 'dart:js';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/Course/Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Bloc/courseEvent.dart';
import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mobile_app/Course/Screen/admin_home.dart';
import 'package:mobile_app/Course/Screen/admin_route.dart';
import 'package:mobile_app/Course/Screen/course_add.dart';
import 'package:mobile_app/Course/Screen/course_update.dart';
import 'package:mobile_app/bloc_observer.dart';
import 'package:mobile_app/Course/Screen/navigotor.dart';
import 'package:mobile_app/quiz/bloc/quiz_bloc.dart';
import 'package:mobile_app/quiz/bloc/quiz_event.dart';
import 'package:mobile_app/quiz/data_provider/data_provider.dart';
import 'package:mobile_app/quiz/models/quiz.dart';
import 'package:mobile_app/quiz/repository/repository.dart';
import 'package:mobile_app/quiz/screens/quiz_add_update.dart';
import 'package:mobile_app/quiz/screens/quiz_list.dart';
import 'package:mobile_app/user/add_user.dart';
import 'package:mobile_app/user/autherror.dart';
import 'package:mobile_app/user/user_list.dart';
import 'package:mobile_app/Course/Screen/video-player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/Course/Screen/Course_Detail.dart';
import 'package:mobile_app/Course/Screen/UserDashboard.dart';
import 'package:mobile_app/Course/Screen/catagory.dart';
import 'package:mobile_app/user/register.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/Course/Screen/watch.dart';
import 'user/login.dart';

void main() {
  final CourseRepository courseRepository =
      CourseRepository(CourseDataProvider());
  // final Course courses;

  BlocOverrides.runZoned(
    () => runApp(
      MyApp(
        courseRepository: courseRepository,
        courses: Course(code: '', description: '', title: ''),
        quizRepository: QuizRepository(QuizDataProvider()),
      ),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final CourseRepository courseRepository;
  final QuizRepository quizRepository;
  final Course courses;
  const MyApp(
      {Key? key,
      required this.courseRepository,
      required this.courses,
      required this.quizRepository})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Catagory(course: courses, courseRepository: courseRepository);

    final _router = GoRouter(
        routes: [
          GoRoute(
              path: '/',
              pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: Homepage(
                    title: 'home',
                  ))),
          GoRoute(
              path: '/login',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: Login())),
          GoRoute(
              path: '/register',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: Register())),
          GoRoute(
              path: '/insthome',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: Admin())),
          GoRoute(
              path: '/updatecourse',
              pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: Updatecourse(
                    args: CourseArgument(edit: false),
                  ))),
          GoRoute(
              path: '/catagory',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: Navigotor()),
              routes: [
                GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) {
                      return MaterialPage(
                          key: state.pageKey, child: Detail(course: courses));
                    })
              ]),
          GoRoute(
              path: '/dashboard',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: Dashboard())),
          GoRoute(
              path: '/watch_video',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: VideoDemo())),
          GoRoute(
              path: '/error',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: Error())),
          GoRoute(
              path: '/addcourse',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: FormApp())),
          GoRoute(
              path: '/addquiz',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: QuizFormApp())),
          GoRoute(
              path: '/userlist',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: UserList())),
          GoRoute(
              path: '/adduser',
              pageBuilder: (context, state) =>
                  MaterialPage(key: state.pageKey, child: AddUser())),
          GoRoute(
              path: '/quizlist',
              pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: QuizList(
                    quizRepository: QuizRepository(QuizDataProvider()),
                    quiz: Quiz(id: 1, name: '', description: ''),
                  )))
        ],
        errorPageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: Scaffold(
              body: Center(
                child: Text(state.error.toString()),
              ),
            )));
   

    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) =>
                  CourseBloc(courseRepository: this.courseRepository)
                    ..add(CourseLoad())),
          RepositoryProvider(
              create: (context) => QuizBloc(quizRepository: this.quizRepository)
                ..add(QuizLoad())),
        ],
        child: RepositoryProvider.value(
            value: courseRepository,
            child: BlocProvider(
                create: (context) =>
                    CourseBloc(courseRepository: courseRepository)
                      ..add(const CourseLoad()),
                child: RepositoryProvider.value(
                    value: quizRepository,
                    child: BlocProvider(
                        create: (context) =>
                            QuizBloc(quizRepository: quizRepository)
                              ..add(const QuizLoad()),
                        child: MaterialApp.router(
                          routeInformationParser:
                              _router.routeInformationParser,
                          routerDelegate: _router.routerDelegate,
                          debugShowCheckedModeBanner: false,
                          title: 'Flutter Demo',
                          theme: ThemeData(
                            primarySwatch: Colors.blue,
                          ),
                        ))))));
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.title}) : super(key: key);
  final String title;
  // final List<Course> courses;

  @override
  State<Homepage> createState() => Home();
}

class Home extends State<Homepage> with SingleTickerProviderStateMixin {
  // Login({Key? key}) : super(key: key);

  ParticleOptions particles = const ParticleOptions(
    baseColor: Color.fromARGB(253, 66, 55, 107),
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 100,
    spawnMaxRadius: 10.0,
    spawnMaxSpeed: 50.0,
    spawnMinSpeed: 5,
    spawnMinRadius: 3.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 1, 16, 29),
            child: AnimatedBackground(
                behaviour: RandomParticleBehaviour(options: particles),
                vsync: this,
                child: Container(
                    margin: EdgeInsets.only(top: 170),
                    child: Column(children: [
                      SvgPicture.asset(
                        "welcome.svg",
                        width: 200,
                        height: 150,
                      ),
                      const Text(
                        "To Daily code",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 90, left: 180),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 1, 28, 50))),
                              onPressed: () {
                                context.go("/login");
                              },
                              child: Text("Login")))
                    ])

                    // child: ,
                    ))));
  }
}


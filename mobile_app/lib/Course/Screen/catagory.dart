import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/Course/Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Bloc/courseEvent.dart';
import 'package:mobile_app/Course/Bloc/courseState.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mobile_app/Course/Screen/UserDashboard.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';

class Catagory extends StatefulWidget {
  final CourseRepository courseRepository;
  final Course course;
  const Catagory(
      {Key? key, required this.course, required this.courseRepository})
      : super(key: key);

  @override
  State<Catagory> createState() => _CatagoryState(course, courseRepository);
}

class _CatagoryState extends State<Catagory> {
  CourseRepository courseRepository;
  Course course;
  _CatagoryState(this.course, this.courseRepository);

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.purple[100],
      Colors.yellow[100],
      Colors.blue[100],
      Colors.pink[100],
      Colors.green[100],
      Colors.orange[100],
    ];
    final images = [
      "assets/react.jpg",
      "assets/html.jpeg",
      "assets/js.png",
      "assets/python.png",
      "assets/spring.png",
      "assets/java.jpg"
    ];

    return Scaffold(
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (_, state) {
          if (state is FailureOperation) {
            return const Text('Could not do course operation');
          }

          if (state is SuccessOperation) {
            final courses = state.courses;
            return SingleChildScrollView(
              child: Column(children: [
                Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80)),
                        color: Color.fromARGB(193, 213, 234, 252)),
                    child: Column(children: [
                      Row(children: [
                        Container(
                            margin: EdgeInsets.only(top: 110, right: 270),
                            child: Stack(children: [
                              Column(
                                children: [
                                  Text(
                                    "Catagory",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text("Lessons we have",
                                      style: TextStyle(
                                          color: Colors.black38, fontSize: 10)),
                                ],
                              ),
                            ])),
                        ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 2, 39, 69))),
                            onPressed: () {
                              context.go("/quizlist");
                            },
                            icon: Icon(Icons.list),
                            label: Text("Quiz list")),
                      ])
                    ])),
                Container(
                    padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                    height: 430,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          // childAspectRatio: 1 / 1
                        ),
                        itemCount: courses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(children: [
                            GestureDetector(
                              child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      color: colors[index % 6]),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          width: 90,
                                          height: 80,
                                          child: CircleAvatar(
                                            backgroundImage:
                                                AssetImage(images[index % 6]),
                                          ),
                                        ),
                                        Text(courses.elementAt(index).title),
                                        Text(
                                          courses.elementAt(index).code,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                context.go(
                                  '/catagory/${courses.elementAt(index).id}',
                                  // params: {'id': courses[index].id.toString()}
                                );
                              },
                            )
                          ]);
                        }))
              ]),
            );
          }
          return const CircularProgressIndicator();
        },
       
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

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

class AdminHome extends StatefulWidget {
  final CourseRepository courseRepository;
  final Course course;
  const AdminHome(
      {Key? key, required this.course, required this.courseRepository})
      : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState(course, courseRepository);
}

class _AdminHomeState extends State<AdminHome> {
  CourseRepository courseRepository;
  Course course;
  _AdminHomeState(this.course, this.courseRepository);

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
    final quiz_qn = [
      ' hbjhdfnnkf sfsf sjs hf kjdf s',
      'chbjsdjfs jasdv java is jbjasdcjgbgvjhjhgj',
      'cshdvcmxcbnzxc z',
      'cvsdawjdeansbd',
      'cznhscnzxczdsasdasdA'
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
                height: 100,
                child: Center(
                  child: Row(
                    children: [
                      const Text(
                        'Courses',
                        style: TextStyle(fontSize: 30),
                      ),
                      RaisedButton(
                        color: Color.fromARGB(255, 253, 253, 253),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () =>
                            {GoRouter.of(context).go('/addcourse')},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 230,
                      height: 130,
                      padding: new EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: colors[index % 6],
                        // elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 7)),
                            ListTile(
                              title: Text(courses.elementAt(index).title,
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              subtitle: Text(
                                  courses.elementAt(index).description,
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color.fromARGB(255, 0, 0, 0))),
                            ),
                            ButtonBar(
                              children: <Widget>[
                                RaisedButton(
                                  color: colors[index % 6],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  onPressed: () {
                                    GoRouter.of(context).go('/updatecourse');
                                  },
                                ),
                                RaisedButton(
                                    color: colors[index % 6],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    onPressed: () {
                                      showDialog<void>(
                                        context: context,
                                        // barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              title: Text('Beaware!'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text(
                                                        'Are you sure want delete this course?'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                RaisedButton(
                                                  child: Text('Yes'),
                                                  onPressed: () {
                                                    BlocProvider.of<CourseBloc>(
                                                            context)
                                                        .add(DeleteCourse(
                                                            courses
                                                                    .elementAt(
                                                                        index)
                                                                    .id ??
                                                                0));
                                                    context.go('/insthome');
                                                  },
                                                ),
                                                RaisedButton(
                                                  child: const Text('No'),
                                                  onPressed: () {
                                                    context.go('/adminhome');
                                                  },
                                                ),
                                              ]);
                                        },
                                      );
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  children: [
                    const Text(
                      'quiz',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30),
                    ),
                    RaisedButton(
                      color: Color.fromARGB(255, 253, 253, 253),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.list,
                        color: Colors.black,
                      ),
                      onPressed: () => {GoRouter.of(context).go('/quizlist')},
                    )
                  ],
                ),
                height: 50,
              ),
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
                              child: Column(
                            children: [
                              Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      color: colors[index % 6]),
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(children: [
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
                                        ),
                                        ButtonBar(
                                          children: <Widget>[
                                            RaisedButton(
                                              color: colors[index % 6],
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: const Icon(
                                                Icons.edit,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              onPressed: () {
                                                GoRouter.of(context)
                                                    .go('/courseupdate');
                                              },
                                            ),
                                            RaisedButton(
                                              color: colors[index % 6],
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              onPressed: () {/* ... */},
                                            ),
                                          ],
                                        ),
                                      ]))),
                            ],
                          )

                              
                              )
                        ]);
                      }))
            ]));

            
          }
          return const CircularProgressIndicator();
        },
        
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// import '../Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Bloc/courseState.dart';
// import 'Bloc/courseState.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
    return Scaffold(
        appBar: AppBar(title: Text("My Dashboard")),
        drawer: Drawer(
          backgroundColor: Colors.blue[50],
          child: ListView(children: [
            DrawerHeader(
                margin: EdgeInsets.only(top: 90),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/react.jpg"),
                      ),
                    ),
                    Text(
                      "Madeline stephen",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("email: mad@gmail.com")
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.home),
                  Text(
                    "Back To Home",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.adb),
                  Text("My Progress", style: TextStyle(fontSize: 15))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.logout),
                  Text(
                    "Logout",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  )
                ],
              ),
            )
          ]),
        ),
        body: BlocBuilder<CourseBloc, CourseState>(builder: (_, state) {
          if (state is FailureOperation) {
            return const Text('Could not do course operation');
          }

          if (state is SuccessOperation) {
            final courses = state.courses;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 100, top: 20),
                    child: Text(
                      "My courses",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                      height: 500,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: courses.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                margin: EdgeInsets.only(
                                    right: 40, left: 40, top: 20, bottom: 5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    color: colors[index % 6]),
                                height: 100,
                                child: Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  courses
                                                      .elementAt(index)
                                                      .title,
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                              Text(
                                                  courses
                                                      .elementAt(index)
                                                      .description,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black38)),
                                            ]),
                                        ElevatedButton.icon(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color.fromARGB(
                                                            255, 2, 39, 69))),
                                            onPressed: () {
                                              context.go("/watch_video");
                                            },
                                            icon: Icon(Icons.video_call),
                                            label: Text("video"))
                                      ],
                                    )));
                          }))
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        }));
  }
}

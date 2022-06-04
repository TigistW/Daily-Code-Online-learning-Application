import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mobile_app/Course/Screen/admin_home.dart';
import 'package:mobile_app/Course/Screen/UserDashboard.dart';
import 'package:mobile_app/Course/Screen/catagory.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/main.dart';

class CourseArgument {
  final Course? course;
  final bool edit;
  CourseArgument({this.course, required this.edit});
}

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
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
  // late final Course course;
  final pages = [
    AdminHome(
      course: Course(
          id: 1, code: "", title: "", description: ""), //just for initalization
      courseRepository: CourseRepository(CourseDataProvider()),
    ),
    Dashboard()
  ];

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentindex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black26,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            elevation: 0,
            iconSize: 20,
            selectedFontSize: 25,
            selectedLabelStyle: TextStyle(fontSize: 5),
            unselectedLabelStyle: TextStyle(fontSize: 5),
            currentIndex: currentindex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Adminhome'),
              // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: 'Dashboard'),
            ],
            onTap: (index) {
              // this has changed
              setState(() {
                currentindex = index;
              });
            }));
  }
}

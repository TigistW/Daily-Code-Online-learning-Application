import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mobile_app/Course/Screen/UserDashboard.dart';
import 'package:mobile_app/Course/Screen/catagory.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/main.dart';

class Navigotor extends StatefulWidget {
  const Navigotor({Key? key}) : super(key: key);

  @override
  State<Navigotor> createState() => _NavigotorState();
}

class _NavigotorState extends State<Navigotor> {
  final title = [
    "React",
    "Html & css",
    "JavaScript",
    "Python",
    "Spring Boot",
    "Java"
  ];
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
  final pages = [
    Catagory(
      course: Course(
          id: 1,
          code: "",
          title: "",
          description:
              ""), //just for initalization because it is required but we use course from the backend provided
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
                  icon: Icon(Icons.category), label: 'Catagory'),
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

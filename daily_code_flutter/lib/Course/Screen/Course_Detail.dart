// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';

class Detail extends StatelessWidget {
  Course course;
  Detail({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/galaxy.jpg"),
              fit: BoxFit.cover,
            )),
            child: Stack(clipBehavior: Clip.none, children: [
              Positioned(
                  top: 200,
                  left: 110,
                  child: Container(
                      // margin: EdgeInsets.only(top: 50)
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 2, 43, 76),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topRight: Radius.circular(30))))),
              Positioned(
                top: 150,
                left: 130,
                child: Container(
                    child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/react.jpg"),
                      )),
                  Text(
                    "Welcome to the programming ${course.title}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ])),
              ),
            ]),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.only(top: 40, left: 40, right: 40),
            width: double.infinity,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    "By learning this course there would be alot of outcomes so have fun learning ${course.description}",
                    // course.description,
                    style: TextStyle(fontSize: 15, color: Colors.black45)),
                Container(
                    margin: EdgeInsets.only(left: 250),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          context.go("/dashboard");
                        },
                        icon: Icon(Icons.app_registration),
                        label: Text("Enroll")))
              ],
            ),
          )
        ],
      ),
    );
  }
}

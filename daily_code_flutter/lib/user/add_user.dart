import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_background/animated_background.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/user/usermodel/user.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class AddUser extends StatefulWidget {
  AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();
  User user =
      User(email: '', firstname: '', lastname: '', password: '', role: '');
  String url = "http://localhost:8080/addNewUser";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'firstname': user.firstname,
          'lastname': user.lastname,
          'email': user.email,
          'password': user.password,
          'role': user.role
        }));
    print(res.body);
    if (res.body != null) {
      context.go("/userlist");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 60, left: 140),
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: SvgPicture.asset(
            "assets/register.svg",
            width: 250,
            height: 100,
          ),
        ),

        Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextFormField(
                        controller: TextEditingController(text: user.firstname),
                        onChanged: (val) {
                          user.firstname = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email info';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: "Firstname",
                            icon: Icon(
                              Icons.accessibility_sharp,
                              color: Colors.blue[100],
                            )),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextFormField(
                        controller: TextEditingController(text: user.lastname),
                        onChanged: (val) {
                          user.lastname = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lastname';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: "lastname",
                            icon: Icon(
                              Icons.accessibility_new_outlined,
                              color: Colors.blue[100],
                            )),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (val) {
                          user.email = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: "email",
                            icon: Icon(
                              Icons.accessibility_new_outlined,
                              color: Colors.blue[100],
                            )),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextFormField(
                        controller: TextEditingController(text: user.password),
                        onChanged: (val) {
                          user.password = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: "password",
                            icon: Icon(
                              Icons.accessibility_new_outlined,
                              color: Colors.blue[100],
                            )),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextFormField(
                        controller: TextEditingController(text: user.role),
                        onChanged: (val) {
                          user.role = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'role';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: "assign Role",
                            icon: Icon(
                              Icons.accessibility_new_outlined,
                              color: Colors.blue[100],
                            )),
                      )),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shadowColor: MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      context.go("/login");
                    },
                    child: Text("Already have an account.. Signin",
                        style: TextStyle(color: Colors.black, fontSize: 10))),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 1, 28, 50))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        save();
                      }
                      // context.go('/addcourse');
                    },
                    child: Text("Add")),
              ],
            ))

      
      ]),
    ));
  }
}

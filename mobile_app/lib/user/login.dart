import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/user/register.dart';
import 'package:mobile_app/user/usermodel/user.dart';
import 'package:http/http.dart' as http;

class EmailValidator {
  static validate(value) {
    return value.isEmpty ? 'email can not be empty' : null;
  }
}

class PasswordValidator {
  static validate(value) {
    return value.isEmpty ? 'password can not be empty' : null;
  }
}

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  User user =
      User(email: '', firstname: '', lastname: '', password: '', role: '');
  String url = "http://localhost:8080/auth";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*"
        },
        body: json.encode({
          'firstname': user.firstname,
          'lastname': user.lastname,
          'email': user.email,
          'password': user.password,
          'role': user.role
        }));

    if (res.body.isEmpty) {
      context.go(
          "/error"); // here the user will be authenticated and authorised and based on its role it will be redirected to different pages
    } else if (res.body.contains('Admin')) {
      context.go("/userlist");
    } else if (res.body.contains('user')) {
      context.go('/catagory');
    } else if (res.body.contains('Instructur')) {
      context.go('/insthome');
    }
    // return res.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/hero-bg.png"),
              fit: BoxFit.cover,
            )),
            // color: Color.fromARGB(255, 1, 16, 29),
            child: Container(
                margin: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      "Welcome back",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        "assets/lock.svg",
                        width: 300,
                        height: 200,
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
                                  height: 70,
                                  child: TextFormField(
                                    key: ValueKey('email'),
                                    controller:
                                        TextEditingController(text: user.email),
                                    onChanged: (val) {
                                      user.email = val;
                                    },
                                    validator: (value) =>
                                        EmailValidator.validate(value),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.blue[50],
                                        hintText: "Email",
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
                                  height: 70,
                                  child: TextFormField(
                                    key: ValueKey('password'),
                                    controller: TextEditingController(
                                        text: user.password),
                                    onChanged: (val) {
                                      user.password = val;
                                    },
                                    validator: (value) =>
                                        PasswordValidator.validate(value),
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
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.white)),
                                onPressed: () {
                                  context.go("/register");
                                },
                                child: Text("Don't have an account.. Signup",
                                    style: TextStyle(color: Colors.black))),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 1, 28, 50))),
                                onPressed: () {
                                  // if (_formKey.currentState!.validate()) {
                                  save();
                                },
                                child: Text("login")),
                          ],
                        ))
                  ],
                ))));
  }
}

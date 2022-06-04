import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/Course/Bloc/courseBloc.dart';
import 'package:mobile_app/Course/Bloc/courseEvent.dart';
// import 'package:mobile_app/Model/courseModel.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';

class FormApp extends StatelessWidget {
  const FormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form Demo',
      theme: ThemeData(brightness: Brightness.light),
      home: const FormPage(
        title: 'ADD COURSE',
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddCourse createState() => _AddCourse();
}

class _AddCourse extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromARGB(31, 56, 71, 85),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: addCourse()),
    );
  }
}

class addCourse extends StatefulWidget {
  @override
  _addCourseState createState() => _addCourseState();
}

class _addCourseState extends State<addCourse> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> courses = {};

  bool _termsChecked = true;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: ListView(
        children: getFormWidget(),
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];

    formWidget.add(Container(
      margin: EdgeInsets.only(
        top: 150,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Add',
                  // ignore: unnecessary_const
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.black45,
                            offset: Offset(1, 1),
                            blurRadius: 5)
                      ]),
                ),
                const Text(
                  ' Course',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 5, 39, 53),
                      shadows: [
                        Shadow(
                            color: Colors.black45,
                            offset: Offset(1, 1),
                            blurRadius: 5)
                      ]),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIconConstraints: const BoxConstraints(minWidth: 45),
                border: InputBorder.none,
                hintText: 'Enter Course Title',
                hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.5),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)
                        .copyWith(bottomRight: const Radius.circular(0)),
                    borderSide:
                        const BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100)
                      .copyWith(bottomRight: const Radius.circular(0)),
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the course title';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  courses["title"] = value;
                });
              },
            ),
          ),
        ],
      ),
    ));

    formWidget.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(minWidth: 45),
          border: InputBorder.none,
          hintText: 'Enter Course Description',
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 3, 3, 3), fontSize: 14.5),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100)
                  .copyWith(bottomRight: const Radius.circular(0)),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100)
                .copyWith(bottomRight: const Radius.circular(0)),
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter the course discription';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          setState(() {
            courses["description"] = value;
          });
        },
      ),
    ));

    formWidget.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(minWidth: 45),
          border: InputBorder.none,
          hintText: 'Enter Course Code',
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.5),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100)
                  .copyWith(bottomRight: const Radius.circular(0)),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100)
                .copyWith(bottomRight: const Radius.circular(0)),
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter the Course Code';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          setState(() {
            courses["code"] = value;
          });
        },
      ),
    ));

    void onPressedSubmit() {
      final form = _formKey.currentState;
      if (form != null && form.validate()) {
        form.save();
        final CourseEvent event = CreateCourse(
          Course(
            id: null,
            code: courses["code"],
            title: courses["title"],
            description: courses["description"],
          ),
        );
        BlocProvider.of<CourseBloc>(context).add(event);
        context.go("/insthome");

        print("courseName " + courses['title']);
        print("email " + courses['description']);
        print("CourseCode " + courses['code']);

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Form Submitted')));
      }
    }

    formWidget.add(
      Container(
        margin: EdgeInsets.only(left: 150, right: 150),
        child: ElevatedButton(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 10, color: Color.fromARGB(255, 252, 253, 253))),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 24, 34, 54))),
          child: const Text('Add Course'),
          onPressed: onPressedSubmit,
        ),
      ),
    );

    return formWidget;
  }
}

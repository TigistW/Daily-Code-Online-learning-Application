import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/quiz_bloc.dart';
import '../bloc/quiz_event.dart';
import '../models/quiz.dart';

class QuizFormApp extends StatelessWidget {
  const QuizFormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Quiz',
      theme: ThemeData(brightness: Brightness.light),
      home: const FormPage(
        title: 'Add Quiz',
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddQuiz createState() => _AddQuiz();
}

class _AddQuiz extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromARGB(31, 56, 71, 85),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: addQuiz()),
    );
  }
}

class addQuiz extends StatefulWidget {
  @override
  _addQuizState createState() => _addQuizState();
}

class _addQuizState extends State<addQuiz> {
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
                  ' Quiz',
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
                hintText: 'Quiz name',
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
                  return 'Please enter the quiz title';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  courses["name"] = value;
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
          hintText: 'Quiz Description',
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
            return 'Please enter the quiz discription';
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

    

    void onPressedSubmit() {
      final form = _formKey.currentState;
      if (form != null && form.validate()) {
        form.save();
        final QuizEvent event = QuizCreate(
          Quiz(
            id: 1,
            name: courses["name"],
            description: courses["description"],
          ),
        );
        BlocProvider.of<QuizBloc>(context).add(event);
        context.go("/quizlist");

        print("name " + courses['name']);
        print("dscription " + courses['description']);

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
          child: const Text('Add Quiz'),
          onPressed: onPressedSubmit,
        ),
      ),
    );
    return formWidget;
  }
}

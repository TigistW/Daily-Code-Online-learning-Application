// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_network/course/bloc/bloc.dart';
// import 'package:flutter_network/course/course.dart';
import 'package:go_router/go_router.dart';

import '../bloc/quiz_bloc.dart';
import '../bloc/quiz_state.dart';
import '../models/quiz.dart';
import '../repository/quiz_repository.dart';

class QuizList extends StatefulWidget {
  final QuizRepository quizRepository;
  final Quiz quiz;
  const QuizList({Key? key, required this.quiz, required this.quizRepository})
      : super(key: key);

  @override
  State<QuizList> createState() => _QuizListState(quiz, quizRepository);
}

class _QuizListState extends State<QuizList> {
  QuizRepository quizRepository;
  Quiz quiz;
  _QuizListState(this.quiz, this.quizRepository);

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
      "react.jpg",
      "html.jpeg",
      "js.png",
      "python.png",
      "spring.png",
      "java.jpg"
    ];

    return Scaffold(
        appBar: AppBar(title: Text("Quiz List"), actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.go("/addquiz");
            },
          ),
        ]),
        body: BlocBuilder<QuizBloc, QuizState>(builder: (_, state) {
          if (state is QuizOperationFailure) {
            return const Text('Could not do Quiz operation');
          }

          if (state is QuizesLoadSuccess) {
            final quizes = state.quizes;
            return ListView.builder(
              itemCount: quizes.length,
              itemBuilder: (_, idx) => ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.black, width: 0.2)),
                title: Text(quizes.elementAt(idx).name),
                onTap: () {
                  showDialog<void>(
                      context: context,
                      // barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Answer'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                    'the answer for this question ${quizes.elementAt(idx).description}'),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        }));
  }
}

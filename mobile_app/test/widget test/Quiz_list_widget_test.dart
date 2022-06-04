import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/quiz/data_provider/data_provider.dart';
import 'package:mobile_app/quiz/models/quiz.dart';
import 'package:mobile_app/quiz/repository/quiz_repository.dart';
import 'package:mobile_app/quiz/screens/quiz_list.dart';

void main() {
  testWidgets('testing widgets', (WidgetTester tester) async {
    final titleFinder = find.text('Text');
    await tester.pumpWidget(MaterialApp(
        home: QuizList(
      quizRepository: QuizRepository(QuizDataProvider()),
      quiz: Quiz(id: 1, name: '', description: ''),
    )));
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('element less than 5 will not scroll',
      (WidgetTester tester) async {
    list:
    List.generate(5, (index) => "view $index");
    await tester.pumpWidget(MaterialApp(
        home: QuizList(
      quizRepository: QuizRepository(QuizDataProvider()),
      quiz: Quiz(id: 1, name: '', description: ''),
    )));

    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pump();
    final first = find.text('Title 0');
    expect(first, findsOneWidget);
  });
  testWidgets('element greater than 5 will  scroll',
      (WidgetTester tester) async {
    list:
    List.generate(100, (index) => "view $index");
    await tester.pumpWidget(MaterialApp(
        home: QuizList(
      quizRepository: QuizRepository(QuizDataProvider()),
      quiz: Quiz(id: 1, name: '', description: ''),
    )));

    await tester.drag(find.byType(ListView), const Offset(0, -300));
    final first = find.text('Title 0');
    expect(first, findsOneWidget);
  });
  // await tester.pump
}

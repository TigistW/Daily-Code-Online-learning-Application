import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/quiz/screens/quiz_add_update.dart';
import 'package:mobile_app/user/register.dart';

void main() {
  testWidgets('register', (WidgetTester tester) async {
    final firstname = find.byKey(ValueKey('firstname'));
    final lastname = find.byKey(ValueKey('lastname'));

    await tester.pumpWidget(MaterialApp(home: QuizFormApp()));
    await tester.enterText(firstname, 'mekdi');
    await tester.enterText(lastname, 'mekdi');

    expect(find.text('text'), findsOneWidget);
  });
  testWidgets('addQuiz', (WidgetTester tester) async {
    final loadFromDatabase = find.byKey(ValueKey('load'));

    await tester.pumpWidget(MaterialApp(
      home: QuizFormApp(),
    ));
    await tester.tap(loadFromDatabase);
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('registered'), findsOneWidget);
  });
}

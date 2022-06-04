import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/user/register.dart';

void main() {
  // testWidgets('Reverse string widget test', (WidgetTester tester) async {
  //   await tester.pumpWidget( MyApp(courseRepository: CourseRepository(CourseDataProvider()));
  //   var textField = find.byType(TextField);
  //   expect(textField, findsOneWidget);
  //   await tester.enterText(textField, 'Hello');
  //   expect(find.text('Hello'), findsOneWidget);
  //   var button = find.text("Reverse");
  //   expect(button,findsOneWidget);
  //   await tester.tap(button);
  //   await tester.pump();
  //   expect(find.text("olleH"),findsOneWidget);
  // });

  testWidgets('register', (WidgetTester tester) async {
    final firstname = find.byKey(ValueKey('firstname'));
    final lastname = find.byKey(ValueKey('lastname'));
    final email = find.byKey(ValueKey('email'));
    final password = find.byKey(ValueKey('lastname'));
    final registerButton = find.byKey(ValueKey('register'));

    await tester.pumpWidget(MaterialApp(home: Register()));
    await tester.enterText(firstname, 'mekdi');
    await tester.enterText(lastname, 'mekdi');
    await tester.enterText(email, 'mekdi');
    await tester.enterText(password, 'mekdi');

    expect(find.text('text'), findsOneWidget);
  });
  testWidgets('addUser', (WidgetTester tester) async {
    final loadFromDatabase = find.byKey(ValueKey('load'));

    await tester.pumpWidget(MaterialApp(
      home: Register(),
    ));
    await tester.tap(loadFromDatabase);
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('registered'), findsOneWidget);
  });
}

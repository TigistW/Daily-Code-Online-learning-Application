import 'package:flutter/material.dart';
import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/user/login.dart';
import 'package:mobile_app/user/register.dart';

void main() {
  testWidgets('register', (WidgetTester tester) async {
    final email = find.byKey(ValueKey('email'));
    final password = find.byKey(ValueKey('lastname'));
    final registerButton = find.byKey(ValueKey('register'));

    await tester.pumpWidget(MaterialApp(home: Login()));

    await tester.enterText(email, 'mekdi');
    await tester.enterText(password, 'mekdi');

    expect(find.text('text'), findsOneWidget);
  });

  testWidgets('addUser', (WidgetTester tester) async {
    final loadFromDatabase = find.byKey(ValueKey('load'));

    await tester.pumpWidget(MaterialApp(
      home: Login(),
    ));
    await tester.tap(loadFromDatabase);
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('registered'), findsOneWidget);
  });
}

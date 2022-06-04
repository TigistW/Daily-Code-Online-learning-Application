import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/Course/Screen/Course_Detail.dart';

void main() {
  testWidgets('testing widgets', (WidgetTester tester) async {
    final titleFinder = find.text('Text');
    await tester.pumpWidget(MaterialApp(
        home: Detail(
      course: Course(
          id: 1,
          code: "678",
          title: "html",
          description: "lesson to give you a good view to html"),
    )));
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('icon testing', (WidgetTester tester) async {
    final findIcon = find.byIcon(Icons.app_registration);
    await tester.pumpWidget(MaterialApp(
        home: Detail(
      course: Course(
          id: 1,
          code: "678",
          title: "html",
          description: "lesson to give you a good view to html"),
    )));
    expect(findIcon, findsOneWidget);
  });
  // await tester.pump
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mobile_app/Course/Screen/admin_home.dart';
import 'package:mobile_app/Course/Screen/admin_home.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home:  AdminHome(
      course: Course(id: 1, code: "678", title: "html", description: "dbcjdhb"),
      courseRepository: CourseRepository(CourseDataProvider()),
    ),));
    items:
    List<String>.generate(10000, (i) => 'Item $i');

    final listFinder = find.byType(SingleChildScrollView);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    // Verify that the item contains the correct text.
    expect(itemFinder, findsOneWidget);
  });

   testWidgets('testing widgets', (WidgetTester tester) async {
    final titleFinder = find.text('Text');
    await tester.pumpWidget(MaterialApp(home:  AdminHome(
      course: Course(id: 1, code: "678", title: "html", description: "dbcjdhb"),
      courseRepository: CourseRepository(CourseDataProvider()),
    ),));
    expect(titleFinder, findsOneWidget);
  });
}

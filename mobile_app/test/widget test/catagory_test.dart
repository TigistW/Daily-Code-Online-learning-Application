import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/Course/Data_provider/courseDataProvider.dart';
import 'package:mobile_app/Course/Model/coursemodel.dart';
import 'package:mobile_app/Course/Repository/courseRepository.dart';
import 'package:mobile_app/Course/Screen/catagory.dart';

void main() {
  testWidgets('testing widgets', (WidgetTester tester) async {
    final titleFinder = find.text('Text');
    await tester.pumpWidget(MaterialApp(
      home: Catagory(
        course:
            Course(id: 1, code: "678", title: "html", description: "dbcjdhb"),
        courseRepository: CourseRepository(CourseDataProvider()),
      ),
    ));
    expect(titleFinder, findsOneWidget);
  });

  // await tester.pump
}

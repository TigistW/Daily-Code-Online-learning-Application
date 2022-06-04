import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/Course/Screen/UserDashboard.dart';

void main() {
  testWidgets('testing widgets', (WidgetTester tester) async {
    final titleFinder = find.text('Text');
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('homeicon', (WidgetTester tester) async {
    final findIcon = find.byIcon(Icons.home);
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    expect(findIcon, findsOneWidget);
  });
  testWidgets('adbicon', (WidgetTester tester) async {
    final findIcon = find.byIcon(Icons.adb);
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    expect(findIcon, findsOneWidget);
  });
  testWidgets('logouticon', (WidgetTester tester) async {
    final findIcon = find.byIcon(Icons.logout);
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    expect(findIcon, findsOneWidget);
  });
  testWidgets('icon testing', (WidgetTester tester) async {
    final findIcon = find.byIcon(Icons.home);
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    expect(findIcon, findsOneWidget);
  });

  testWidgets('element less than 5 will not scroll',
      (WidgetTester tester) async {
    list:
    List.generate(5, (index) => "view $index");
    await tester.pumpWidget(MaterialApp(home: Dashboard()));

    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pump();
    final first = find.text('Title 0');
    expect(first, findsOneWidget);
  });
  testWidgets('element greater than 5 will  scroll',
      (WidgetTester tester) async {
    list:
    List.generate(100, (index) => "view $index");
    await tester.pumpWidget(MaterialApp(home: Dashboard()));

    await tester.drag(find.byType(ListView), const Offset(0, -300));
    final first = find.text('Title 0');
    expect(first, findsOneWidget);
  });
  // await tester.pump
}
